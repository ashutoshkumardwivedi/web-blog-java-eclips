<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .blog-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            background-color: #fff;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .blog-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 6px;
        }
        .blog-content {
            flex: 1;
            margin-top: 15px;
        }
        .btn-group {
            margin-top: auto;
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %> 
<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Your Blogs</h2>
    <div class="row">
    <%
        int userId = (int) session.getAttribute("userId");
        String url = "jdbc:mysql://localhost:3306/web_blog";
        String username = "root";
        String password = "";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM blogs WHERE id = ? ORDER BY created_at DESC";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
    %>
        <div class="col-md-4">
            <div class="blog-card">
                <img src="<%= rs.getString("image") %>" alt="Blog Image">
                <div class="blog-content">
                    <h5><%= rs.getString("title") %></h5>
                    <p><%= rs.getString("content").length() > 100 ? rs.getString("content").substring(0, 100) + "..." : rs.getString("content") %></p>
                </div>
                <div class="btn-group">
                    <a href="editBlog.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="deleteBlog.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this blog?');">Delete</a>
                </div>
            </div>
        </div>
    <%
            }
        } catch (Exception e) {
            out.println("<div class='text-danger text-center'>Error: " + e.getMessage() + "</div>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    %>
    </div>
</div>

</body>
</html>
