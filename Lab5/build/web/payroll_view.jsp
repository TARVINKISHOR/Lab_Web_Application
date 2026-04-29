<%-- 
    Document   : payroll_view
    Created on : Apr 29, 2026, 3:37:08 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payroll View</title>
    </head>
    <body>
        <h2>Employee Payroll List</h2>
        <table border="1" cellpadding="8">
            <thead>
                <tr style="background-color: lightgray;">
                    <th>No.</th>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Department</th>
                    <th>Basic Salary</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listData}" var="employee" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${employee.empId}</td>
                    <td>${employee.name}</td>
                    <td>${employee.department}</td>
                    <td><fmt:formatNumber value="${employee.basicSalary}" minFractionDigits="2"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${employee.basicSalary >= 3000}">Senior</c:when>
                            <c:otherwise>Junior</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
