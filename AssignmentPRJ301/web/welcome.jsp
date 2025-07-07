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
        <h1>Welcome <%= user.getFullName() %>!</h1> 
        <a href="MainController?action=logout" >Log Out</a> <br>

        
        <form action="MainController" method="action">
            <input type="hidden" name="action" value="search"/>
            <input type="text" name="productName"/><br/>
            <input type="submit" value ="search"/>
        </form>
        <% } else { %>
            <%= AuthUtils.getAccessDeniedMessage("welcome.jsp") %><br/>
            (Or <a href="<%= AuthUtils.getLoginURL() %>">Login</a>)
        <% } %>
    </body>
</html>
