<%-- 
    Document   : viewSubjects
    Created on : May 19, 2026, 3:41:50 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%@page import="java.util.List"%>
<%
    // Session guard
    StudentBean user = (StudentBean) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
    List<SubjectBean> subjectList = (List<SubjectBean>) request.getAttribute("subjectList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
            <h3 class="mb-0">My Registered Subjects</h3>
            <small class="text-muted">Welcome, <%= user.getFullname() %> (<%= user.getMatricNo() %>)</small>
        </div>
        <div class="d-flex gap-2">
            <a href="<%= request.getContextPath() %>/subject/registerSubject.jsp" class="btn btn-success">+ Add Subject</a>
            <a href="<%= request.getContextPath() %>/UserServlet?action=logout" class="btn btn-outline-dark">Logout</a>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Subject Name</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (subjectList == null || subjectList.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4" class="text-center text-muted py-4">No subjects registered yet. Click "+ Add Subject" to get started.</td>
                    </tr>
                <%
                    } else {
                        int counter = 1;
                        for (SubjectBean s : subjectList) {
                %>
                    <tr>
                        <td><%= counter++ %></td>
                        <td><%= s.getSubjectName() %></td>
                        <td class="text-center">
                            <a href="<%= request.getContextPath() %>/SubjectServlet?action=editForm&id=<%= s.getId() %>"
                               class="btn btn-sm btn-warning me-1">Edit</a>
                            <a href="<%= request.getContextPath() %>/SubjectServlet?action=delete&id=<%= s.getId() %>"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this subject?')">Delete</a>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>