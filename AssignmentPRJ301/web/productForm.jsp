<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Form</title>
    </head>
    <body>
        <h2>Product Form</h2>

        <form action="MainController" method="post">
            <input type="hidden" name="action" value="addProduct"/>

            <div>
                <label for="productName">Product Name:</label>
                <input type="text" name="productName" id="productName" required/>
            </div>

            <div>
                <label for="description">Description:</label>
                <textarea name="description" id="description" rows="4" cols="40" required></textarea>
            </div>

            <div>
                <label for="price">Price:</label>
                <input type="number" name="price" id="price" step="0.01" required/>
            </div>

            <div>
                <label for="imageUrl">Image URL:</label>
                <input type="text" name="imageUrl" id="imageUrl" required/>
            </div>

            <div>
                <label for="available">Available:</label>
                <input type="checkbox" name="available" id="available" value="true"/>
            </div>

            <div>
                <label for="categoryId">Category ID:</label>
                <input type="number" name="categoryId" id="categoryId" required/>
            </div>

            <div>
                <input type="submit" value="Add Product"/>
            </div>
        </form>

        <br/>
        <div style="color:red;">
            <%= request.getAttribute("checkError") != null ? request.getAttribute("checkError") : "" %>
        </div>
        <div style="color:green;">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>
    </body>
</html>
