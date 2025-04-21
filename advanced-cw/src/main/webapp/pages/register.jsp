<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Perfume Paradise</title>
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
<div class="wrapper">
    <form action="../register" method="post" class="form-box">
        <h2>Signup Form</h2>

        <div class="toggle-box">
            <a href="login.jsp"><button type="button">Login</button></a>
            <button type="button" class="active">Signup</button>
        </div>

        <div class="input-box">
            <input type="text" name="name" required>
            <label>Full Name</label>
        </div>

        <div class="input-box">
            <input type="email" name="email" required>
            <label>Email Address</label>
        </div>

        <div class="input-box">
            <input type="password" name="password" required>
            <label>Password</label>
        </div>

       

        <button type="submit" class="login-btn">Register</button>

        <div class="signup-link">
            Already have an account? <a href="/login.jsp">Login now</a>
        </div>
    </form>
</div>
</body>
</html>
