<%@ page import="java.util.Map" %>
<%@ page import="com.tapfoods.model.Cart" %>
<%@ page import="com.tapfoods.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        /* CSS Styles */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #ff5722; /* Zomato color */
            margin: 40px 0;
            font-size: 28px;
        }

        .cart-container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            padding-top: 15px;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-details {
            flex-grow: 1;
        }

        .item-details h3 {
            margin: 0;
            color: #333;
            font-size: 18px;
        }

        .item-details p {
            margin: 5px 0;
            font-size: 14px;
        }

        .item-quantity {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .item-quantity form {
            display: inline;
        }

        .item-quantity button {
            background-color: #ff5722; /* Zomato color */
            color: #ffffff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .item-quantity button:hover {
            background-color: #e64a19; /* Darker Zomato color */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .item-quantity button:active {
            background-color: #d84315; /* Even darker Zomato color */
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .item-quantity input[type="number"] {
            width: 60px;
            margin-left: 10px;
            padding: 5px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .subtotal {
            font-weight: bold;
            color: #ff5722; /* Zomato color */
        }

        .cart-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .cart-actions a {
            text-decoration: none;
            color: #ffffff;
            background-color: #ff5722; /* Zomato color */
            padding: 10px 20px;
            border-radius: 4px;
            text-align: center;
            width: 45%;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
            display: block;
            text-align: center;
        }

        .cart-actions a:hover {
            background-color: #e64a19; /* Darker Zomato color */
        }

        .cart-actions a:active {
            background-color: #d84315; /* Even darker Zomato color */
        }
    </style>
</head>
<body>
    <h1>Your Cart</h1>
    <div class="cart-container">
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && !cart.getItems().isEmpty()) {
                for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                    CartItem item = entry.getValue();
        %>
                    <div class="cart-item">
                        <div class="item-details">
                            <h3><%= item.getName() %></h3>
                            <p>Price: <%= item.getPrice() %></p>
                            <p>Quantity: <%= item.getQuantity() %></p>
                            <p class="subtotal">Subtotal: <%= item.getSubtotal() %></p>
                        </div>
                        <div class="item-quantity">
                            <form action="CartServlet" method="post">
                                <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <input type="hidden" name="action" value="update">
                                <button type="submit">Update</button>
                            </form>
                            <form action="CartServlet" method="post" style="margin-left: 10px;">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <input type="hidden" name="action" value="remove">
                                <button type="submit">Remove</button>
                            </form>
                        </div>
                    </div>
        <%
                }
            } else {
                out.print("<p>Your cart is empty.</p>");
            }
        %>
        <div class="cart-actions">
            <a href="home.jsp">Go to Home</a>
            <a href="checkout.jsp">Checkout</a>
        </div>
    </div>
</body>
</html>
