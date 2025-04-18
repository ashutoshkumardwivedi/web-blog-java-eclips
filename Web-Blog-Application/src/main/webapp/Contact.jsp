<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Aaru Blog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background: #f8f9fa;
            color: #333;
            min-height: 100vh; /* Ensures full page height */
            display: flex;
            flex-direction: column;
        }

        /* Contact Container */
        .contact-container {
            flex: 1; /* Allows content to grow and push footer down */
            max-width: 1050px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            color: #007BFF;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            animation: slideInLeft 1s ease-in-out;
        }
        @keyframes slideInLeft {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .content {
            text-align: justify;
            font-size: 1.1rem;
            line-height: 1.6;
            color: #555;
            margin-bottom: 25px;
            animation: slideInRight 1s ease-in-out;
        }
        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        /* Contact Form */
        .contact-form {
            text-align: left;
            margin-top: 20px;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: 0.3s ease-in-out;
        }
        .contact-form input:focus, .contact-form textarea:focus {
            border-color: #007BFF;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
        }
        .submit-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #007BFF, #0056b3);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
        }
        .submit-btn:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .contact-container {
                width: 90%;
                margin: 20px auto;
            }
            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="Navbar.jsp" %>

    <!-- Include Login/Register if user is not logged in -->
    <%@ include file="LoginRegister.jsp" %>

    <!-- Contact Container -->
    <div class="contact-container">
        <h1>Contact Us</h1>
        <p class="content">
            Have any questions or feedback? Feel free to reach out to us using the form below. 
            We’re happy to help you with any inquiries related to our blogging platform.
        </p>

        <!-- Contact Form -->
        <form class="contact-form" action="ContactServlet" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
            <button type="submit" class="submit-btn">Send Message</button>
        </form>
    </div>


    <!-- Add Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>