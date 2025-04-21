package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;

import config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/updateProfile")
@MultipartConfig
public class UpdateProfileController extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userID = Integer.parseInt(req.getParameter("userID"));
        String name = req.getParameter("name");

        Part filePart = req.getPart("profilePic");
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = "user_" + userID + ".png";  // Save as user_1.png etc.

            String imagePath = getServletContext().getRealPath("/images");
            File uploads = new File(imagePath);
            if (!uploads.exists()) {
				uploads.mkdirs();
			}

            File file = new File(uploads, fileName);
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }
        }

        try (Connection conn = DBConfig.getConnection()) {
            String query = "UPDATE user SET Name = ?, ProfileImage = ? WHERE UserID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, fileName); // Can be null if no file uploaded
            ps.setInt(3, userID);

            ps.executeUpdate();

            HttpSession session = req.getSession();
            session.setAttribute("userName", name);
            if (fileName != null) {
                session.setAttribute("profileImage", fileName);
            }

            resp.sendRedirect("pages/profile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
