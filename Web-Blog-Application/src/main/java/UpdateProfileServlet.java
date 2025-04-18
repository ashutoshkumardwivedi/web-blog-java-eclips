import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please login first!");
            return;
        }

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Part filePart = request.getPart("profilePic");

        // Generate a unique file name for the uploaded image
        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            fileName = "profile_" + userId + "_" + System.currentTimeMillis() + fileExtension;
        }

        // Define the upload directory
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the uploaded file (if any)
        String profilePicPath = null;
        if (fileName != null) {
            profilePicPath = "uploads/" + fileName;
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Hash the password (if provided)
        String hashedPassword = null;
        if (password != null && !password.isEmpty()) {
            hashedPassword = hashPassword(password);
        }

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/web_blog";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Build the SQL query dynamically based on provided fields
            StringBuilder sql = new StringBuilder("UPDATE users SET name = ?");
            if (hashedPassword != null) sql.append(", password = ?");
            if (profilePicPath != null) sql.append(", profile_image = ?");
            sql.append(" WHERE id = ?");

            try (PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
                stmt.setString(1, name);
                int index = 2;
                if (hashedPassword != null) stmt.setString(index++, hashedPassword);
                if (profilePicPath != null) stmt.setString(index++, profilePicPath);
                stmt.setInt(index, userId);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    // Update session attributes
                    session.setAttribute("userName", name);
                    if (profilePicPath != null) {
                        session.setAttribute("profileImage", profilePicPath);
                    }
                    response.sendRedirect("editProfile.jsp?message=Profile updated successfully!");
                } else {
                    response.sendRedirect("editProfile.jsp?error=Failed to update profile!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editProfile.jsp?error=Database error: " + e.getMessage());
        }
    }

    // Method to hash password using MD5
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}