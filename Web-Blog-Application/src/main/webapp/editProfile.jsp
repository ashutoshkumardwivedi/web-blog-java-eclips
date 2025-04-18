<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Aaru Blog</title>
    
    <!-- Bootstrap & FontAwesome -->
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
            background: #f4f6f9;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
		
		.edit-profile-container {
		    flex: 1;
		    width: 100%;
		    max-width: 1000px; /* Ensuring maximum width */
		    margin: 30px auto;
		    padding: 20px;
		    background: white;
		    border-radius: 12px;
		    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
		    text-align: center;
		    animation: fadeIn 1s ease-in-out;
		}

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h3 {
            color: #007BFF;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .profile-pic {
            display: block;
            margin: 0 auto 15px;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007BFF;
            transition: transform 0.3s ease;
        }

        .profile-pic:hover {
            transform: scale(1.1);
        }

        .form-label {
            font-weight: 600;
            color: #2c3e50;
            text-align: left;
            display: block;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #007BFF;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #007BFF, #0056b3);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .edit-profile-container {
                width: 90%;
                margin: 30px auto;
            }
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="Navbar.jsp" %>

    <!-- Edit Profile Container -->
    <div class="edit-profile-container">
        <h3>Edit Profile</h3>
        <form action="UpdateProfileServlet" method="POST" enctype="multipart/form-data">
            
            <!-- Profile Picture -->
            <div class="text-center">
   
          <img src="<%= request.getContextPath() %>/<%= profileImage %>" 
     onerror="this.onerror=null; this.src='<%= request.getContextPath() %>/uploads/default.png';" 
     alt="Profile Image"class="profile-pic"> 
     
                <input type="file" class="form-control mt-2" name="profilePic" accept="image/*">
            </div>

            <!-- Email (Disabled) -->
            <div class="mb-3">
                <label class="form-label">Email (Cannot be changed)</label>
                <input type="email" class="form-control" value="<%= session.getAttribute("userEmail") %>" disabled>
            </div>

            <!-- Full Name -->
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="name" value="<%= session.getAttribute("userName") %>" required>
            </div>

            <!-- New Password -->
            <div class="mb-3">
                <label class="form-label">New Password</label>
                <input type="password" class="form-control" name="password">
            </div>

            <!-- Hidden User ID -->
            <input type="hidden" name="userId" value="<%= session.getAttribute("userId") %>">

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>