import java.io.*;
import java.nio.file.*;

import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 5 * 1024 * 1024,    // 5MB
                 maxRequestSize = 10 * 1024 * 1024 // 10MB
)
public class UpdateBlogServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int blogId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String content = request.getParameter("content");

        String imagePath = null;
        Part imagePart = request.getPart("image");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Check if a new image was uploaded
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                String filePath = uploadPath + File.separator + fileName;
                imagePart.write(filePath);

                imagePath = UPLOAD_DIR + "/" + fileName;
            } else {
                // If no new image uploaded, fetch the old image
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
                ps = con.prepareStatement("SELECT image FROM blogs WHERE id = ?");
                ps.setInt(1, blogId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    imagePath = rs.getString("image");
                }
                rs.close();
                ps.close();
            }

            // Update blog
            ps = con.prepareStatement("UPDATE blogs SET title=?, author=?, category=?, content=?, image=? WHERE id=?");
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, category);
            ps.setString(4, content);
            ps.setString(5, imagePath);
            ps.setInt(6, blogId);
            ps.executeUpdate();

            response.sendRedirect("ManageBlog.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (ps != null) ps.close(); if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
