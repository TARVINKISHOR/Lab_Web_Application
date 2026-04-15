<%-- 
    Document   : memberDirectory
    Created on : Apr 14, 2026, 4:17:12 PM
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
    <%
        // retrieve the ArrayList from application scope
        ArrayList<String[]> studentList = (ArrayList<String[]>) application.getAttribute("studentList");

        // always check for null in case no one has registered yet
        if (studentList == null) {
            studentList = new ArrayList<String[]>();
        }
    %>
    <body>
        <% if (!studentList.isEmpty()) { %>
        <table border="1">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Matric No</th>
                <th>Club</th>
            </tr>
            <% for (int i = 0; i < studentList.size(); i++) {
                String[] s = studentList.get(i);%>
            <tr>
                <td><%= i + 1%></td>
                <td><%= s[0]%></td>
                <td><%= s[1]%></td>
                <td><%= s[2]%></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <p>No students registered yet.</p>
        <% }%>

    </body>
    <%@include file="footer.jsp" %>
</html>
