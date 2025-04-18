<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Detail</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Page Styling */
        body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Navbar and Footer */
        .navbar, .footer {
            width: 100%;
            position: relative;
            z-index: 1000;
        }

        /* Main container */
        .main-container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Blog Content */
        .blog-content {
            width: 100%;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .blog-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }

        /* Blog Image & Text Section */
        .blog-detail {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
        }

        .blog-img {
            width: 45%;
            border-radius: 8px;
            max-height: 300px;
            object-fit: cover;
        }

        .blog-text {
            width: 50%;
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        /* Author Info */
        .author-info {
            margin-top: 20px;
            padding: 10px;
            background: #f1f1f1;
            border-radius: 8px;
        }

        /* Footer */
        .footer {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

        .footer a {
            color: white;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .blog-detail {
                flex-direction: column;
                text-align: center;
            }

            .blog-img {
                width: 100%;
                max-height: 250px;
            }

            .blog-text {
                width: 100%;
            }
        }
        .text{
        	width:100%;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="Navbar.jsp" %> 
    <%@ include file="LoginRegister.jsp" %>

    <!-- Main Container -->
    <div class="main-container">
        
        <!-- Blog Content -->
        <div class="blog-content">
            <h1 class="blog-title">How Technology is Changing the World</h1>

            <div class="blog-detail">
                <img src="./images/bg1.jpg" class="blog-img" alt="Blog Image">
                <p class="blog-text">
                    Technology is evolving rapidly, transforming the way we communicate, work, and live. 
                    From artificial intelligence to blockchain, innovations are reshaping industries and creating new opportunities. 
                    <br><br>
                    In this blog, we explore how technology impacts different sectors, the benefits, and potential challenges.
                </p>
            </div>
            <div  class=text>
			  <p>
                  The Impact of Technology on Different Sectors

1. Communication and Social Interaction

The way we connect with others has changed dramatically in the past two decades. Social media platforms, instant messaging apps, and video conferencing tools have made global communication effortless. AI-powered chatbots and virtual assistants have further enhanced user experiences by providing instant support and automating customer service.

However, this convenience comes with concerns. Privacy issues, data security, and misinformation have become significant challenges. As technology advances, ensuring ethical digital interactions remains a top priority.
            </p>
            <p>
                  The Impact of Technology on Different Sectors

1. Communication and Social Interaction

The way we connect with others has changed dramatically in the past two decades. Social media platforms, instant messaging apps, and video conferencing tools have made global communication effortless. AI-powered chatbots and virtual assistants have further enhanced user experiences by providing instant support and automating customer service.

However, this convenience comes with concerns. Privacy issues, data security, and misinformation have become significant challenges. As technology advances, ensuring ethical digital interactions remains a top priority.
            </p>
            <p>
                  The Impact of Technology on Different Sectors

1. Communication and Social Interaction

The way we connect with others has changed dramatically in the past two decades. Social media platforms, instant messaging apps, and video conferencing tools have made global communication effortless. AI-powered chatbots and virtual assistants have further enhanced user experiences by providing instant support and automating customer service.

However, this convenience comes with concerns. Privacy issues, data security, and misinformation have become significant challenges. As technology advances, ensuring ethical digital interactions remains a top priority.
            </p>
            </div>
            <!-- Author Info -->
            
            <div class="author-info">
                <p><strong>Author:</strong> Amresh</p>
                <p><strong>Published On:</strong> February 9, 2025</p>
            </div>
        </div>
    </div>

    <!-- Include Footer -->
    <%@ include file="Footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
