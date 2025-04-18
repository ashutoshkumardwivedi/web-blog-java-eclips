<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Blog Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background-color: #f8f9fa;
        }
        .header {
            text-align: center;
            padding: 20px 20px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            margin: 20px 90px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
            animation: fadeInDown 1.5s ease-in-out;
        }
        .header::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://source.unsplash.com/1600x900/?blog,writing') no-repeat center center/cover;
            opacity: 0.3;
            z-index: 0;
        }
        .header h1, .header p {
            position: relative;
            z-index: 1;
        }
        .header h1 {
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
            animation: slideInLeft 1s ease-in-out;
        }
        .header p {
            font-size: 1.2rem;
            font-weight: 300;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
            animation: slideInRight 1s ease-in-out;
        }
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideInLeft {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        .blog-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px 20px;
        }
        .blog-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
        }
        .blog-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .blog-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s;
        }
        .blog-card:hover img {
            transform: scale(1.1);
        }
        .blog-content {
            padding: 20px;
        }
        .blog-content h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #333;
        }
        .blog-content p {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        .read-more {
            color: #ff7e5f;
            text-decoration: none;
            font-weight: 600;
            position: relative;
        }
        .read-more::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 0;
            height: 2px;
            background: #ff7e5f;
            transition: width 0.3s;
        }
        .read-more:hover::after {
            width: 100%;
        }
        .blog-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            z-index: 1;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .blog-card:hover::before {
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Explore Our Latest Blog Posts</h1>
        <p>Dive into diverse topics and stay updated with engaging insights</p>
    </div>
    <div class="container">
        <div class="blog-container">
            <div class="blog-card">
                <img src="./images/Mountain.jpg" alt="Mountains">
                <div class="blog-content">
                    <h2>Mountains Adventure</h2>
                    <p>Explore the breathtaking landscapes and the thrill of hiking the world's most famous mountain ranges.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="blog-card">
                <img src="./images/Hurtling.jpg" alt="Technology">
                <div class="blog-content">
                    <h2>The Future of AI</h2>
                    <p>How artificial intelligence is shaping the future of industries and revolutionizing daily life.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="blog-card">
                <img src="./images/hq720.jpg" alt="Food">
                <div class="blog-content">
                    <h2>A Taste of Italy</h2>
                    <p>Discover the delicious world of Italian cuisine, from pasta to pizza and everything in between.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
            <div class="blog-card">
                <img src="./images/travel-world.jpg" alt="Travel">
                <div class="blog-content">
                    <h2>Traveling the World</h2>
                    <p>Uncover the beauty of different cultures, exotic destinations, and once-in-a-lifetime experiences.</p>
                    <a href="#" class="read-more">Read More</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>