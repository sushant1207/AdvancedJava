package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConfig.getConnection()) {
            String sql = "SELECT * FROM user WHERE Email = ? AND Password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userID", rs.getInt("UserID"));
                session.setAttribute("userName", rs.getString("Name"));
                session.setAttribute("role", rs.getString("Role"));

                String role = rs.getString("Role");
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("pages/admin-dashboard.jsp");
                } else {
                    response.sendRedirect("pages/home.jsp");
                }
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Invalid email or password'); window.location='pages/login.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
