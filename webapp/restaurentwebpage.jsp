<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Display</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
            max-width: 1000px;
        }

        .restaurant-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.2s;
        }

        .restaurant-card:hover {
            transform: scale(1.05);
        }

        .restaurant-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .details {
            padding: 15px;
        }

        .details h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .details p {
            color: #555;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="restaurant-card">
            <img src="img/restaurant1.jpg" alt="Restaurant 1">
            <div class="details">
                <h2>Restaurant 1</h2>
                <p>Type: Italian</p>
                <p>Delivery Time: 30 mins</p>
            </div>
        </div>
        <div class="restaurant-card">
            <img src="img/restaurant2.jpg" alt="Restaurant 2">
            <div class="details">
                <h2>Restaurant 2</h2>
                <p>Type: Chinese</p>
                <p>Delivery Time: 25 mins</p>
            </div>
        </div>
        <div class="restaurant-card">
            <img src="img/restaurant3.jpg" alt="Restaurant 3">
            <div class="details">
                <h2>Restaurant 3</h2>
                <p>Type: Indian</p>
                <p>Delivery Time: 40 mins</p>
            </div>
        </div>
        <div class="restaurant-card">
            <img src="img/restaurant4.jpg" alt="Restaurant 4">
            <div class="details">
                <h2>Restaurant 4</h2>
                <p>Type: Mexican</p>
                <p>Delivery Time: 35 mins</p>
            </div>
        </div>
        <div class="restaurant-card">
            <img src="img/restaurant5.jpg" alt="Restaurant 5">
            <div class="details">
                <h2>Restaurant 5</h2>
                <p>Type: Thai</p>
                <p>Delivery Time: 20 mins</p>
            </div>
        </div>
        <div class="restaurant-card">
            <img src="img/restaurant6.jpg" alt="Restaurant 6">
            <div class="details">
                <h2>Restaurant 6</h2>
                <p>Type: Japanese</p>
                <p>Delivery Time: 15 mins</p>
            </div>
        </div>
    </div>
</body>
</html>
