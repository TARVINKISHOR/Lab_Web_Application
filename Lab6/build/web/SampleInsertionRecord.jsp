<%-- 
    Document   : SampleInsertionRecord
    Created on : May 12, 2026, 1:49:31 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertion record into MySQL</title>
    </head>
    <body>
        <h1>
            Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP’s page.
        </h1>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("Step 1: MySQL driver loaded");
        %>
        <br>

        <%
            String myURL = "jdbc:mysql://localhost:3306/csa3203";
            String USERNAME = "root";
            String PASSWORD = "admin";
            Connection myConnection = null;

            try {
                myConnection = DriverManager.getConnection(myURL, USERNAME, PASSWORD);
            } catch (Exception e) {
                System.out.println("MySQL Driver not found: " + e.getMessage());
            }    
           
            out.println("Step 2: Database is connected....!");
        %>
        <br>

        <%
            out.println("Step 3: Prepared Statements created...!");

            String sInsertQry = "INSERT INTO FirstTable (name) VALUES(?)";

            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
        %>

        <%
            out.println("Step 4: Perform insertion of record...!");
            String name = "Kishor";
            myPS.setString(1, name);

            int result = myPS.executeUpdate();

            if (result > 0) {
        %>

        <%
                out.println("Step 5: Close database connection...!");

                out.println(" ");
                out.println("Database connection is closed....!");

                out.println("<p>" + "The record : (" + name + ") is successfully created...!" + "</p>");

            }

            myConnection.close();
        %>


    </body>
</html>
