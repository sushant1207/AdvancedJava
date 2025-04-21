package controller.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
@WebServlet("/admin/users")
public class UserController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        try (Connection conn = DBConfig.getConnection()) {
            List<User> userList = new ArrayList<>();
            String query = "SELECT * FROM user";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setRole(rs.getString("Role"));
                userList.add(user);
            }

            req.setAttribute("users", userList);
            req.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error fetching users: " + e.getMessage());
        }
    }
}
