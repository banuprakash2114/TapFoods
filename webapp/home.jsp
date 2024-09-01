<%@ page import="com.tapfoods.DAOimpl.restaurentDAOImpl" %>
<%@ page import="com.tapfoods.model.restaurent" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fafafa;
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 36px;
            font-weight: 700;
            color: #ff5a5f;
        }

        /* User Actions */
        .user-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-actions a {
            text-decoration: none;
            color: #ff5a5f;
            padding: 10px 15px;
            border-radius: 25px;
            margin: 0 10px;
            border: 1px solid #ff5a5f;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .user-actions a:hover {
            background-color: #ff5a5f;
            color: #fff;
        }

        /* Restaurant Grid */
        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 40px auto;
            padding: 0 20px;
            max-width: 1200px;
        }

        .restaurant-card {
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateY(-10px);
        }

        .restaurant-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover img {
            transform: scale(1.05);
        }

        .restaurant-card h2 {
            font-size: 24px;
            margin: 15px 0 10px;
            color: #333;
            font-weight: 600;
        }

        .restaurant-card p {
            margin: 5px 0;
            font-size: 16px;
            color: #666;
        }

        .restaurant-card a {
            display: block;
            text-align: center;
            background-color: #ff5a5f;
            color: #fff;
            padding: 10px 0;
            margin: 20px 0;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .restaurant-card a:hover {
            background-color: #e14b4f;
        }
    </style>
</head>
<body>
    <h1>Tap Foods</h1>

    <%
        // Retrieve the loggedInUser attribute from the session
        Object loggedInUser = session.getAttribute("loggedInUser");
    %>

    <div class="user-actions">
        <% if (loggedInUser != null) { %>
            <a href="cart.jsp">View Cart</a>
            <a href="orderHistory.jsp">View Order History</a>
            <a href="logout.jsp">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
            <a href="signUp.jsp">Register</a>
        <% } %>
    </div>

    <div class="restaurant-grid">
        <%
            restaurentDAOImpl restaurantDAO = new restaurentDAOImpl();
            List<restaurent> restaurantsList = restaurantDAO.getAllRestaurants();

            if (restaurantsList != null && !restaurantsList.isEmpty()) {
                for (restaurent restaurant : restaurantsList) {
        %>
                    <div class="restaurant-card">
                        <img src="<%= restaurant.getImgpath() %>" alt="<%= restaurant.getRestaurentName() %>">
                        <h2><%= restaurant.getRestaurentName() %></h2>
                        <p>Cuisine: <%= restaurant.getCuisineType() %></p>
                        <p>Delivery Time: <%= restaurant.getDeliveryTime() %> minutes</p>
                        <p>Rating: <%= restaurant.getRatings() %> stars</p>
                        <a href="MenuServlet?restaurentId=<%= restaurant.getRestaurentId() %>">View Menu</a>
                    </div>
        <%
                }
            } else {
                %>
                <p>No restaurants available.</p>
                <%
            }
        %>
    </div>
</body>
</html>
