<%@ page import="com.tapfoods.model.ordertable" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <style>
        /* CSS Styles */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #ff5722; /* Zomato color */
            margin: 40px 0;
            font-size: 32px;
        }

        .order-container {
            max-width: 700px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .order-details {
            margin-bottom: 30px;
        }

        .order-details p {
            font-size: 18px;
            margin: 10px 0;
        }

        .order-details span {
            font-weight: bold;
            color: #ff5722; /* Zomato color */
        }

        .thank-you-message {
            text-align: center;
            font-size: 20px;
            margin-top: 30px;
            color: #27ae60; /* Green color for a positive touch */
        }

        .action-links {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .action-links a {
            text-decoration: none;
            color: #ffffff;
            background-color: #ff5722; /* Zomato color */
            padding: 15px 25px;
            border-radius: 5px;
            text-align: center;
            width: 45%;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .action-links a:hover {
            background-color: #e64a19; /* Darker Zomato color */
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .action-links a:active {
            background-color: #d84315; /* Even darker Zomato color */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <h1>Order Confirmed!</h1>
    <div class="order-container">
        <div class="order-details">
            <p>Thank you for your order! Your order ID is <span><%= request.getAttribute("orderId") %></span>.</p>
            <p>We will start processing your order soon.</p>
            <p>Order Date: <span><%= request.getAttribute("orderDate") %></span></p>
            <p>Total Amount: <span><%= request.getAttribute("totalAmount") %></span></p>
        </div>
        <div class="thank-you-message">
            <p>Thank you for shopping with us!</p>
        </div>
        <div class="action-links">
            <a href="home.jsp">Go to Home</a>
            <a href="OrderHistoryServlet">View Order History</a>
        </div>
    </div>
</body>
</html>

</html>
