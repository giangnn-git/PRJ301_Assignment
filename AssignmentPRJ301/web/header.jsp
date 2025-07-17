<%@ page language="java" %>
<%@ page import="model.UserDTO" %>
<%@ page import="utils.AuthUtils" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
    boolean isAdmin = isLoggedIn && "ADMIN".equals(user.getRole());
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .navbar-custom {
        background: #7b4a10 !important;
        border-radius: 0 0 18px 18px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    }
    .navbar-brand {
        color: #e19f8d !important;
        font-weight: bold;
        font-size: 1.7rem;
        letter-spacing: 1px;
    }
    .nav-link, .navbar-text {
        color: #fff !important;
        font-size: 1.12rem;
        transition: color 0.2s;
    }
    .nav-link:hover, .navbar-text:hover {
        color: #e19f8d !important;
    }
    .navbar-toggler {
        border-color: #e19f8d;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-custom mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="welcome.jsp">NHÀ HÀNG</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Gi? hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="MainController?action=viewOrders">??n hàng</a></li>
                    <% if (isAdmin) { %>
                <li class="nav-item"><a class="nav-link" href="MainController?action=store">Kho hàng</a></li>
                <li class="nav-item"><a class="nav-link" href="productForm.jsp">Thêm món m?i</a></li>
                    <% } %>
            </ul>
            <span class="navbar-text d-flex align-items-center">
                <% if (isLoggedIn) { %>
                Xin chào, <span style="color:#e19f8d;font-weight:bold;margin:0 5px;"><%= user.getFullName() %></span>
                <a href="MainController?action=paymentHistory" style="background:#e19f8d;color:#7b4a10;border-radius:18px;">Lich su chuyen tien</a>
                <a href="MainController?action=logout" class="btn btn-sm ms-3" style="background:#e19f8d;color:#7b4a10;border-radius:18px;">??ng xu?t</a>
                <% } else { %>
                <a href="login.jsp" class="btn btn-sm" style="background:#e19f8d;color:#7b4a10;border-radius:18px;">??ng nh?p</a>
                <a href="register.jsp" class="btn btn-sm ms-2" style="background:#e19f8d;color:#7b4a10;border-radius:18px;">??ng ký</a>
                <% } %>
            </span>
        </div>
    </div>
</nav>