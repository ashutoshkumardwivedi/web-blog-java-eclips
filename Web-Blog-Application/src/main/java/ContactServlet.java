import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final String ADMIN_EMAIL = "amresh91620@gmail.com";  // Your Email
    private static final String SMTP_USERNAME = "amresh91620@gmail.com";  // Your Gmail ID
    private static final String SMTP_PASSWORD = "mlly ppgi tebs bxbz";  // Your Gmail App Password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Email Subject & Body
        String subject = "New Contact Request from " + name;
        String emailContent = "Name: " + name + "\nEmail: " + email + "\nMessage: " + message;

        // Send Email
        boolean success = sendEmail(ADMIN_EMAIL, subject, emailContent);

        // Response Message
        if (success) {
            response.getWriter().println("<script>alert('Message sent successfully!'); window.location='Contact.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Error sending message! Please try again.'); window.location='Contact.jsp';</script>");
        }
    }

    private boolean sendEmail(String to, String subject, String message) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(SMTP_USERNAME));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject(subject);
            msg.setText(message);

            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
