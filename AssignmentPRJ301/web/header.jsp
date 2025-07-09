<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.UserDTO" %>
<%@ page import="utils.AuthUtils" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
    boolean isAdmin = AuthUtils.isLoggedIn(request) && "ADMIN".equals(user.getRole());
%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="welcome.jsp">Product Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto">
                  <li class="nav-item"><form action="MainController" method="get">
                                    <input type ="hidden" name="action" value="searchName"/>
                                    <input type ="text" name="productName"/>
                                    <input type="submit" value="🔍"/>
                        </form></li>

                <% if (isAdmin) { %>
                    <li class="nav-item"><a class="nav-link" href="productForm.jsp">Add Product</a></li>
                  
                <% } %>

                <li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
            </ul>

            <ul class="navbar-nav ms-auto">
                <% if (AuthUtils.isLoggedIn(request)) { %>
                    <li class="nav-item d-flex align-items-center me-2 text-white">
                        Welcome, <strong>&nbsp;<%= user.getFullName() %></strong>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-light" href="MainController?action=logout">Logout</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="btn btn-primary" href="MainController">Login</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
