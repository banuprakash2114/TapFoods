<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: url('images/background1.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        /* Overlay to Darken Background Image */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Dark overlay */
            z-index: -1;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            z-index: 1;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: 600;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], textarea {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 30px;
            font-size: 14px;
            color: #555;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="tel"]:focus, textarea:focus {
            border-color: #007bff;
            outline: none;
            background-color: #ffffff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px 15px;
            background-color: #28a745;
            border: none;
            border-radius: 30px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="RegisterServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3" required></textarea>
            
            <label for="phoneNumber">Phone Number:</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" required>
            
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
