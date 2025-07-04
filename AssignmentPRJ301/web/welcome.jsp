<%-- 
    Document   : welcome
    Created on : Jul 4, 2025, 10:57:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO" %>
<%@page import="utils.AuthUtils" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (AuthUtils.isLoggedIn(request)) {
                UserDTO user = AuthUtils.getCurrentUser(request);
                String keyword = (String) request.getAttribute("keyword");
        %>
        <h1>Welcome <%= user.getName() %>!</h1> <br>
                <a href="MainController?action=logout" class="logout-link">Log Out</a>

    </body>
</html>
