<%@ page session="true" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String name = (String) session.getAttribute("userName");
%>

<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Perfume Paradise - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
  
        
   

    <!-- Hero Section -->
    <section class="hero">
        <h1>Hello, <%= name %> </h1>
        <p>Where luxury meets scent. Discover your signature perfume today.</p>
        <a href="shop.jsp" class="cta">Shop Now</a>
    </section>

    <!-- Featured Products -->
    <section class="products">
        <h2>Featured Perfumes</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume1.jpeg" alt="Perfume 1">
                <h3>Chanel Coco Mademoiselle</h3>
                <p>Elegant. Feminine. Iconic.</p>
                <button>View</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume2.jpeg" alt="Perfume 2">
                <h3>Dior Sauvage</h3>
                <p>Fresh. Powerful. Earthy.</p>
                <button>View</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/perfume 3.jpeg" alt="Perfume 3">
                <h3>YSL Black Opium</h3>
                <p>Sensual. Addictive. Bold.</p>
                <button>View</button>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Perfume Paradise. All rights reserved.</p>
    </footer>
</body>
</html>
