<%-- 
    Document   : queryStudent
    Created on : May 12, 2026, 9:12:07 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                border-collapse: collapse;
            }
            td, th {
                border: 1px solid #999;
                padding: 0.5rem;
                text-align: left;
            }
            th{
                background: gold;
            }
        </style>
    </head>
    <body>
        <h1> Lab 3 - Task 4 : Retrieving record via JSP page</h1>
        <%
            out.print("<table>");
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th>" + "stuno" + "</th>");
            out.print("<th>" + "name" + "</th>");
            out.print("<th>" + "program" + "</th>");
            out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody>");

        %>

        <%            Class.forName("com.mysql.cj.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost/csa3203";
            Connection conn = DriverManager.getConnection(myURL, "root", "admin");

            Statement myStat = conn.createStatement();

            String myQry = "SELECT * FROM student";
            ResultSet rs = myStat.executeQuery(myQry);

            while (rs.next()) {

                out.println("<tr>");
                out.print("<td width=\"20%\">" + rs.getString(1) + "</td>");
                out.print("<td width=\"40%\">" + rs.getString(2) + "</td>");
                out.print("<td width=\"40%\">" + rs.getString(3) + "</td>");
                out.println("</tr>");
            }

            conn.close();

                out.print("</tbody>");
            out.print("</table>");
        %>
    </body>
</html>
