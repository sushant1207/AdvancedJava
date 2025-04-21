<%@ page session="true" %>
<%@ page import="java.util.*, model.CartItem" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();
    double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css" />
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="cart-container">
    <h2>Your Shopping Cart</h2>

    <%
        if (cart.isEmpty()) {
    %>
        <p>Your cart is empty. <a href="shop.jsp">Go shopping!</a></p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Action</th>
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
                    <td>
                        <form action="../cart" method="post">
                            <input type="hidden" name="id" value="<%= item.getProductId() %>" />
                            <button type="submit" name="action" value="remove">Remove</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <div class="cart-summary">
            <h3>Total: $<%= total %></h3>
			<form action="../checkout" method="post">
    			<button type="submit" class="checkout-btn">Checkout</button>
			</form>

        </div>
    <%
        }
    %>
</div>

</body>
</html>
