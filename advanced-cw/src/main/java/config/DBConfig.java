package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {
    private static final String URL = "jdbc:mysql://localhost:3306/advancedcw";
    private static final String USER = "root";  // use your MySQL username
    private static final String PASS = "";      // and your password (blank if using XAMPP default)

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
