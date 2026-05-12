<%-- 
    Document   : main
    Created on : May 12, 2026, 11:02:48 PM
    Author     : Kishor Mohan
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");

    // If session does not exist, redirect to login page
    if(username == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>

    <style>
        body{
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container{
            width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2{
            text-align: center;
            color: #333;
        }

        p{
            font-size: 18px;
            margin: 15px 0;
        }

        .logout{
            text-align: center;
            margin-top: 20px;
        }

        .logout a{
            text-decoration: none;
            background-color: crimson;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .logout a:hover{
            background-color: darkred;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Welcome to Main Page</h2>

    <p><b>Username:</b> <%= username %></p>
    <p><b>First Name:</b> <%= firstname %></p>
    <p><b>Last Name:</b> <%= lastname %></p>

    <div class="logout">
        <a href="login.jsp">Logout</a>
    </div>
</div>

</body>
</html>