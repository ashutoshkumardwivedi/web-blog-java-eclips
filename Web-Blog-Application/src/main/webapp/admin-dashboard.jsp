<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            min-height: 100vh; /* Ensures full page height */
            display: flex;
            flex-direction: column;
        }

        /* Admin Dashboard Container */
        .admin-dashboard-container {
            flex: 1; /* Allows content to grow and push footer down */
            max-width: 900px;
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

        h2 {
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

        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            color: #666;
        }

        .btn-primary {
            background: linear-gradient(135deg, #007BFF, #0056b3);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .admin-dashboard-container {
                width: 90%;
                margin: 20px auto;
            }
            h2 {
                font-size: 2rem;
            }
            .row {
                flex-direction: column;
                align-items: center;
            }
            .col-md-4 {
                width: 100%;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Include Admin Navbar -->
    <%@ include file="adminNavbar.jsp" %>

    <!-- Admin Dashboard Container -->
    <div class="admin-dashboard-container">
        <h2>Admin Dashboard</h2>
        <div class="row">
            <!-- Manage Blogs Card -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Manage Blogs</h5>
                        <p class="card-text">Edit, delete, and manage all blogs.</p>
                        <a href="manage-blogs.jsp" class="btn btn-primary">Go to Blogs</a>
                    </div>
                </div>
            </div>
            <!-- Manage Users Card -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Manage Users</h5>
                        <p class="card-text">View and remove users.</p>
                        <a href="manage-users.jsp" class="btn btn-primary">Go to Users</a>
                    </div>
                </div>
            </div>
            <!-- Manage Categories Card -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Manage Categories</h5>
                        <p class="card-text">Add, edit, and delete blog categories.</p>
                        <a href="manage-categories.jsp" class="btn btn-primary">Go to Categories</a>
                    </div>
                </div>
            </div>
        </div>
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