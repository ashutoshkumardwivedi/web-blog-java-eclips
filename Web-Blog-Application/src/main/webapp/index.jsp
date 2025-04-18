<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Retrieve messages from request parameters
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="Navbar.jsp" %> 

    <!-- Include Login/Register if user is not logged in -->
    <%@ include file="LoginRegister.jsp" %>


    <!-- Home Section -->
    <%@ include file="Home.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        window.onload = function () {
            <% if (message != null && !message.isEmpty()) { %>
                alert('<%= message %>');
            <% } %>

            <% if (error != null && !error.isEmpty()) { %>
                alert('<%= error %>');
            <% } %>
        };
        
    </script>

</body>
</html>
