<%-- 
    Document   : registerClub
    Created on : Apr 14, 2026, 3:04:33 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<br>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="processRegistration.jsp" method="post" onsubmit="return checkName()">
            <label for="name">Name: </label>
            <input type="text" id="name" name="name" required><br><br>
            <label for="matric">Matric Number: </label>
            <input type="text" id="matric" name="matric" required><br><br>
            <label for="club">Selected Club</label>
            <select id="club" name="club">
                <option value="Music Band">Music Band</option>
                <option value="Computer Club">Computer Club</option>
                <option value="Karate Club">Karate Club</option>
            </select id ="club" name="club">
            <p>
                <input type="submit" id="btnSubmit" value="Submit">
                <input type="reset" id="btnCancel" value="Cancel">
            </p>
        </form>
    </body>
    <%@include file="footer.jsp" %>
</html>
