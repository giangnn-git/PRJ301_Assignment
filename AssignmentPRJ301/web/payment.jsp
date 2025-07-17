<%-- 
    Document   : payment
    Created on : Jul 16, 2025, 12:16:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.AuthUtils" %>
<%@page import="java.util.List" %>
<%@page import="model.PaymentDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String message = (String)request.getAttribute("message"); %>
        <img src="/image/qr.jsp" alt="alt"/>
        <p>please write down phone number in message</p>
        <%if(AuthUtils.isAdmin(request)){%>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="amtc"/>
            <input type="text" name="phone"/>
            <input type="number" name="money"/>
            <input type="text" name="ma"/>
            <input type="submit" value="naptien"/>
        </form>
        
        <%=message!=null?message:""%>
        <%}%>
        <%String action = (String) request.getAttribute("action");
        if(action !=null && action.equals("paymentHistory")){%>
        <table>
            <thead>
            <th>So dien thoai</th>
            <th>Tien</th>
            <th>Ma</th>
            </thead>
            <tbody>
                <%List<PaymentDTO> list = (List<PaymentDTO>) session.getAttribute("list");
                if(list!=null && !list.isEmpty()){
                for(PaymentDTO p : list){%>
                <tr><%=p.getPhone()%></tr>
                <tr><%=p.getMoney()%></tr>
                <tr><%=p.getMa()%></tr>
                <%      }
                    }
                }%>
            </tbody>
        </table>
    </body>
</html>
