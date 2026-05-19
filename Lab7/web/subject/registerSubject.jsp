<%-- 
    Document   : registerSubject
    Created on : May 19, 2026, 3:41:31 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%
    // Session guard
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width:500px">
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="card-title mb-3">Register New Subject</h4>
            <p class="text-muted">Student: <strong><%= user.getFullname() %></strong>
               | Matric: <strong><%= user.getMatricNo() %></strong></p>
            <form action="<%= request.getContextPath() %>/SubjectServlet" method="POST">
                <input type="hidden" name="action" value="add">
                <div class="mb-3">
                    <label class="form-label">Subject Name</label>
                    <input type="text" name="subjectName" class="form-control" required placeholder="e.g. Web-Based Application Development">
                </div>
                <button type="submit" class="btn btn-success w-100">Register Subject</button>
            </form>
            <hr>
            <a href="<%= request.getContextPath() %>/SubjectServlet?action=view" class="btn btn-outline-secondary w-100">← Back to My Subjects</a>
        </div>
    </div>
</div>
</body>
</html>
