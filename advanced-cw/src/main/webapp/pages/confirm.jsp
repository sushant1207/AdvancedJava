<%@ page session="true" %>
<%
    session.removeAttribute("cart"); // Clear cart
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Placed</title>
</head>
<body>
    <h2> Thank you for your order!</h2>
    <p>Your perfume will arrive soon. <a href="home.jsp">Continue shopping</a></p>
</body>
</html>
