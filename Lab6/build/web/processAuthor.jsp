<%-- 
    Document   : processAuthor
    Created on : May 12, 2026, 3:53:25 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*"%>
<jsp:useBean id="myAuthor" class="lab6.com.Author" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>
        
        <jsp:setProperty name="myAuthor" property="*"/>
        
        <%
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String myURL = "jdbc:mysql://localhost/csa3203";
            Connection conn = DriverManager.getConnection(myURL,"root","admin");
            

            String sInsertQuery = "INSERT INTO Author (authno, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = conn.prepareStatement(sInsertQuery);
            
            pstmt.setString(1, myAuthor.getAuthno());
            pstmt.setString(2, myAuthor.getName());
            pstmt.setString(3, myAuthor.getAddress());
            pstmt.setString(4, myAuthor.getCity());
            pstmt.setString(5, myAuthor.getState());
            pstmt.setString(6, myAuthor.getZip());
            

            int result = pstmt.executeUpdate();
            if (result > 0) {
                
                out.println("\tRecord successfully added into Author table ...!");
                out.println("<p>" + "Record withh author no " + myAuthor.getAuthno() + " successfully created...!" + "</p>");
                out.println("<p>" + "Details of record are: " + "</p>");
                out.println("<p>Name : " + myAuthor.getName() + "</p>");
                out.println("<p>Address : " + myAuthor.getAddress() + "</p>");
                out.println("<p>City : " + myAuthor.getCity()+ "</p>");
                out.println("<p>State : " + myAuthor.getState()+ "</p>");
                out.println("<p>Zip : " + myAuthor.getZip()+ "</p>");

                System.out.println("Close database connection");
                
                System.out.println(" ");
                System.out.println("Database connection is closed");

            }
            conn.close();
        %>
    </body>
</html>
