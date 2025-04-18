<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Blogs - Aaru Blog</title>
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
        }
        .category-hero {
            position: relative;
            height: 200px;
            background: url('./images/bg.png') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }
        .category-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
        }
        .category-hero h1 {
            font-size: 3rem;
            font-weight: 700;
            position: relative;
            z-index: 1;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }
        .blog-section {
            padding: 60px 20px;
            background: white;
        }
        .blog-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 30px;
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
        .read-more {
            color: #007BFF;
            text-decoration: none;
            font-weight: 600;
            position: relative;
        }
        .read-more:hover::after {
            width: 100%;
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %>
    <%@ include file="LoginRegister.jsp" %>
    
    <% String category = request.getParameter("category"); %>
    <section class="category-hero" style="background-image: url('./images/<%= category.toLowerCase() %>-hero.jpg');">
        <div>
            <h1><%= category %></h1>
        </div>
    </section>

    <section class="blog-section">
        <div class="container">
            <h2><%= category %> Blogs</h2>
            <div class="row">
                <% 
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
                        String sql = "SELECT * FROM blogs WHERE category = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, category);
                        rs = stmt.executeQuery();
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
                    } catch (Exception e) {
                        out.println("<p>Error loading blogs: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </div>
        </div>
    </section>

    <%@ include file="Footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
