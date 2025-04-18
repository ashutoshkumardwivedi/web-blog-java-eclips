<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Your Blog - Aaru Blog</title>
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
        .create-blog-container {
            flex: 1;
            max-width: 1000px;
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
        }
        .form-label { font-weight: 600; color: #2c3e50; }
        .form-control {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: 0.3s ease-in-out;
        }
        .form-control:focus {
            border-color: #007BFF;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
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
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
        }
        @media (max-width: 768px) {
            .create-blog-container { width: 90%; margin: 20px auto; }
            h2 { font-size: 2rem; }
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %>
    <div class="create-blog-container">
        <h2>Create Your Blog</h2>
        <form action="SubmitBlogServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="csrf_token" value="<%= session.getAttribute("csrfToken") %>">
            <div class="mb-3">
                <label for="title" class="form-label">Blog Title</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="author" class="form-label">Author Name</label>
                <input type="text" class="form-control" id="author" name="author" required>
                
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Select Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="" disabled selected hidden>Choose a category</option>
                    <option value="Travel">Travel</option>
                    <option value="Technology">Technology</option>
                    <option value="Food">Food</option>
                    <option value="Art & Design">Art & Design</option>
                    <option value="Health & Fitness">Health & Fitness</option>
                    <option value="Lifestyle">Lifestyle</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Upload Image</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">Blog Content</label>
                <textarea class="form-control" id="content" name="content" rows="6" placeholder="Write your blog content here..." required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Publish Blog</button>
            </div>
        </form>
    </div>
    <%@ include file="Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
