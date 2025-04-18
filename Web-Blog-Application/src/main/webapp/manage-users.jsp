<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Page Styling */
        html, body {
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .container-users {
            flex: 1;
            margin-top: 30px; /* Adjust based on navbar height */
            padding: 20px;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        /* Table Styling */
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-danger {
            margin-right: 5px;
        }

        /* Responsive Footer */
        .footer {
            width: 100%;
            padding: 15px;
            background: #007BFF;
            color: white;
            text-align: center;
            font-size: 1rem;
            margin-top: auto;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container-users {
                margin-top: 30px; /* More space for smaller screens */
                padding: 10px;
            }

            .table {
                font-size: 14px;
            }

            .btn-danger {
                font-size: 12px;
                padding: 5px 8px;
            }

            .footer {
                font-size: 0.9rem;
                padding: 10px;
            }
        }

        @media (max-width: 480px) {
            .container-users {
                margin-top: 30px; 
                padding: 5px;
            }

            .table {
                font-size: 12px;
            }

            .btn-danger {
                font-size: 10px;
                padding: 4px 6px;
            }

            .footer {
                font-size: 0.8rem;
                padding: 8px;
            }
        }

    </style>
</head>
<body>

  <%@ include file="adminNavbar.jsp" %>

    <div class="container-users">
        <h2 class="text-center">Manage Users</h2>

        <table class="table table-bordered mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Manually added users -->
                <tr>
                    <td>1</td>
                    <td>Rajesh Sharma</td>
                    <td>rajesh@example.com</td>
                    <td>User</td>
                    <td>
                        <a href="delete-user.jsp?id=1" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Pooja Verma</td>
                    <td>pooja@example.com</td>
                    <td>User</td>
                    <td>
                        <a href="delete-user.jsp?id=2" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Amit Gupta</td>
                    <td>amit@example.com</td>
                    <td>User</td>
                    <td>
                        <a href="delete-user.jsp?id=3" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Neha Dubey</td>
                    <td>neha@example.com</td>
                    <td>User</td>
                    <td>
                        <a href="delete-user.jsp?id=4" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Vikram Singh</td>
                    <td>vikram@example.com</td>
                    <td>User</td>
                    <td>
                        <a href="delete-user.jsp?id=5" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>

                <%-- Dynamic database users --%>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "password");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                    while(rs.next()) { 
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("role") %></td>
                    <td>
                        <a href="delete-user.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
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

    <div class="footer">
        &copy; 2025 Blogging Platform. All Rights Reserved.
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>