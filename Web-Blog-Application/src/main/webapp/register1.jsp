<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b); /* Gradient background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 380px;
            position: relative;
            text-align: center;
        }
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            cursor: pointer;
            background: none;
            border: none;
            outline: none;
            color: #ff6347; /* Close button color */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        input {
            width: 94%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f9f9f9;
        }
        .password-container {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 20px;
            color: #ff6347;
        }
        .register-btn {
            width: 100%;
            padding: 12px;
            background-color: #ff7e5f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }
        .register-btn:hover {
            background-color: #feb47b; /* Button color change on hover */
        }
        p {
            font-size: 14px;
            color: #333;
        }
        a {
            color: #ff7e5f;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function togglePassword(id, iconId) {
            var passwordField = document.getElementById(id);
            var icon = document.getElementById(iconId);
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.textContent = "🙈";
            } else {
                passwordField.type = "password";
                icon.textContent = "👁️";
            }
        }

        function closeRegister() {
            document.getElementById("registerContainer").style.display = "none";
        }
    </script>
</head>
<body>

    <div class="container" id="registerContainer">
        <button class="close-btn" onclick="closeRegister()">x</button>
        <h2>Sign Up</h2>
        <form action="registerServlet" method="post">
            <input type="text" name="name" placeholder="Full Name" required><br>
            <input type="email" name="email" placeholder="Email Address" required><br>
            <input type="text" name="phone" placeholder="Phone Number" required><br>

            <div class="password-container">
                <input type="password" name="password" id="password" placeholder="Password" required>
                <span class="toggle-password" id="toggleIcon1" onclick="togglePassword('password', 'toggleIcon1')">👁️</span>
            </div>

            <div class="password-container">
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                <span class="toggle-password" id="toggleIcon2" onclick="togglePassword('confirmPassword', 'toggleIcon2')">👁️</span>
            </div>

            <button type="submit" class="register-btn">Sign Up</button>

            <p>
                Already have an account? <a href="login.jsp">Sign in</a>
            </p>

        </form>
    </div>

</body>
</html>
