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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hardcoded admin credentials (Hash password before checking)
        String adminEmail = "admin123@gmail.com";
        String adminPasswordHash = hashPassword("12345");

        if (email.equals(adminEmail) && hashPassword(password).equals(adminPasswordHash)) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", 0);
            session.setAttribute("userEmail", email);
            session.setAttribute("userName", "Admin");
            session.setAttribute("userRole", "admin");

            response.sendRedirect("admin-dashboard.jsp?message=Admin Login Successful");
            return;
        }

        // Database credentials
        String jdbcURL = "jdbc:mysql://localhost:3306/web_blog";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "SELECT id, name, password, role FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPasswordHash = rs.getString("password"); // Hashed password in DB
                int userId = rs.getInt("id");
                String userName = rs.getString("name");
                String userRole = rs.getString("role");

                // Compare the hashed input password with the stored hash
                if (hashPassword(password).equals(storedPasswordHash)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);
                    session.setAttribute("userEmail", email);
                    session.setAttribute("userName", userName);
                    session.setAttribute("userRole", userRole);

                    response.sendRedirect("index.jsp?message=Login Successful");
                } else {
                    response.sendRedirect("index.jsp?error=Incorrect password!");
                }
            } else {
                response.sendRedirect("index.jsp?error=Email not registered!");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Database Error: " + e.getMessage());
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
