<%@ page import="java.util.Map" %>
<%@ page import="com.tapfoods.model.Cart" %>
<%@ page import="com.tapfoods.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
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

        .checkout-container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .order-summary {
            margin-bottom: 30px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }

        .order-summary h2 {
            color: #ff5722; /* Zomato color */
            margin-bottom: 20px;
            font-size: 22px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #f4f4f4;
            padding: 10px 0;
            font-size: 16px;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-total {
            font-weight: bold;
            font-size: 1.5em;
            text-align: right;
            margin-top: 20px;
            color: #ff5722; /* Zomato color */
        }

        .checkout-form {
            display: flex;
            flex-direction: column;
        }

        .checkout-form label {
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        .checkout-form input[type="text"],
        .checkout-form input[type="email"],
        .checkout-form input[type="tel"],
        .checkout-form textarea {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        .checkout-form textarea {
            resize: vertical;
            height: 120px;
        }

        .checkout-form button {
            padding: 12px;
            background-color: #ff5722; /* Zomato color */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s, box-shadow 0.3s;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .checkout-form button:hover {
            background-color: #e64a19; /* Darker Zomato color */
        }

        .checkout-form button:active {
            background-color: #d84315; /* Even darker Zomato color */
        }
    </style>
</head>
<body>
    <h1>Checkout</h1>
    <div class="checkout-container">
        <div class="order-summary">
            <h2>Order Summary</h2>
            <%
                Cart cart = (Cart) session.getAttribute("cart");
                float total = 0;
                if (cart != null && !cart.getItems().isEmpty()) {
                    for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                        CartItem item = entry.getValue();
                        total += item.getSubtotal();
            %>
                <div class="order-item">
                    <span><%= item.getName() %> (x<%= item.getQuantity() %>)</span>
                    <span>Price: <%= item.getPrice() %></span>
                    <span>Subtotal: <%= item.getSubtotal() %></span>
                </div>
            <%
                    }
                } else {
                    out.print("<p>Your cart is empty.</p>");
                }
            %>
            <div class="order-total">
                Total: <%= total %>
            </div>
        </div>
       
        <div class="checkout-form">
            <h2>Shipping Information</h2>
            <form action="OrderServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" required>

                <label for="address">Address:</label>
                <textarea id="address" name="address" required></textarea>

                <button type="submit">Place Order</button>
            </form>
        </div>
    </div>
</body>
</html>
