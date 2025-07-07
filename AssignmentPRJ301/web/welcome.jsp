<%-- 
    Document   : welcome
    Created on : Jul 4, 2025, 10:57:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.CategoryDTO" %>
<%@page import="utils.AuthUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/welcome.css">

    </head>
    <body>
        <h1> Menu </h1>
  <%
    Boolean loaded = (Boolean) session.getAttribute("loaded");
    System.out.println(loaded);
    if (loaded == null || !loaded) {
%>
        <form id="autoForm" action="MainController" method="post">
            <input type="hidden" name="action" value="openCategory"/>
        </form>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("autoForm").submit();
            });
        </script>
        <%
            } 
             List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("list");
            if(list!=null){
             for(CategoryDTO l : list){
        %>

        <div>
            <div>
                <%=l.getCategoryName()%>
                <form action="MainController" method="post">
                    <input type ="hidden" name="action" value="toProduct"/>
                    <input type="hidden" name="categoryId" value="<%=l.getCategoryId()%>"/>
                    <input type="submit" value="Xem thuc don"/>
                </form>
            </div>
            <div><img src="<%=l.getImage()%>" alt="Category Image" /></div>
        </div>
        <%}
            }%>
            <%
            if(AuthUtils.isAdmin(request)){
            %>
            <a href="productForm.jsp">to add new food</a>
            <%}%>
    </body>
</html>
