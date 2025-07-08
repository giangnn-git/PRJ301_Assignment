<%-- 
    Document   : cart
    Created on : Jul 8, 2025, 3:55:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CartDTO"%>
<%@page import="model.CartItemDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Your Cart</title>
    </head>
    <body>

        <%
            if (AuthUtils.isLoggedIn(request)) {
                CartDTO cart = (CartDTO) session.getAttribute("cart");
        %>

        <h2>Your Cart</h2>

        <%
            if (cart == null || cart.getItems().isEmpty()) {
        %>
        <p>Your cart is empty.</p>
        <%
            } else {
        %>
        <table border="1" cellpadding="5">
            <tr>
                <th>Product</th>
                <th>Unit Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <%
                for (CartItemDTO item : cart.getItems()) {
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td><%= item.getUnitPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= item.getTotalPrice() %></td>
            </tr>
            <%
                }
            %>

            <tr>
                <td colspan="3" align="right"><strong>Total Amount:</strong></td>
                <td><strong><%= cart.getTotalAmount() %> VND</strong></td>
            </tr>
        </table>
        <%
            }
        %>

        <%
            } else {
        %>
        <div style="color: red; font-weight: bold;">
            <%= AuthUtils.getAccessDeniedMessage("cart.jsp") %><br/>
            (Or <a href="<%= AuthUtils.getLoginURL() %>">Login</a>)
        </div>
        <%
            }
        %>

        <br>
        <a href="menu.jsp">← Back to Menu</a>

    </body>
</html>


