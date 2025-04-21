<%@ page session="true" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) session.getAttribute("userName");
    String profileImage = (String) session.getAttribute("profileImage");
    int userID = (Integer) session.getAttribute("userID"); // now safe
%>


<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
</head>
<body>
	<%@ include file="navbar.jsp" %>
    <div class="profile-container">
        <h2>User Profile</h2>
        <img src="<%= (profileImage != null && !profileImage.isEmpty()) ? "../images/" + profileImage : "../images/default-avatar.png" %>" width="150" />
        
        <form action="../updateProfile" method="post" enctype="multipart/form-data">
            <label>Change Username:</label>
            <input type="text" name="name" value="<%= name %>" required />
            
            <label>Upload Profile Picture (PNG only):</label>
            <input type="file" name="profilePic" accept="image/png" />

            <input type="hidden" name="userID" value="<%= userID %>"/>
            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>
