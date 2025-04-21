package controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.*;

import config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addPerfume")
@MultipartConfig
public class AddPerfumeController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        String name = req.getParameter("name");
        String brand = req.getParameter("brand");
        double price = Double.parseDouble(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));

        Part imagePart = req.getPart("image");
        String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
        String uploadPath = req.getServletContext().getRealPath("/images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save file to images folder
        File file = new File(uploadPath + File.separator + fileName);
        Files.copy(imagePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

        try (Connection conn = DBConfig.getConnection()) {
            String sql = "INSERT INTO perfume (PerfumeName, Brand, Price, Stock, Image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, brand);
            stmt.setDouble(3, price);
            stmt.setInt(4, stock);
            stmt.setString(5, fileName);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                resp.sendRedirect("admin/dashboard");
            } else {
                resp.getWriter().println("Failed to add perfume.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
