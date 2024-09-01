<%@ page import="java.util.List" %>
<%@ page import="com.tapfoods.model.menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #e94e77; /* Zomato red */
            font-size: 32px;
        }

        .menu-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .menu-item h2 {
            margin-top: 0;
            color: #e94e77; /* Zomato red */
            font-size: 28px;
        }

        .menu-item p {
            margin: 6px 0;
            font-size: 16px;
        }

        .menu-item img {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 8px;
            margin-top: 15px;
        }

        .quantity-input {
            margin-top: 10px;
            font-size: 16px;
            padding: 5px;
            width: 80px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .add-to-cart-btn {
            display: block;
            text-decoration: none;
            color: #fff;
            background-color: #e94e77; /* Zomato red */
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            margin-top: 10px;
            width: 150px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #c93d63;
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.2);
        }

        .back-link {
            display: block;
            text-decoration: none;
            color: #fff;
            background-color: #e94e77; /* Zomato red */
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            margin-top: 30px;
            width: 150px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .back-link:hover {
            background-color: #c93d63;
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 600px) {
            .menu-item {
                padding: 15px;
            }

            .menu-item img {
                max-width: 100%;
            }

            .add-to-cart-btn,
            .back-link {
                width: 100%;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <h1>Menu</h1>
    
    <%
        List<menu> menuList = (List<menu>) session.getAttribute("menuList");
        
        if (menuList != null && !menuList.isEmpty()) {
            for (menu m : menuList) {
    %>
                <div class="menu-item">
                    <h2><%= m.getitemName() %></h2>
                    <p>Price:<%= m.getPrice() %></p>
                    <p>Description: <%= m.getDescription() %></p>
                    <p>Available: <%= m.getIsAvailable() %></p>
                    <img src="<%= m.getImgpath() %>" alt="<%= m.getitemName() %>">
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="itemId" value="<%= m.getMenuId() %>">
                        <input type="number" name="quantity" class="quantity-input" value="1" min="1">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
                    </form>
                </div>
    <%
            }
        } else {
            out.print("<p>No menu items available.</p>");
        }
    %>
    
    <a href="home.jsp" class="back-link">Back to Home</a>
</body>
</html>
