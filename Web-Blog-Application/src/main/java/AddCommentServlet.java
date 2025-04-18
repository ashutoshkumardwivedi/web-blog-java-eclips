import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Fetch user ID from session
        
        // Check if user is logged in
        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
            return;
        }

        int blogId = Integer.parseInt(request.getParameter("blog_id"));
        String comment = request.getParameter("comment");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_blog", "root", "");
            PreparedStatement pst = con.prepareStatement("INSERT INTO comments (blog_id, user_id, comment) VALUES (?, ?, ?)");

            pst.setInt(1, blogId);
            pst.setInt(2, userId);
            pst.setString(3, comment);
            pst.executeUpdate();

            con.close();
            response.sendRedirect("single-blog.jsp?id=" + blogId); // Redirect back to the blog post
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
