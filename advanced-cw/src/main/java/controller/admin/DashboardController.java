// controller/admin/DashboardController.java
package controller.admin;

import config.DBConfig;
import model.Perfume;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/adminDashboard")
public class DashboardController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Perfume> perfumeList = new ArrayList<>();
        try (Connection conn = DBConfig.getConnection()) {
            String query = "SELECT * FROM perfume";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Perfume p = new Perfume();
                p.setPerfumeID(rs.getInt("PerfumeID"));
                p.setPerfumeName(rs.getString("PerfumeName"));
                p.setBrand(rs.getString("Brand"));
                p.setPrice(rs.getDouble("Price"));
                p.setStock(rs.getInt("Stock"));
                perfumeList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("perfumes", perfumeList);
        req.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(req, resp);
    }
}
