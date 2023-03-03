import db.dbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login1.jsp");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String studentid = req.getParameter("studentid");
        Statement st = null;
        ResultSet rs = null;
        Boolean b = false;
        st = dbConnector.getStatement();
        try {
            String query = "SELECT Bus_Fees FROM student WHERE stdid = '" + studentid + "'";

            rs = st.executeQuery(query);

            if (rs.next()) {
                b = rs.getBoolean(1);
            }
            // Set the current date as a variable
            String currentDate = new java.text.SimpleDateFormat("yyyy_MM_dd").format(new java.util.Date());

            // Check if the column already exists
            DatabaseMetaData dbmd = dbConnector.getConnection().getMetaData();
            rs = dbmd.getColumns(null, null, "student", currentDate);
            boolean columnExists = rs.next();

            if (!columnExists) {
                // Add the new column to the table
                String alterTableSql = "ALTER TABLE student ADD COLUMN " + currentDate + " TIME NOT NULL";
                PreparedStatement alterTableStmt = dbConnector.getConnection().prepareStatement(alterTableSql);
                alterTableStmt.executeUpdate();
            }

            // Insert the current time into the new column
            String insertSql = "UPDATE student SET " + currentDate + " = CURRENT_TIME() WHERE stdid ='" + studentid + "' ";
            PreparedStatement insertStmt = dbConnector.getConnection().prepareStatement(insertSql);
            insertStmt.executeUpdate();
            
           
            System.out.println("Update successful!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        String busLogin = req.getParameter("busLogin");
        
        if(busLogin!=null){
        if (b == true) {
            req.setAttribute("message", "Bus fees paid");
        } else {
            try {
                req.setAttribute("message", "Bus fees not paid");
                String sql = "UPDATE student SET bus_fine = bus_fine + 500  WHERE stdid = '" + studentid + "'";
                int rowsAffected = st.executeUpdate(sql);
                System.out.println(rowsAffected + " rows updated.");
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        }
        req.getRequestDispatcher("/login1.jsp").forward(req, resp);
    }

}
