package db;


import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;



public class dbConnector {

    static Connection con = null;
    static Statement st = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db25", "root", "root");
            System.out.println("Connected");

            st = con.createStatement();
        }
        catch (SQLException ex) {
            System.out.println(ex);
        }
        catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
    public static Connection getConnection(){
        return con;
    }
        public static Statement getStatement(){
            return st;
        }
}
