<%-- 
    Document   : jspParameter
    Created on : Apr 21, 2026, 2:00:38 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css"/>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Using JSP Standard Action</title>
    </head>

    <%
        String sCode = "CSE3023";
        String sSubject = "Web-based Application Development";
        String sCredit = "3(2+1)";
    %>



    <body>

        <h1>Using jsp:include and jsp:param to display information</h1>
        
        <div class="card">
            <jsp:include page="subjectInfo.jsp" flush="true">
                <jsp:param name="code" value="<%= sCode%>" />
                <jsp:param name="subject" value="<%= sSubject%>" />
                <jsp:param name="credit" value="<%= sCredit%>" />
            </jsp:include>  
        </div>

    </body>
</html>
