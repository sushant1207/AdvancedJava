package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProductId() == id) {
                    item.setQuantity(item.getQuantity() + quantity);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(id, name, quantity, price));
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("pages/shop.jsp");

        } else if ("remove".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            cart.removeIf(item -> item.getProductId() == id);
            session.setAttribute("cart", cart);
            response.sendRedirect("pages/cart.jsp");
        }
    }
}
