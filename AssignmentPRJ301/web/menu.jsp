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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<ProductDTO> list = (List<ProductDTO>) session.getAttribute("list");
        if(list!=null){
            for(ProductDTO p : list){
        %>
        <div>
            <div>
                <%=p.getProductName()%>
                <%=p.getDescription()%>
                <%=p.getPrice()%>
            </div>
            <div><%=p.getImageUrl()%></div>
        </div>
        <%
            }
                }
        %>
    </body>
</html>
