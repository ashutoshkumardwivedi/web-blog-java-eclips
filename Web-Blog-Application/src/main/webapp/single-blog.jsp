<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Single Blog Post - Aaru Blog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
  /* Import Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

/* Global Styles */
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

/* Blog Post Section */
.blog-post-section {
    padding: 60px 20px;
    background: white;
}

.blog-post-header {
   text-align: left;
    margin-bottom: 40px;
    flex-direction: column;
    align-items: center;
}

.blog-post-header .meta {
text-align: left;
    font-size: 1rem;
    color: #777;
    margin-bottom: 20px;
}

.blog-post-header img {
    width: 100%;
    height: 400px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 20px;
}

.blog-post-content {
    font-size: 1.1rem;
    line-height: 1.8;
    color: #555;
}

.blog-post-content h2 {
    font-size: 2rem;
    color: #2c3e50;
    margin-top: 30px;
    margin-bottom: 15px;
}

.blog-post-content p {
    margin-bottom: 20px;
}

/* Comments Section */
.comments-section {
    padding: 40px 20px;
    background: #f8f9fa;
    margin-top: 40px;
}

.comments-section h3 {
    font-size: 2rem;
    color: #2c3e50;
    margin-bottom: 20px;
}

.comment {
    background: white;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.comment .meta {
    font-size: 0.9rem;
    color: #777;
    margin-bottom: 10px;
}

.comment p {
    font-size: 1rem;
    color: #555;
    line-height: 1.6;
}

/* Comment Form */
.comment-form {
    background: #f9f9f9;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 20px auto;
}

.comment-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    resize: none;
    transition: all 0.3s ease-in-out;
}

.comment-form textarea:focus {
    border-color: #007bff;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
    outline: none;
}

.comment-form button {
    background: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
    display: block;
    width: 100%;
    margin-top: 10px;
}

.comment-form button:hover {
    background: #0056b3;
}

/* Related Posts Section */
.related-posts-section {
    padding: 40px 20px;
    background: white;
    margin-top: 40px;
}

.related-posts-section h3 {
    font-size: 2rem;
    color: #2c3e50;
    margin-bottom: 20px;
}

.related-post-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s, box-shadow 0.3s;
    margin-bottom: 20px;
}

.related-post-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.related-post-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.related-post-card .content {
    padding: 20px;
}

.related-post-card h4 {
    font-size: 1.2rem;
    color: #2c3e50;
    margin-bottom: 10px;
}

.related-post-card p {
    font-size: 0.9rem;
    color: #555;
    line-height: 1.5;
}

.related-post-card a {
    color: #007bff;
    text-decoration: none;
    font-weight: 600;
}

.related-post-card a:hover {
    text-decoration: underline;
}
    </style>
</head>
<body>
<%@ page import="java.sql.*" %>
     <%@ include file="Navbar.jsp" %>
    <%@ include file="LoginRegister.jsp" %>

    <% 
    String id = request.getParameter("id");
    if (id == null || id.isEmpty()) {
        response.sendRedirect("blogs.jsp");
        return;
    }
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
        
        String sql = "SELECT * FROM blogs WHERE id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(id));
        rs = pstmt.executeQuery();
        
        if (!rs.next()) {
            response.sendRedirect("blogs.jsp");
            return;
        }
    %>
    
    <!-- Blog Post Section -->
    <section class="blog-post-section">
        <div class="container">
            <div class="blog-post-header">
                <h1><%= rs.getString("title") %></h1>
                <div class="meta">
                    <span>By <%= rs.getString("author") %></span> | 
                    <span><%= rs.getDate("created_at") %></span>
                </div>
                <img src="<%= rs.getString("image") %>" alt="<%= rs.getString("title") %>">
            </div>
            <div class="blog-post-content">
                <%= rs.getString("content").replace("\n", "<br>") %>
            </div>
        </div>
    </section>

    <%
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
    %>

 <!-- Comments Section -->
<section class="comments-section">
    <div class="container">
        <h3>Comments</h3>

        <!-- Display Existing Comments -->
        <ul class="comment-list">
            <%
                int blogId = Integer.parseInt(request.getParameter("id"));
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
                PreparedStatement pst = conn.prepareStatement("SELECT c.comment, c.created_at, u.name, u.profile_image FROM comments c JOIN users u ON c.user_id = u.id WHERE c.blog_id = ? ORDER BY c.created_at DESC");
                pst.setInt(1, blogId);
                ResultSet rss = pst.executeQuery();

                while (rss.next()) {
            %>
            <li class="comment">
                <div class="comment-meta">
                    <img src="<%= request.getContextPath() %>/<%= (rss.getString("profile_image") != null ? rss.getString("profile_image") : "uploads/default.png") %>" width="30" height="30" style="border-radius: 50%;">
                    <strong><%= rss.getString("name") %></strong> | <small><%= rss.getTimestamp("created_at") %></small>
                </div>
                <p><%= rss.getString("comment") %></p>
            </li>
            <% } %>
        </ul>

        <!-- Comment Form -->
        <%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId != null) {
%>
    <form action="AddCommentServlet" method="POST" style="background: #f9f9f9; padding: 15px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); max-width: 1500px; margin: 20px auto;">
    <input type="hidden" name="blog_id" value="<%= blogId %>">
    <textarea name="comment" required placeholder="Write your comment..." 
        style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 14px; resize: none; transition: all 0.3s ease-in-out;"></textarea>
    <button type="submit" 
        style="background: #007bff; color: white; border: none; padding: 10px 20px; font-size: 16px; border-radius: 5px; cursor: pointer; transition: background 0.3s ease-in-out; display: block; width: 100%; margin-top: 10px;">
        Post Comment
    </button>
</form>

<% } else { %>
  <p>  <a href="javascript:void(0);" 
   onclick="openModal('login')" 
   style="display: inline-block; padding: 10px 20px; font-size: 16px; color: blue; background: transparent; border: 2px solid black; border-radius: 5px; text-decoration: none; transition: all 0.3s ease-in-out;">
   Login
</a>
to post a comment.</p>
<% } %>
    </div>
</section>

<%
    conn.close();
%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    String category = request.getParameter("category"); // Get category from request parameter
    if (category == null || category.isEmpty()) {
        category = "default_category"; // Provide a default category to avoid SQL errors
    }

    Connection connn = null;
    PreparedStatement pstt = null;
    ResultSet rsss = null;
    List<Map<String, String>> relatedBlogs = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
        
        String query = "SELECT id, title, image, description FROM blogs WHERE category = ? ORDER BY RAND() LIMIT 3";
        pstt = connn.prepareStatement(query);
        pstt.setString(1, category);
        rsss = pstt.executeQuery();

        while (rsss.next()) {
            Map<String, String> blog = new HashMap<>();
            blog.put("id", rsss.getString("id"));
            blog.put("title", rsss.getString("title"));
            blog.put("image", rsss.getString("image"));
            blog.put("description", rsss.getString("description"));
            relatedBlogs.add(blog);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rsss != null) try { rsss.close(); } catch (Exception e) {}
        if (pstt != null) try { pstt.close(); } catch (Exception e) {}
        if (connn != null) try { connn.close(); } catch (Exception e) {}
    }
%>

<!-- Related Posts Section -->
<section class="related-posts-section">
    <div class="container">
        <h3>Related Posts</h3>
        <div class="row">
            <% if (relatedBlogs.isEmpty()) { %>
                <p>No related blogs found.</p>
            <% } else { 
                for (Map<String, String> blog : relatedBlogs) { %>
                    <div class="col-md-4">
                        <div class="related-post-card">
                            <img src="<%= blog.get("image") %>" alt="Related Blog">
                            <div class="content">
                                <h4><%= blog.get("title") %></h4>
                                <p><%= blog.get("description") %></p>
                                <a href="single-blog.jsp?id=<%= blog.get("id") %>">Read More</a>
                            </div>
                        </div>
                    </div>
                <% } 
            } %>
        </div>
    </div>
</section>

    <!-- Include Footer -->
    <%@ include file="Footer.jsp" %>

    <!-- Add Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>