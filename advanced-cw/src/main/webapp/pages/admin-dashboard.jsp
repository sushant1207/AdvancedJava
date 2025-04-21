<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Perfume" %>
<%@ page import="model.User" %>
<%
    if (session.getAttribute("userID") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Perfume> perfumes = (List<Perfume>) request.getAttribute("perfumes");
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Perfume Paradise</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-dashboard.css">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Perfume Paradise</h2>
            <p>Admin Dashboard</p>
        </div>
        <ul class="sidebar-menu">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Users</a></li>
            <li><a href="#">Orders</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Reports</a></li>
        </ul>
    </div>

    <div class="main-content">
        <header>
            <div class="header-info">
                <h1>Overview</h1>
                <div class="user-info">
                    <span>Welcome, Admin</span>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/logout'">Logout</button>
                </div>
            </div>
        </header>

        <section class="overview">
            <div class="overview-card">
                <div class="card-header">
                    <h2>Total Products</h2>
                </div>
                <div class="card-body">
                    <span><%= (perfumes != null) ? perfumes.size() : 0 %></span>
                </div>
            </div>
        </section>

        <!-- Add Perfume Button and Form -->
        <button onclick="document.getElementById('addForm').style.display='block'" style="margin: 20px 0; padding: 10px;">
            + Add Perfume
        </button>

        <div id="addForm" style="display:none; margin-bottom: 30px;">
            <form action="${pageContext.request.contextPath}/addPerfume" method="post" enctype="multipart/form-data">
                <label>Perfume Name:</label>
                <input type="text" name="name" required />

                <label>Brand:</label>
                <input type="text" name="brand" required />

                <label>Price:</label>
                <input type="number" name="price" step="0.01" required />

                <label>Stock:</label>
                <input type="number" name="stock" required />

                <label>Image:</label>
                <input type="file" name="image" accept="image/*" required />

                <div style="margin-top: 10px;">
                    <button type="submit">Add Perfume</button>
                    <button type="button" onclick="document.getElementById('addForm').style.display='none'">Cancel</button>
                </div>
            </form>
        </div>

        <!-- Perfume List -->
        <section class="recent-declarations">
            <h2>Available Perfumes</h2>
            <table>
                <thead>
                    <tr>
                        <th>Perfume ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price ($)</th>
                        <th>Stock</th>
                        <th>Image</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (perfumes != null && !perfumes.isEmpty()) {
                        for (Perfume p : perfumes) {
                %>
                    <tr>
                        <td><%= p.getPerfumeID() %></td>
                        <td><%= p.getPerfumeName() %></td>
                        <td><%= p.getBrand() %></td>
                        <td>$<%= p.getPrice() %></td>
                        <td><%= p.getStock() %></td>
                        <td>
                            <img src="${pageContext.request.contextPath}/images/<%= p.getImage() %>" width="60" />
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="6">No perfumes available.</td></tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </section>

        <!-- Users List -->
        <section class="user-list" style="margin-top: 50px;">
            <h2>Registered Users</h2>
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (users != null && !users.isEmpty()) {
                        for (User u : users) {
                %>
                    <tr>
                        <td><%= u.getUserID() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getRole() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="4">No users available.</td></tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </section>
    </div>
</div>
</body>
</html>
