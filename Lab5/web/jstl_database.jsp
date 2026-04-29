<%-- 
    Document   : jstl_database
    Created on : Apr 29, 2026, 3:07:54 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="sql" uri="jakarta.tags.sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL SQL Tags</title>
    </head>
    <body>
        <h2>User List (Fetched directly using JSTL SQL)</h2>
        <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/webappdevlab5" user="root" password="admin"/>
        <sql:query dataSource="${dbConnection}" var="result">
            SELECT * FROM users;
        </sql:query>
        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightblue;">
                    <th>ID</th>
                    <th>Username</th>
                    <th>Roles</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}" /></td>
                        <td><c:out value="${row.username}" /></td>
                        <td><c:out value="${row.roles}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
