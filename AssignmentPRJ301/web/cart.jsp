<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CartDTO"%>
<%@page import="model.CartItemDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Your Cart</title>
    </head>
    <body>

        <%
            if (AuthUtils.isLoggedIn(request)) {
        CartDTO cart = (CartDTO) session.getAttribute("cart");
        String error = (String) request.getAttribute("checkError");
        String message = (String) request.getAttribute("message");
        %>

        <h2>Your Cart</h2>
        <a href="menu.jsp">← Back to Menu</a> <br/> <br/>
        <% if (error != null && !error.isEmpty()) { %>
        <div style="color: red; font-weight: bold; margin-bottom: 10px;">
            <%= error %>
        </div>
        <% } %>

        <% if (message != null && !message.isEmpty()) { %>
        <div style="color: green; font-weight: bold; margin-bottom: 10px;">
            <%= message %>
        </div>
        <% } %>

        <%
            if (cart == null || cart.getItems().isEmpty()) {
        %>
        <p>Your cart is empty.</p>
        <%
            } else {
        %>
        <table border="1" cellpadding="5">
            <tr>
                <th>Product</th>
                <th>Unit Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Note</th>
            </tr>

            <%
                for (CartItemDTO item : cart.getItems()) {
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td><%= item.getUnitPrice() %></td>
                <td>
                    <form action="MainController" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="updateQuantity"/>
                        <input type="hidden" name="productId" value="<%= item.getProductId() %>"/>
                        <input type="hidden" name="change" value="-1"/>
                        <input type="submit" value="−"/>
                    </form>

                    <%= item.getQuantity() %>

                    <form action="MainController" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="updateQuantity"/>
                        <input type="hidden" name="productId" value="<%= item.getProductId() %>"/>
                        <input type="hidden" name="change" value="1"/>
                        <input type="submit" value="+"/>
                    </form>
                </td>
                <td><%= item.getTotalPrice() %></td>
                <td>
                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="updateNote"/>
                        <input type="hidden" name="productId" value="<%= item.getProductId() %>"/>
                        <input type="text" name="note" value="<%= item.getNote() == null ? "" : item.getNote() %>" size="15"/>
                        <input type="submit" value="Save"/>
                    </form>
                </td>
            </tr>
            <%
                }
            %>

            <tr>
                <td colspan="3" align="right"><strong>Total Amount:</strong></td>
                <td colspan="2"><strong><%= cart.getTotalAmount() %> VND</strong></td>
            </tr>
        </table>

            <br>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="checkout"/>
            <label>Shipping Address: </label>
            <input type="text" name="shippingAddress" required/> <br>
            <input type="submit" value="Checkout">
        </form>
        <br> 
        <%
            }
        %>
        
        <%
            } else {
        %>
        <div style="color: red; font-weight: bold;">
            <%= AuthUtils.getAccessDeniedMessage("cart.jsp") %><br/>
            (Or <a href="<%= AuthUtils.getLoginURL() %>">Login</a>)
        </div>
        <%
            }
        %>

        <br>
    
    </body>
</html>
