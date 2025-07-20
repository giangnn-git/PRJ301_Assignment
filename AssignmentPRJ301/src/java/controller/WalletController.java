/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.PaymentDAO;
import model.PaymentDTO;
import model.UserDAO;
import model.UserDTO;
import utils.AuthUtils;
import utils.EmailUtils;

/**
 *
 * @author admin
 */
@WebServlet(name = "WalletController", urlPatterns = {"/WalletController"})
public class WalletController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "welcome.jsp";
        String action = request.getParameter("action");

        try {
            if ("amtc".equals(action)) {
                url = handleAddMoneyToCustomers(request, response);
            } else if ("paymentHistory".equals(action)) {
                url = handlePHistory(request, response);
            }
        } catch (Exception e) {
        } finally {
            System.out.println("day la kiem tra url " + url);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String handleAddMoneyToCustomers(HttpServletRequest request, HttpServletResponse response) {
        String message = "";
        String url = "";
        String phone = request.getParameter("phone");
        UserDAO udao = new UserDAO();
        UserDTO user = udao.getUserByPhone(phone);
        int money = Integer.parseInt(request.getParameter("money"));
        String ma = request.getParameter("ma");

        PaymentDAO pdao = new PaymentDAO();

        if (pdao.addMoneyAndNote(phone, money, ma)) {
            System.out.println("5");
            message = "add successfully" + phone;
            udao.tangTien(money, phone);
            EmailUtils.sendTransactionEmail(user.getEmail(),user.getFullName(),user.getPhone(),money,ma);
            url = "cart.jsp";
        } else {
            System.out.println("6");
            message = "Error!!!";
            url = "payment.jsp";
        }
        request.setAttribute("message", message);
        return url;
    }

    private String handlePHistory(HttpServletRequest request, HttpServletResponse response) {
        if (AuthUtils.isLoggedIn(request)) {
            UserDTO user = AuthUtils.getCurrentUser(request);
            PaymentDAO pmdao = new PaymentDAO();
            List<PaymentDTO> list = pmdao.getByPhone(user.getPhone());
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            request.setAttribute("action", action);
            session.setAttribute("list", list);
            return "payment.jsp";
        }
        return "login.jsp";
    }

}
