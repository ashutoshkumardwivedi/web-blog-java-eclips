<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aaru Blog - Home</title>
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
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            animation: gradientBG 10s ease infinite;
        }
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Hero Section */
        .hero {
            position: relative;
            overflow: hidden;
        }
        .carousel img {
            object-fit: cover;
            height: 70vh;
            width: 100%;
        }
        .carousel-caption {
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            animation: fadeIn 2s ease-in-out;
        }
        .carousel-caption h1 {
            font-size: 3.5rem;
            font-weight: 700;
            animation: slideInLeft 1.5s ease-in-out;
        }
        .carousel-caption p {
            font-size: 1.25rem;
            animation: slideInRight 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideInLeft {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        /* Featured Blog Section */
        .featured-blogs {
            padding: 60px 20px;
            background: white;
        }
        .featured-blogs h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 40px;
            animation: fadeInDown 1.5s ease-in-out;
        }
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .blog-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
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
        .blog-content h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .blog-content p {
            font-size: 0.9rem;
            color: #555;
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

        /* Testimonials Section */
        .testimonials {
            padding: 60px 20px;
            background: #f8f9fa;
        }
        .testimonials h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 40px;
        }
        .testimonial-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }
        .testimonial-card:hover {
            transform: translateY(-10px);
        }
        .testimonial-card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .testimonial-card h4 {
            font-size: 1.2rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .testimonial-card p {
            font-size: 0.9rem;
            color: #555;
        }

               .categories-section {
            padding: 60px 20px;
            background: white;
        }
        .categories-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 40px;
        }
        .category-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        .category-card i {
            font-size: 2.5rem;
            color: #007BFF;
            margin-bottom: 15px;
        }
        .category-card h3 {
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .category-card p {
            font-size: 1rem;
            color: #555;
        }
        .category-card a {
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            transition: color 0.3s;
        }
        .category-card a:hover {
            color: #0056b3;
        }
        /* Call-to-Action Section */
        .cta {
            padding: 60px 20px;
            background: #007BFF;
            color: white;
            text-align: center;
        }
        .cta h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .cta p {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        .cta .btn {
            background: white;
            color: #007BFF;
            font-weight: 600;
            padding: 10px 30px;
            border-radius: 25px;
            transition: all 0.3s;
        }
        .cta .btn:hover {
            background: #f8f9fa;
            transform: translateY(-5px);
        }

        /* Footer */
        footer {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        footer p {
            margin: 0;
            font-size: 0.9rem;
        }
     
    </style>
</head>
<body>

    <!-- Hero Section -->
    <section class="hero">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
            <ol class="carousel-indicators">
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <!-- First Slide -->
                <div class="carousel-item active">
                    <img class="d-block w-100" src="./images/home2.png" alt="First slide">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center text-center">
                        <h1 class="text-white fw-bold">Welcome to Aaru Blog</h1>
                        <p class="text-white">Your Hub for Insights & Inspiration</p>
                    </div>
                </div>
                <!-- Second Slide -->
                <div class="carousel-item">
                    <img class="d-block w-100" src="./images/travel-022.jpg" alt="Second slide">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center text-center">
                        <h1 class="text-white fw-bold">Explore the World Through Words</h1>
                        <p class="text-white">Travel stories, hidden gems, and unforgettable experiences await.</p>
                    </div>
                </div>
                <!-- Third Slide -->
                <div class="carousel-item">
                    <img class="d-block w-100" src="./images/istockphoto.jpg" alt="Third slide">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center text-center">
                        <h1 class="text-white fw-bold">Unleash Your Creativity</h1>
                        <p class="text-white">From tech innovations to artistic inspirations, find articles that spark creativity.</p>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
<%@ page import="java.sql.*" %>
    <!-- Featured Blog Section -->
    <section class="featured-blogs">
         <!-- Blog Section -->
    <section class="blog-section">
       <div class="container">
        <div class="row">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM blogs ORDER BY created_at DESC");

                    while (rs.next()) {
            %>
                        <div class="col-md-4 mb-4">
                            <div class="blog-card">
                                <img src="<%= rs.getString("image") %>" alt="Blog Image">
                                <div class="blog-content">
                                    <h3><%= rs.getString("title") %></h3>
                                    <p>By <%= rs.getString("author") %></p>
                                    <p><%= rs.getString("content").substring(0, Math.min(100, rs.getString("content").length())) + "..." %></p>
                                    <a href="single-blog.jsp?id=<%= rs.getInt("id") %>" class="read-more">Read More</a>
                                </div>
                            </div>
                        </div>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </div>
    </section>
    </section>
    
    <!-- Blog Categories Section -->
    <section class="categories-section">
        <div class="container">
            <h1>Explore Blog Categories</h1>
            <div class="row">
                <!-- Travel Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-mountain"></i>
                        <h3>Travel</h3>
                        <p>Discover travel stories, hidden gems, and unforgettable experiences from around the world.</p>
                       <a href="category-blogs.jsp?category=Travel">View Blogs</a>
                    </div>
                </div>
                <!-- Technology Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-laptop-code"></i>
                        <h3>Technology</h3>
                        <p>Stay updated with the latest tech trends, innovations, and insights.</p>
                       <a href="category-blogs.jsp?category=Technology">View Blogs</a>
                    </div>
                </div>
                <!-- Food Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-utensils"></i>
                        <h3>Food</h3>
                        <p>Explore delicious recipes, culinary tips, and food culture from around the globe.</p>
                        <a href="category-blogs.jsp?category=Food">View Blogs</a>
                    </div>
                </div>
                <!-- Art & Design Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-paint-brush"></i>
                        <h3>Art & Design</h3>
                        <p>Get inspired by creative works, design trends, and artistic expressions.</p>
                       <a href="category-blogs.jsp?category=Art">View Blogs</a>
                    </div>
                </div>
                <!-- Health & Fitness Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-heartbeat"></i>
                        <h3>Health & Fitness</h3>
                        <p>Learn about health tips, fitness routines, and wellness practices.</p>
                        <a href="category-blogs.jsp?category=Health">View Blogs</a>
                    </div>
                </div>
                <!-- Lifestyle Category -->
                <div class="col-md-4 mb-4">
                    <div class="category-card">
                        <i class="fas fa-smile"></i>
                        <h3>Lifestyle</h3>
                        <p>Explore tips and ideas for a balanced and fulfilling lifestyle.</p>
                       <a href="category-blogs.jsp?category=Lifestyle">View Blogs</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="container">
            <h2>What Our Readers Say</h2>
            <div class="row">
                <!-- Testimonial 1 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <img src="./images/3135715.png" alt="User 1">
                        <h4>Amresh Kumar</h4>
                        <p>"Aaru Blog has been my go-to source for inspiration and knowledge. Highly recommended!"</p>
                    </div>
                </div>
                <!-- Testimonial 2 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <img src="./images/3135715.png" alt="User 2">
                        <h4>Awnohit Singh</h4>
                        <p>"The articles are well-written and cover a wide range of topics. Love it!"</p>
                    </div>
                </div>
                <!-- Testimonial 3 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-card">
                        <img src="./images/3135715.png" alt="User 3">
                        <h4>Ashotosh Kumar</h4>
                        <p>"Aaru Blog has helped me grow both personally and professionally. Thank you!"</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


<!-- Call-to-Action Section -->
<section class="cta">
    <div class="container">
        <h2>Join Our Community</h2>
        <p>Discover, share, and connect with like-minded individuals. Start your journey today!</p>

        <%
            // userName is already declared earlier in the JSP
            if (userName == null) {
        %>
            <a href="javascript:void(0);" class="btn btn-outline-light" onclick="openModal('login')">Sign Up Now</a>
        <%
            } else {
        %>
<p style="
    color: #4a148c;
    font-size: 1rem;
    font-weight: 400;
    background-color: #f3e5f5;
    border: 1px solid #ce93d8;
    padding: 10px 18px;
    border-radius: 10px;
    margin: 20px auto 0;
    text-align: center;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
    max-width: 400px;
">
    Thank you for being with us, <%= userName %>!
</p>


        <%
            }
        %>
    </div>
</section>




    <!-- Footer -->
    <footer>
        <p>&copy; 2023 Aaru Blog. All rights reserved.</p>
    </footer>

    <!-- Add Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>