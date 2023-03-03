import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminLoginServlet extends HttpServlet {
        @Override
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("adminlogin.html");
    }

        @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String admin_id = req.getParameter("admin_id");
        String password = req.getParameter("password");

        // Check if the studentid and password are valid
        boolean isValid = validateStudent(admin_id, password);

        if (isValid) {
            // Redirect to login.jsp
            resp.sendRedirect("details.jsp");
        } else {
            // Show error message on login screen
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid ID or password');");
            out.println("location='adminlogin.html';");
            out.println("</script>");
        }
    }

    private boolean validateStudent(String admin_id, String password) {
        // Check if the studentid and password are valid
        // You can implement your own logic to validate the studentid and password
        // and return true if they are valid, false otherwise.
        
        return admin_id.equals("vasu@1234") && password.equals("08182003");
    }
}
