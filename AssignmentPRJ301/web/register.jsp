
<%-- 
    Document   : register
    Created on : Jul 6, 2025, 8:21:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO" %>
<%@page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%
            if (AuthUtils.isLoggedIn(request)) {
                response.sendRedirect("welcome.jsp");
            } else {
                UserDTO user = (UserDTO) request.getAttribute("user");
                String message = (String) request.getAttribute("message");
                String checkError = (String) request.getAttribute("checkError");
        %>
         <a href="login.jsp">← Back to Login</a>
        <% if (checkError != null && !checkError.isEmpty()) { %>
            <div class="message error" style="color: red;"><%= (checkError != null) ? checkError : ""%></div>
        <% } else if (message != null && !message.isEmpty()) { %>
            <div class="message success" style="color: green;"><%= (message != null) ? message: "" %></div>
        <% } %>

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="register" />
            User Name: 
            <input type="text" name="userName" value="<%= user != null && user.getUserName() != null ? user.getUserName() : "" %>" /><br/>
            
            Full Name: 
            <input type="text" name="fullName" value="<%= user != null && user.getFullName() != null? user.getFullName() : "" %>" /><br/>
            
            Email: 
            <input type="email" name="email" value="<%= user != null && user.getEmail() != null? user.getEmail() : "" %>" /><br/>
            
            Password: 
            <input type="password" name="password" /><br/>
            
            Phone: 
            <input type="text" name="phone" value="<%= user != null && user.getPhone() != null? user.getPhone() : "" %>" /><br/>
            
            Address: 
            <input type="text" name="address" value="<%= user != null && user.getAddress() != null? user.getAddress() : "" %>" /><br/>
            
            <input type="submit" value="Register" />
            <input type="reset" value="Reset" />
        </form>

        <%
            } 
        %>
    </body>
</html>
