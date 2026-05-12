<%-- 
    Document   : processStudent
    Created on : May 12, 2026, 4:34:26 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp"%>
<jsp:useBean id="myStudent" class="lab6.com.Student" scope="request"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:setProperty name="myStudent" property="*"/>

        <%
            int result;

            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Step 1: MySQL driver loaded ...! ");

            String myURL = "jdbc:mysql://localhost/csa3203";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            System.out.println("Step 2: Database is connected ...! ");

            System.out.println("Step 3: Prepared Statements created. ..! ");

            String sInsertQry = "INSERT INTO Student (stuno, stuname, stuprogram) VALUES (?, ?, ?) ";
            System.out.println("\tSOL Query: " + sInsertQry);

            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            System.out.println("Step 4: Perform insertion of record ...! ");
            myPS.setString(1, myStudent.getStuno());
            myPS.setString(2, myStudent.getName());
            myPS.setString(3, myStudent.getProgram());

            result = myPS.executeUpdate();
            if (result > 0) {
                System.out.println("\tRecord successfully added into Student's table ...! ");
            }
            out.print("<p>" + "Record with student no " + myStudent.getStuno() + " successfully created. .! " + "</p>");

            out.print("<p>" + "Details of record are; " + "</p>");
            out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
            out.print("<p>Name : " + myStudent.getName() + "</p>");
            out.print("<p>Program : " + myStudent.getProgram() + "</p>");

            myConnection.close();
        %>
    </body>
</html>
