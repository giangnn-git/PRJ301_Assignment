<%-- 
    Document   : login
    Created on : Jul 4, 2025, 10:57:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO" %>
<%@page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (AuthUtils.isLoggedIn(request)) {
                response.sendRedirect("welcome.jsp");
            } else {
                Object objMS = request.getAttribute("message");
                String msg = (objMS == null) ? "" : (objMS + "");
        %>
        <div>
            <h2>Login Account</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login"/>

                <div>
                    <label for="userName">User Name:</label>
                    <input type="text" name="strUserName" id="userName" />
                </div>

                <div >
                    <label for="password">Password:</label>
                    <input type="password" name="strPassword" id="password" />
                </div>

                <div >
                    <input type="submit" value="Login"/>
                </div>
            </form>
            <p>No account? <a href="MainController?action=register">Sign up</a></p> 
            <div style="color: red"><%= msg %></div>
        </div>
        <% } %>
    </body>
</html>