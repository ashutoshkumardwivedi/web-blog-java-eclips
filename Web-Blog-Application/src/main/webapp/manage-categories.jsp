<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Categories - Aaru Blog</title>
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
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Manage Categories Container */
.manage-categories-container {
    flex: 1;
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

/* Custom Button Styles */
.manage-categories-container .btn-primary {
    background: linear-gradient(135deg, #007BFF, #0056b3);
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
    font-size: 14px;
    margin-right: 5px;
}

.manage-categories-container .btn-primary:hover {
    background: linear-gradient(135deg, #0056b3, #003f80);
}

.manage-categories-container .btn-danger {
    background: linear-gradient(135deg, #dc3545, #c82333);
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
    font-size: 14px;
}

.manage-categories-container .btn-danger:hover {
    background: linear-gradient(135deg, #c82333, #bd2130);
}

/* Add Category Form */
.add-category-form {
    margin-top: 30px;
}

.add-category-form input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
}

.add-category-form button {
    width: 100%;
    padding: 10px;
    background: linear-gradient(135deg, #28a745, #218838);
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.add-category-form button:hover {
    background: linear-gradient(135deg, #218838, #1e7e34);
}

/* Responsive Design */
@media (max-width: 768px) {
    .manage-categories-container {
        width: 90%;
        margin: 20px auto;
    }

    h2 {
        font-size: 2rem;
    }

    .table th, .table td {
        padding: 8px;
    }
}
    </style>
</head>
<body>

    <!-- Include Admin Navbar -->
    <%@ include file="adminNavbar.jsp" %>

    <!-- Manage Categories Container -->
    <div class="manage-categories-container">
        <h2>Manage Categories</h2>

        <!-- Add Category Form -->
        <div class="add-category-form">
            <form action="AddCategoryServlet" method="POST">
                <input type="text" name="categoryName" placeholder="Enter category name" required>
                <button type="submit">Add Category</button>
            </form>
        </div>

        <!-- Categories Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>Category Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example Categories (Replace with dynamic data from the database) -->
                <tr>
                    <td>Travel</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Technology</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Food</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Art & Design</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Health & Fitness</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Lifestyle</td>
                    <td>
                        <button class="btn btn-primary">Edit</button>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
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