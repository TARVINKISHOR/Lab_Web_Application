<%-- 
    Document   : errorStudent
    Created on : May 12, 2026, 4:40:42 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="errorFrm" action="insertStudent.jsp" method="post">
            <h1>Lab 6 - Task 3 - Perform creating and retrieving records via JSP page</h1>
            <p> I when inserting record ...!</p>
            <p><%= exception.getMessage()%></p>

        </form>
    </body>
</html>
