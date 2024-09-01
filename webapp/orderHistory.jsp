<%@ page import="java.util.List" %>
<%@ page import="com.tapfoods.model.ordertable" %>

<html>
<head>
    <title>Order History</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            padding: 20px;
            margin: 0;
        }

        h1 {
            text-align: center;
            color: #d32323; /* Zomato red */
            margin-bottom: 30px;
            font-size: 32px;
        }

        .order-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .order {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e1e1e1;
        }

        .order:last-child {
            border-bottom: none;
        }

        .order h3 {
            color: #d32323; /* Zomato red */
            margin-bottom: 10px;
            font-size: 20px;
        }

        .order p {
            margin: 5px 0;
            color: #555;
            font-size: 16px;
        }

        .order hr {
            border: 0;
            height: 1px;
            background-color: #e1e1e1;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>Your Order History</h1>
    <div class="order-container">
        <%
            List<ordertable> orderHistory = (List<ordertable>) request.getAttribute("orderHistory");

            if (orderHistory != null && !orderHistory.isEmpty()) {
                for (ordertable order : orderHistory) {
        %>
            <div class="order">
                <h3>Order ID: <%= order.getOrderId() %></h3>
                <p>Restaurant ID: <%= order.getRestaurentId() %></p>
                <p>Date: <%= order.getOrderDate() %></p>
                <p>Total Amount: $<%= order.getTotalAmount() %></p>
                <p>Status: <%= order.getStatus() %></p>
                <hr/>
            </div>
        <%
                }
            } else {
                out.println("<p>No orders found.</p>");
            }
        %>
    </div>
</body>
</html>
