<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("userName");
%>

<div class="navbar">
    <div class="logo">
        <a href="home.jsp">Perfume Paradise</a>
    </div>
    <div class="nav-links">
        <a href="home.jsp">Home</a>
        <a href="shop.jsp">Shop</a>
        <a href="profile.jsp">Profile</a>
        <a href="cart.jsp">Cart</a>
        <a href="../logout">Logout</a>
    </div>
</div>
