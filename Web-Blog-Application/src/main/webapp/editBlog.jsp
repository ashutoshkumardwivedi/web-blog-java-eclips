<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int blogId = Integer.parseInt(request.getParameter("id"));
    String title = "", author = "", content = "", category = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Blog - Aaru Blog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        <%-- same CSS as in your create blog page --%>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        .create-blog-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007BFF;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-label { font-weight: 600; color: #2c3e50; }
        .form-control {
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
        }
        .btn-primary {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #007BFF, #0056b3);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
        }
    </style>
</head>
<body>
<%@ include file="Navbar.jsp" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM blogs WHERE id = ?");
        ps.setInt(1, blogId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            title = rs.getString("title");
            author = rs.getString("author");
            content = rs.getString("content");
            category = rs.getString("category");
        }
        con.close();
    } catch (Exception e) {
        out.println("<div class='text-danger text-center'>Error: " + e.getMessage() + "</div>");
    }
%>

<div class="create-blog-container">
    <h2>Edit Your Blog</h2>
    <form action="UpdateBlogServlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= blogId %>">
        <div class="mb-3">
            <label for="title" class="form-label">Blog Title</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= title %>" required>
        </div>
        <div class="mb-3">
            <label for="author" class="form-label">Author Name</label>
            <input type="text" class="form-control" id="author" name="author" value="<%= author %>" required>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">Select Category</label>
            <select class="form-control" id="category" name="category" required>
                <option value="Travel" <%= category.equals("Travel") ? "selected" : "" %>>Travel</option>
                <option value="Technology" <%= category.equals("Technology") ? "selected" : "" %>>Technology</option>
                <option value="Food" <%= category.equals("Food") ? "selected" : "" %>>Food</option>
                <option value="Art & Design" <%= category.equals("Art & Design") ? "selected" : "" %>>Art & Design</option>
                <option value="Health & Fitness" <%= category.equals("Health & Fitness") ? "selected" : "" %>>Health & Fitness</option>
                <option value="Lifestyle" <%= category.equals("Lifestyle") ? "selected" : "" %>>Lifestyle</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Upload New Image (Optional)</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*">
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Blog Content</label>
            <textarea class="form-control" id="content" name="content" rows="6" required><%= content %></textarea>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Update Blog</button>
        </div>
    </form>
</div>

<%@ include file="Footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
