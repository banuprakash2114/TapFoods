<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Successful</title>
<style>
    body {
        font-family: 'Helvetica Neue', Arial, sans-serif;
        background-color: #f8f8f8;
        color: #333;
        text-align: center;
        padding: 50px;
        margin: 0;
    }

    h1 {
        font-size: 36px;
        color: #d32323; /* Zomato red */
        margin-bottom: 20px;
    }

    p {
        font-size: 18px;
        margin-bottom: 40px;
    }

    .container {
        background-color: #fff;
        padding: 30px;
        max-width: 500px;
        margin: 0 auto;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    button {
        background-color: #d32323; /* Zomato red */
        color: #fff;
        border: none;
        padding: 15px 30px;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #b71c1c;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Update Successful</h1>
        <p>Your details have been updated successfully.</p>
        <button onclick="window.location.href='home.jsp'">Go to Home</button>
    </div>
</body>
</html>
