<%-- 
    Document   : inventory
    Created on : Jul 8, 2025, 6:23:35 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.InventoryDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="nhapHang"/>
                <table>
        <thead>
            <tr>
                <th>kho</th>
                <th>Ma San Pham</th>
                <th>So Luong</th>
                <th>Them So Luong</th> 
            </tr>
        </thead>
        <tbody>
        <%
            List<InventoryDTO> list = (List<InventoryDTO>) session.getAttribute("list");
            if(list!=null){
            for(InventoryDTO i : list){
        %>
            <tr>
                <td><%=i.getInventoryId()%></td>
                <td><%=i.getProductId()%></td>
                <td><%=i.getQuantityAvailable()%></td>
                <td>
                        <input type="number" name="<%=i.getInventoryId()%>va<%=i.getProductId()%>" min="0" value="0" step="1"/> 
                   
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
            <br/>
    <input type="submit" value="Hoan tat"/>
 </form>   

    
<%
    Integer row = (Integer) request.getAttribute("row");
    if (row != null && row != 0) {
%>
    Update success: <%= row %> row
<%
    } else if (row != null) {
%>
    Update failed or no row affected.
<%
    }
%>
    </body>
</html>
