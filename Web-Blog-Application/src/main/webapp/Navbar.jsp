<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

// Retrieve user session if it exists
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");
    String profileImage = "uploads/default.png"; // ✅ Default image

    if (userEmail != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");

            PreparedStatement pst = con.prepareStatement("SELECT profile_image FROM users WHERE email = ?");
            pst.setString(1, userEmail);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String fetchedImage = rs.getString("profile_image");
                if (fetchedImage != null && !fetchedImage.trim().isEmpty()) {
                    profileImage = fetchedImage; // ✅ Set actual image if found
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
String currentPage = request.getRequestURI();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Blog</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,900;1,400;1,900&display=swap');

        /* Fix overlapping content due to fixed navbar */
        body {
            padding-top: 56px; /* Adjusted for navbar height */
            background-color: #f8f9fa;
        }

        /* Navbar styling */
        .navbar {
            background: linear-gradient(135deg, #2c3e50, #34495e); /* Gradient background */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            background: rgba(44, 62, 80, 0.9); /* Semi-transparent on scroll */
        }

        /* Navbar brand */
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: white !important;
            transition: transform 0.3s ease;
        }

        .navbar-brand:hover {
            transform: scale(1.05);
        }

        /* Navbar links */
        .navbar-nav .nav-item .nav-link {
            color: white !important;
            font-weight: 600;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .navbar-nav .nav-item .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: white;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .navbar-nav .nav-item .nav-link:hover::after {
            width: 100%;
        }

        .navbar-nav .nav-item .nav-link.active::after {
            width: 100%;
        }

        /* Navbar Profile Picture */
        .profile-pic-navbar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid white;
            transition: transform 0.3s ease;
        }

        .profile-pic-navbar:hover {
            transform: scale(1.1);
        }

        /* Dropdown menu styling */
        .navbar-nav .dropdown-menu {
            right: 0;
            left: auto;
            min-width: 250px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff; /* White background */
            color: #000; /* Black text for better visibility */
            animation: fadeInDropdown 0.3s ease-in-out;
        }

        @keyframes fadeInDropdown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Profile dropdown */
        .profile-dropdown {
            text-align: center;
            padding: 10px;
            min-width: 250px;
        }

        /* Profile picture inside dropdown */
        .profile-dropdown .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
            transition: transform 0.3s ease;
        }

        .profile-dropdown .profile-pic:hover {
            transform: scale(1.1);
        }

        /* Dropdown items */
        .profile-dropdown .dropdown-item {
            padding: 10px;
            color: #000; /* Black text for contrast */
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .profile-dropdown .dropdown-item:hover {
            background-color: #f8f9fa;
        }

        /* Centered text for profile dropdown */
        .profile-dropdown .dropdown-header {
            padding-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        /* Fix dropdown positioning */
        .navbar-nav .dropdown-menu-end {
            right: 0 !important;
            left: auto !important;
        }

        /* Fix overlapping dropdown on hover */
        .navbar-nav .dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
        }

        /* Fix mobile dropdown */
        @media (max-width: 991px) {
            .navbar-nav .dropdown-menu {
                position: absolute;
                top: 100%;
                right: 0;
                display: none;
            }

            .navbar-nav .dropdown.show .dropdown-menu {
                display: block;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">My Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link <%= currentPage.contains("index.jsp") ? "active" : "" %>" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentPage.contains("blog.jsp") ? "active" : "" %>" href="blog.jsp">Blogs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentPage.contains("about.jsp") ? "active" : "" %>" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentPage.contains("Contact.jsp") ? "active" : "" %>" href="Contact.jsp">Contact</a>
                </li>

                <% if (userName == null) { %>
                    <li class="nav-item">
                        <a href="javascript:void(0);" class="btn btn-outline-light" onclick="openModal('login')">Login</a>
                    </li>
                <% } else { %>
                   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">

<img src="<%= request.getContextPath() %>/<%= profileImage %>" 
     onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/uploads/default.png';"
     alt="Profile Image" width="30" height="30" style="border-radius: 50%;">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end profile-dropdown" aria-labelledby="userDropdown">
                            <li class="dropdown-header text-center">
             
                    <img src="<%= request.getContextPath() %>/<%= profileImage %>" 
     onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/uploads/default.png';"
     alt="Profile Image" class="profile-pic-navbar"> <h6 class="mt-2 mb-0"><%= userName %></h6>
                                <p class="text-muted small"><i class="fas fa-envelope"></i> <%= userEmail %></p>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-center" href="editProfile.jsp"><i class="fas fa-edit"></i> Edit Profile</a></li>
                            <li><a class="dropdown-item text-center" href="CreateBlog.jsp"><i class="fas fa-edit"></i>Create your Blog</a></li>
                            <li><a class="dropdown-item text-center" href="ManageBlog.jsp"><i class="fas fa-edit"></i>Manage Blog</a></li>
                            <li><a class="dropdown-item text-center text-danger" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS (with Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Add a scroll event listener to make the navbar semi-transparent on scroll
    window.addEventListener('scroll', () => {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>

</body>
</html>