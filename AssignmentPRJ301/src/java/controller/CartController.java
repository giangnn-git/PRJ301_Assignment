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
import model.CartDAO;
import model.CartDTO;
import model.CartItemDTO;
import model.ProductDAO;
import model.ProductDTO;
import model.UserDTO;
import utils.AuthUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {
    
    CartDAO dao = new CartDAO();

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
        String url = "";
        try {
            String action = request.getParameter("action");
            if ("addCart".equals(action)) {
                url = handleAddCart(request, response);
            }
        } catch (Exception e) {
            e.getMessage();
        } finally {
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

    private String handleAddCart(HttpServletRequest request, HttpServletResponse response) {
        if (!AuthUtils.isLoggedIn(request)) {
            request.setAttribute("message", "Please log in to use the cart.");
            return "login.jsp";  
        }


    try {
        UserDTO user = AuthUtils.getCurrentUser(request);

        // ====== productId ======
        int productId = -1;
        try {
            productId = Integer.parseInt(request.getParameter("productId"));
            if (productId <= 0) {
                request.setAttribute("errorMessage", "Invalid product selected.");
                return "menu.jsp";
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid product ID.");
            return "menu.jsp";
        }

        // ====== quantity ======
        int quantity = 1;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity < 1 || quantity > 10) {
                request.setAttribute("errorMessage", "Quantity must be between 1 and 20.");
                return "menu.jsp";
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid quantity.");
            return "menu.jsp";
        }

        
        ProductDAO pdao = new ProductDAO();
        ProductDTO product = pdao.getProductById(productId);

        if (product == null) {
            request.setAttribute("errorMessage", "Product not found.");
            return "menu.jsp";
        }

        // ====== Build and add item ======
        CartDAO cartDAO = new CartDAO();
        int cartId = cartDAO.getOrCreateCartId(user.getUserId());
        CartItemDTO item = new CartItemDTO(productId, product.getProductName(), product.getPrice(), quantity);
        cartDAO.addOrUpdateItem(cartId, item);

        // Update cart in session
        CartDTO cart = new CartDTO(cartId, user.getUserId());
        cart.setItems(cartDAO.getCartItems(cartId));
        request.getSession().setAttribute("cart", cart);

        request.setAttribute("message", "Added to cart successfully!");
        return "menu.jsp"; // 
        
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Unexpected error occurred.");
        return "menu.jsp";
    }
}



}
