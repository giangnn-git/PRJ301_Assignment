<%-- 
    Document   : orders
    Created on : Jul 9, 2025, 8:36:12 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.OrderDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>All Orders</title>
</head>
<body>

<h2>All Orders</h2>

<%
    String msg = (String) request.getAttribute("message");
    String err = (String) request.getAttribute("checkError");
    if (msg != null) { %>
        <p style="color: green;"><%= msg %></p>
<% } else if (err != null) { %>
        <p style="color: red;"><%= err %></p>
<% } %>

<%
    List<OrderDTO> orders = (List<OrderDTO>) request.getAttribute("orders");
    if (orders != null && !orders.isEmpty()) {
%>
    <table border="1" cellpadding="5">
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>Total</th>
            <th>Date</th>
            <th>Status</th>
            <th>Shipping</th>
            <th>Action</th>
        </tr>
<%
        for (OrderDTO o : orders) {
%>
        <tr>
            <td><%= o.getOrderId() %></td>
            <td><%= o.getUserId() %></td>
            <td><%= o.getTotalAmount() %></td>
            <td><%= o.getOrderDate() %></td>
            <td><%= o.getStatus() %></td>
            <td><%= o.getShippingAddress() %></td>
            <td>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="updateOrderStatus"/>
                    <input type="hidden" name="orderId" value="<%= o.getOrderId() %>"/>
                    <select name="newStatus">
                        <option value="PENDING" <%= o.getStatus().equals("PENDING") ? "selected" : "" %>>PENDING</option>
                        <option value="CONFIRMED" <%= o.getStatus().equals("CONFIRMED") ? "selected" : "" %>>CONFIRMED</option>
                        <option value="DELIVERED" <%= o.getStatus().equals("DELIVERED") ? "selected" : "" %>>DELIVERED</option>
                        <option value="CANCELED" <%= o.getStatus().equals("CANCELED") ? "selected" : "" %>>CANCELED</option>
                    </select>
                    <input type="submit" value="Update"/>
                </form>
            </td>
        </tr>
<%      }
    } else {
%>
        <p>No orders found.</p>
<% } %>

</body>
</html>
