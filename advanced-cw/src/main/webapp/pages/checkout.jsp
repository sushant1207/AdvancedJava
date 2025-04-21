<%@ page session="true" %>
<%@ page import="java.util.*, model.CartItem" %>
<%
    String customerName = (String) session.getAttribute("userName"); // Optional
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Invoice - Perfume Paradise</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/invoice.css">
</head>
<body>

<div class="invoice-container">
    <h2>Invoice - Perfume Paradise</h2>
    <p><strong>Customer:</strong> <%= customerName != null ? customerName : "Guest" %></p>
    <p><strong>Date:</strong> <%= new java.util.Date() %></p>

    <table class="invoice-table">
        <thead>
            <tr>
                <th>Perfume</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartItem item : cart) {
                double subtotal = item.getPrice() * item.getQuantity();
                total += subtotal;
        %>
            <tr>
                <td><%= item.getName() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= item.getPrice() %></td>
                <td>$<%= subtotal %></td>
            </tr>
        <%
            }
        %>
            <tr class="total-row">
                <td colspan="3" style="text-align:right;"><strong>Total:</strong></td>
                <td><strong>$<%= total %></strong></td>
            </tr>
        </tbody>
    </table>

    <div class="thank-you">
        <h3> Thank you for your order!</h3>
        <p>Your perfumes will be delivered soon.</p>
    </div>
</div>

<%
    session.removeAttribute("cart"); // clear cart after checkout
%>
</body>
</html>
