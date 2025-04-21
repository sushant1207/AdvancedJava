package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;

import config.DBConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (userID == null || cart == null || cart.isEmpty()) {
            resp.sendRedirect("pages/cart.jsp"); // fallback
            return;
        }

        try (Connection conn = DBConfig.getConnection()) {
            // 1. Insert into ordertable
            String orderSQL = "INSERT INTO ordertable (UserID, OrderDate) VALUES (?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(orderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userID);
            orderStmt.setDate(2, java.sql.Date.valueOf(LocalDate.now()));
            orderStmt.executeUpdate();

            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderID = 0;
            if (rs.next()) {
                orderID = rs.getInt(1);
            }

            // 2. Insert each item into orderitem table
            String itemSQL = "INSERT INTO orderitem (OrderID, PerfumeID, OrderQuantity) VALUES (?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (CartItem item : cart) {
                itemStmt.setInt(1, orderID);
                itemStmt.setInt(2, item.getProductId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();

            // 3. Clear cart from session
            session.removeAttribute("cart");

            // 4. Redirect to confirmation
            resp.sendRedirect("pages/confirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Checkout failed: " + e.getMessage());
        }
    }
}
