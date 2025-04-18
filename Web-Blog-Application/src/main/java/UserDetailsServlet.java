import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UserDetailsServlet")
public class UserDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?error=Please login first!");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/web_blog";
        String dbUser = "root";
        String dbPassword = "";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "SELECT id, name, email, profile_image FROM users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, userEmail);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("userId", rs.getInt("id"));
                        session.setAttribute("userName", rs.getString("name"));

                        // ✅ FIX: Database se image properly fetch aur check karo
                        String profileImage = rs.getString("profile_image");
                        if (profileImage == null || profileImage.trim().isEmpty()) {
                            profileImage = "uploads/default.png"; // Default image
                        } else {
                            profileImage = "uploads/" + profileImage; // Database se jo image mili use karo
                        }
                        session.setAttribute("profileImage", profileImage);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error: " + e.getMessage());
            return;
        }

        response.sendRedirect("editProfile.jsp");
    }
}
