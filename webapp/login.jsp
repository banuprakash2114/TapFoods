<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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

        input[type="email"], input[type="password"] {
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

        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            background-color: #ffffff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px 15px;
            background-color: #ff5a5f;
            border: none;
            border-radius: 30px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e14b4f;
        }

        .forgot-password {
            margin-top: 15px;
            font-size: 14px;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
        <div class="forgot-password">
        </div>
    </div>
</body>
</html>
