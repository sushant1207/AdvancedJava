<%@ page session="true" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmed - Perfume Paradise</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .confirmation-container {
            max-width: 600px;
            margin: 100px auto;
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .confirmation-container h2 {
            margin-bottom: 20px;
        }

        .confirmation-container a {
            display: inline-block;
            padding: 10px 25px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .confirmation-container a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="confirmation-container">
    <h2>Thank you! Your order has been placed successfully.</h2>
    <a href="home.jsp">Continue Shopping</a>
</div>

</body>
</html>
