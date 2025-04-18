<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Retrieve user session if it exists

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
        }
        .btn-custom {
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <%@ include file="Navbar.jsp" %> <!-- Include Navbar -->

    <div class="container">
        <div class="profile-container">
            <img src="https://via.placeholder.com/100" alt="Profile Picture" class="profile-pic">
            <h2 class="mt-3"><%= userName %></h2>
            <p class="text-muted"><i class="fas fa-envelope"></i> <%= userEmail %></p>

            <hr>

            <div class="d-grid gap-2">
                <a href="editProfile.jsp" class="btn btn-primary btn-custom"><i class="fas fa-edit"></i> Edit Profile</a>
                <a href="LogoutServlet" class="btn btn-danger btn-custom"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
