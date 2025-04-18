<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Neo CSS for animations -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/neo-css@1.0.0/neo.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
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
        }
        .about-section {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px 20px;
            margin: 20px auto;
            max-width: 1400px;
            background: #fff;
            animation: fadeIn 1.5s ease-in-out;
        }
        .about-section h1 {
            color: #007BFF;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-align: center;
            animation: slideInDown 1s ease-in-out;
        }
        .about-section p {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #555;
            animation: fadeInUp 1.5s ease-in-out;
        }
        .team-section {
            margin-top: 40px;
            text-align: center;
            animation: fadeIn 2s ease-in-out;
        }
        .team-section h2 {
            font-size: 2rem;
            color: #007BFF;
            margin-bottom: 30px;
            animation: slideInUp 1s ease-in-out;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
            animation: fadeInUp 1.5s ease-in-out;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #007BFF;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .team-member img:hover {
            transform: scale(1.1);
            box-shadow: 0 8px 16px rgba(0, 123, 255, 0.3);
        }
        .team-member h3 {
            font-size: 1.5rem;
            color: #2c3e50;
            animation: fadeInUp 1.5s ease-in-out;
        }
        .team-member p {
            font-size: 1rem;
            color: #777;
            animation: fadeInUp 1.5s ease-in-out;
        }

        /* Custom Keyframes for Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideInDown {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes slideInUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes fadeInUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="Navbar.jsp" %>
    <%@ include file="LoginRegister.jsp" %>

    <!-- About Us Section -->
    <div class="about-section">
        <h1 class="neo-animate-slide-in-down">About Us</h1>
        <p class="neo-animate-fade-in">
            Welcome to Aaru Blog, your go-to platform for insightful and inspiring content. Our mission is to empower writers, bloggers, and content creators to share their thoughts, ideas, and expertise with the world. Whether you're a seasoned writer or just getting started, our platform provides a seamless experience to publish and engage with an audience.
        </p>
        <p class="neo-animate-fade-in">
            Founded in 2023, Aaru Blog has grown into a vibrant community of readers and writers. We believe in the power of words to inspire, educate, and connect people from all walks of life.
        </p>

        <!-- Team Section -->
        <div class="team-section">
            <h2 class="neo-animate-slide-in-up">Meet Our Team</h2>
            <div class="row justify-content-center">
                <div class="col-md-4 team-member neo-animate-fade-in-up">
                    <img src="./images/default.png" alt="Team Member 1">
                    <h3>Amresh Kumar</h3>
                    <p>Founder & CEO</p>
                </div>
                <div class="col-md-4 team-member neo-animate-fade-in-up">
                    <img src="./images/default.png" alt="Team Member 2">
                    <h3>Awnohit Singh</h3>
                    <p>Content Manager</p>
                </div>
                <div class="col-md-4 team-member neo-animate-fade-in-up">
                    <img src="./images/default.png" alt="Team Member 3">
                    <h3>Sahil Kumar</h3>
                    <p>Lead Editor</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>