<%-- 
    Document   : subjectInfo
    Created on : Apr 21, 2026, 2:01:53 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject Information</title>
    </head>
    <body>
        <h2>Calling SubjectInfo.Jsp Page</h2>
        
        <p>Code: <%= request.getParameter("code")%></p>
        <p>Subject: <%= request.getParameter("subject")%></p>
        <p>Credit: <%= request.getParameter("credit")%></p>
    </body>
</html>