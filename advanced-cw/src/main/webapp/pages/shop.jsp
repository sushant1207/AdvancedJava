<%@ page session="true" %>
<%@ page import="java.util.*, model.CartItem" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Shop - Perfume Paradise</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css" />
</head>
<body>
    <header class="navbar">
        <div class="logo">Perfume Paradise</div>
        <div class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="cart.jsp">Cart</a>
            <a href="profile.jsp">Profile</a>
            <a href="../logout">Logout</a>
        </div>
    </header>

    <section class="shop">
        <h2>Explore Perfumes</h2>
        <div class="product-grid">

            <!-- Product 1 -->
            <form action="../cart" method="post" class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume1.jpeg" alt="Perfume 1">
                <h3>Chanel Coco Mademoiselle</h3>
                <p>Price: $140</p>
                <input type="hidden" name="id" value="1" />
                <input type="hidden" name="name" value="Chanel Coco Mademoiselle" />
                <input type="hidden" name="price" value="140" />
                <input type="number" name="quantity" value="1" min="1" />
                <button type="submit" name="action" value="add">Add to Cart</button>
            </form>

            <!-- Product 2 -->
            <form action="../cart" method="post" class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume2.jpeg" alt="Perfume 2">
                <h3>Dior Sauvage</h3>
                <p>Price: $135</p>
                <input type="hidden" name="id" value="2" />
                <input type="hidden" name="name" value="Dior Sauvage" />
                <input type="hidden" name="price" value="135" />
                <input type="number" name="quantity" value="1" min="1" />
                <button type="submit" name="action" value="add">Add to Cart</button>
            </form>

            <!-- Product 3 -->
            <form action="../cart" method="post" class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume 3.jpeg" alt="Perfume 3">
                <h3>YSL Black Opium</h3>
                <p>Price: $120</p>
                <input type="hidden" name="id" value="3" />
                <input type="hidden" name="name" value="YSL Black Opium" />
                <input type="hidden" name="price" value="120" />
                <input type="number" name="quantity" value="1" min="1" />
                <button type="submit" name="action" value="add">Add to Cart</button>
            </form>

        </div>
    </section>
</body>
</html>
