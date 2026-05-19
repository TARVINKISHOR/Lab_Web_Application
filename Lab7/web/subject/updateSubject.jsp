<%-- 
    Document   : updateSubject
    Created on : May 19, 2026, 3:41:41 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%
    // Session guard
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
    SubjectBean subject = (SubjectBean) request.getAttribute("subject");
    if (subject == null) {
        response.sendRedirect(request.getContextPath() + "/SubjectServlet?action=view");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width:500px">
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="card-title mb-3">Update Subject</h4>
            <form action="<%= request.getContextPath() %>/SubjectServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= subject.getId() %>">
                <div class="mb-3">
                    <label class="form-label">Subject Name</label>
                    <input type="text" name="subjectName" class="form-control"
                           value="<%= subject.getSubjectName() %>" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Update Subject</button>
            </form>
            <hr>
            <a href="<%= request.getContextPath() %>/SubjectServlet?action=view"
               class="btn btn-outline-secondary w-100">← Cancel</a>
        </div>
    </div>
</div>
</body>
</html>
