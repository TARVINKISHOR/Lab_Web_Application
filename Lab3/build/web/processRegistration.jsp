<%-- 
    Document   : processRegistration
    Created on : Apr 14, 2026, 3:16:16 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration Details</h1>
    </body>
    <fieldset>
        <%
            ArrayList<String[]> registeredStudent = (ArrayList<String[]>) application.getAttribute("studentList");
            if (registeredStudent == null) {
                registeredStudent = new ArrayList<String[]>();
            }

            String name   = request.getParameter("name");
            String matric = request.getParameter("matric");
            String club   = request.getParameter("club");

            if (name != null && matric != null && club != null &&
                !name.isEmpty() && !matric.isEmpty() && !club.isEmpty()) {

                String[] student = {name, matric, club};
                registeredStudent.add(student);

                application.setAttribute("studentList", registeredStudent);
            }

        %>
        <!-- display the output -->
        <p>Thank you for registering in this event..!</p>
        <p>This is your details:</p>
        <p>Name: <%= name%></p>
        <p>Matric No : <%= matric%></p>
        <p>Club: <%=club%></p>
        <body>
        </body>
    </fieldset>
            <%@include file="footer.jsp" %>
</html>
