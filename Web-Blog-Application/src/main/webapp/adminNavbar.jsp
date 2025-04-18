<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve user session
    HttpSession sessionUser = request.getSession(false);
    String userName = (sessionUser != null) ? (String) sessionUser.getAttribute("userName") : null;
    String userEmail = (sessionUser != null) ? (String) sessionUser.getAttribute("userEmail") : null;
    String userRole = (sessionUser != null) ? (String) sessionUser.getAttribute("userRole") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
/* Fix navbar overlapping */
body { padding-top: 56px; background-color: #f8f9fa; }

/* Navbar styling */
.navbar {
    background: linear-gradient(45deg, #007BFF, #0056b3); /* Gradient Blue */
    padding: 0.5rem 1rem;
}
.navbar-brand {
    font-weight: 700;
    font-size: 1.5rem;
    color: white !important;
}

/* Navbar links */
.navbar-nav .nav-link {
    color: white !important;
    font-weight: 500;
    padding: 0.5rem 1rem;
}
.navbar-nav .nav-link:hover {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 0.25rem;
}

/* Profile section */
.admin-profile {
    display: flex;
    align-items: center;
    color: white;
}
.admin-profile span {
    font-size: 1rem;
    font-weight: 500;
}
.logout-btn {
    margin-left: 15px;
    color: #fff;
    text-decoration: none;
    font-weight: bold;
}
.logout-btn:hover {
    text-decoration: underline;
}

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="admin-dashboard.jsp">Admin Panel</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <% if (userName != null && "admin".equals(userRole)) { %>
                    <li class="nav-item">
                        <div class="admin-profile">
                            <span><%= userName %> (<%= userEmail %>)</span>
                            <a href="LogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
