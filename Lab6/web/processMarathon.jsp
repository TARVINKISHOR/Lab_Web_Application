<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="lab6.com.Database" %>
<%@page import="lab6.com.Marathon" %>
<%@page import="lab6.com.MarathonDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Marathon</title>
    </head>
    <body>
        <jsp:useBean id="myMarathon" class="lab6.com.Marathon" scope="request"/>
        <jsp:setProperty name="myMarathon" property="*"/>
        <%
            int result = 0;

            Database myDB = new Database();

                MarathonDAO obj1 = new MarathonDAO();
                result = obj1.addDetails(myMarathon);
                if (result > 0) {
                    System.out.println("Record successfully added into Marathon's table!");
                    out.print("<p>Record with IC No " + myMarathon.getIcno() + " successfully created!</p>");
                    out.print("<p>Details of record are;</p>");
                    out.print("<p>IC No : " + myMarathon.getIcno() + "</p>");
                    out.print("<p>Name : " + myMarathon.getName() + "</p>");
                    out.print("<p>Category : " + myMarathon.getCategory() + "</p>");
                    myDB.closeConnection();
                }

        %>
    </body>
</html>