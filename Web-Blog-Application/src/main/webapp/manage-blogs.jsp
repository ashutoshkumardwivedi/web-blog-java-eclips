<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Blogs - Aaru Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
      /* General Styles */
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
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Manage Blogs Container */
.manage-blogs-container {
    flex: 1;
    max-width: 1200px;
    margin: 50px auto;
    padding: 30px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Heading */
.manage-blogs-container h2 {
    color: #007BFF;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 20px;
    text-align: center;
    animation: slideInLeft 1s ease-in-out;
}

@keyframes slideInLeft {
    from { transform: translateX(-100%); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
}

/* Table Styles */
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.table th, .table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.table th {
    background: #007BFF;
    color: white;
}

.table tr:hover {
    background: #f1f1f1;
}

/* Delete Button */
.btn-danger {
    background: linear-gradient(135deg, #dc3545, #c82333);
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.btn-danger:hover {
    background: linear-gradient(135deg, #c82333, #bd2130);
}

/* Footer */
.footer {
    width: 100%;
    padding: 15px;
    background: #007BFF;
    color: white;
    text-align: center;
    font-size: 1rem;
    position: relative;
    bottom: 0;
    margin-top: 20px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .manage-blogs-container {
        width: 90%;
        margin: 20px auto;
    }

    .manage-blogs-container h2 {
        font-size: 2rem;
    }

    .table th, .table td {
        padding: 8px;
    }

    .btn-danger {
        padding: 6px 12px;
        font-size: 12px;
    }
}
            
        }
    </style>
</head>
<body>

    <!-- Include Admin Navbar -->
    <%@ include file="adminNavbar.jsp" %>

    <!-- Manage Blogs Container -->
    <div class="manage-blogs-container">
        <h2>Manage Blogs</h2>

        <!-- Blogs Table -->
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Manually added 5 sample blog items -->
                <tr>
                    <td>1</td>
                    <td>How to Start Blogging</td>
                    <td>Amit Kumar</td>
                    <td>2025-02-10</td>
                    <td>
                        <a href="delete-blog.jsp?id=1" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>SEO Tips for New Bloggers</td>
                    <td>Priya Sharma</td>
                    <td>2025-02-09</td>
                    <td>
                        <a href="delete-blog.jsp?id=2" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Top 10 Blog Monetization Methods</td>
                    <td>Rohan Mehta</td>
                    <td>2025-02-08</td>
                    <td>
                        <a href="delete-blog.jsp?id=3" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Best Hosting for Blogs</td>
                    <td>Anjali Verma</td>
                    <td>2025-02-07</td>
                    <td>
                        <a href="delete-blog.jsp?id=4" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Content Marketing Strategies</td>
                    <td>Sandeep Joshi</td>
                    <td>2025-02-06</td>
                    <td>
                        <a href="delete-blog.jsp?id=5" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>

                <%-- Dynamic database blogs --%>
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "password");
                    java.sql.Statement stmt = con.createStatement();
                    java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM blogs");
                    
                    while(rs.next()) { 
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("author") %></td>
                    <td><%= rs.getDate("date") %></td>
                    <td>
                        <a href="delete-blog.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>

    <!-- Include Footer -->
    <div class="footer">
        &copy; 2025 Aaru Blog. All Rights Reserved.
    </div>

    <!-- Add Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>