<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Perfume Paradise</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
<div class="wrapper">
    <form action="../login" method="post" class="form-box">
        <h2>Login Form</h2>

        <div class="toggle-box">
            <button type="button" class="active">Login</button>
            <a href="register.jsp"><button type="button">Signup</button></a>
        </div>

        <div class="input-box">
            <input type="email" name="email" required>
            <label>Email Address</label>
        </div>

        <div class="input-box">
            <input type="password" name="password" required>
            <label>Password</label>
        </div>

        <div class="links">
            <a href="#">Forgot password?</a>
        </div>

        <button type="submit" class="login-btn">Login</button>

        <div class="signup-link">
			<a href="${pageContext.request.contextPath}/pages/register.jsp">Signup</a>
        </div>
    </form>
</div>
</body>
</html>
