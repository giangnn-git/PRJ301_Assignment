<%-- 
    Document   : menu
    Created on : Jul 7, 2025, 7:58:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProductDTO" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>

        <%
            String error = (String) request.getAttribute("checkError");
            String message = (String) request.getAttribute("message");
        %>

        <% if (error != null && !error.isEmpty()) { %>
        <div style="color: red; font-weight: bold; margin-bottom: 10px;">
            <%= error %>
        </div>
        <% } %>

        <% if (message != null && !message.trim().isEmpty()) { %>
        <div style="color: green; font-weight: bold; margin-bottom: 10px;">
            <%= message %>
        </div>
        <% } %>

        <%
            List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("list");
            if (list != null) {
                for (ProductDTO p : list) {
        %>

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="addCart"/>
            <input type="hidden" name="productId" value="<%= p.getProductId() %>">

            <div>
                <img src="<%= p.getImageUrl() %>" width="200" height="150" alt="product image">
                <h3><%= p.getProductName() %></h3>
                <p><%= p.getDescription() %></p>
                <p>Price: <%= p.getPrice() %> VND</p> 
                Note: <input type="text" name="note" placeholder="...">  <br> <br>
                Quantity:
                <input type="number" name="quantity" value="1" min="1" max="10"> 
                
                <br><br>
                <input type="submit" value="Add to Cart">
            </div>
        </form>
        <hr>


        <%}%>
        <a href="cart.jsp"">Move to my cart</a>
        <%
         } else {
        %>
        <p>Out of Session!</p>
        <%}%>

    </body>
</html>

