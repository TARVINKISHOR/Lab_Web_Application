<%-- 
    Document   : processUser
    Created on : May 12, 2026, 10:55:23?PM
    Author     : Kishor Mohan
--%>

<%@ page import="java.sql.*" %>
<%
    String username  = request.getParameter("username");
    String password  = request.getParameter("password");
    String firstname = request.getParameter("firstname");
    String lastname  = request.getParameter("lastname");

    String message = "";
    boolean success = false;

    if (username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty() ||
        firstname == null || firstname.trim().isEmpty() ||
        lastname  == null || lastname.trim().isEmpty()) {

        message = "All fields are required.";

    } else {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/csa3203",
                "root",
                "admin"
            );

            String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username.trim());
            ps.setString(2, password.trim());
            ps.setString(3, firstname.trim());
            ps.setString(4, lastname.trim());
            ps.executeUpdate();

            success = true;
            message = "User registered successfully!";

        } catch (SQLIntegrityConstraintViolationException e) {
            message = "Username already exists. Please choose another.";
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (ps   != null) try { ps.close();   } catch (Exception ignored) {}
            if (conn != null) try { conn.close(); } catch (Exception ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Registration Result</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      padding: 20px;
    }

    .box {
      background-color: #ffffff;
      width: 350px;
      margin: 40px auto;
      padding: 20px;
      border: 1px solid #cccccc;
      text-align: center;
    }

    .success { color: green; }
    .error   { color: red;   }

    a {
      display: inline-block;
      margin-top: 12px;
      color: #4a90d9;
      text-decoration: none;
      font-size: 14px;
    }

    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <div class="box">
    <h2>Registration Result</h2>
    <p class="<%= success ? "success" : "error" %>"><%= message %></p>
    <% if (success) { %>
      <a href="login.jsp">Go to Login</a>
    <% } else { %>
      <a href="insertUser.html">Go Back</a>
    <% } %>
  </div>
</body>
</html>

