<%-- 
    Document   : login
    Created on : May 12, 2026, 10:58:30 PM
    Author     : Kishor Mohan
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String errorMsg = request.getParameter("errorMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
    }

    form {
      background-color: #ffffff;
      width: 320px;
      margin: 30px auto;
      padding: 20px;
      border: 1px solid #cccccc;
    }

    table {
      width: 100%;
    }

    td {
      padding: 6px;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 5px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      width: 100%;
      padding: 8px;
      background-color: #4a90d9;
      color: white;
      border: none;
      cursor: pointer;
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      background-color: #357abd;
    }

    .error {
      color: red;
      text-align: center;
      font-size: 13px;
      margin-bottom: 8px;
    }

    .register-link {
      text-align: center;
      font-size: 13px;
      margin-top: 10px;
    }
  </style>
</head>
<body>

  <h2>User Login</h2>

  <form action="doLogin.jsp" method="post">

    <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
      <p class="error"><%= errorMsg %></p>
    <% } %>

    <table>
      <tr>
        <td>Username:</td>
        <td><input type="text" name="username" maxlength="15" required /></td>
      </tr>
      <tr>
        <td>Password:</td>
        <td><input type="password" name="password" maxlength="10" required /></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="Login" />
        </td>
      </tr>
    </table>

  </form>

  <div class="register-link">
    No account? <a href="insertUser.html">Register here</a>
  </div>

</body>
</html>

