package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {

    private SubjectDAO subjectDAO = new SubjectDAO();

    // ── GET: view, edit form, delete ──────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session guard — redirect unauthenticated users
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if (action == null) action = "view";

        switch (action) {

            case "view":
                List<SubjectBean> subjects =
                    subjectDAO.getSubjectsByMatric(loggedUser.getMatricNo());
                request.setAttribute("subjectList", subjects);
                request.getRequestDispatcher("/subject/viewSubjects.jsp")
                       .forward(request, response);
                break;

            case "editForm":
                int editId = Integer.parseInt(request.getParameter("id"));
                SubjectBean toEdit = subjectDAO.getSubjectById(editId);
                // Security: make sure the subject belongs to this student
                if (toEdit != null && toEdit.getMatricNo().equals(loggedUser.getMatricNo())) {
                    request.setAttribute("subject", toEdit);
                    request.getRequestDispatcher("/subject/updateSubject.jsp")
                           .forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() +
                        "/SubjectServlet?action=view");
                }
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                subjectDAO.deleteSubject(deleteId, loggedUser.getMatricNo());
                response.sendRedirect(request.getContextPath() +
                    "/SubjectServlet?action=view");
                break;

            default:
                response.sendRedirect(request.getContextPath() +
                    "/SubjectServlet?action=view");
        }
    }

    // ── POST: add, update ─────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session guard
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            SubjectBean newSubject = new SubjectBean();
            newSubject.setMatricNo(loggedUser.getMatricNo());
            newSubject.setSubjectName(request.getParameter("subjectName"));
            subjectDAO.addSubject(newSubject);
            response.sendRedirect(request.getContextPath() +
                "/SubjectServlet?action=view");

        } else if ("update".equals(action)) {
            SubjectBean updated = new SubjectBean();
            updated.setId(Integer.parseInt(request.getParameter("id")));
            updated.setMatricNo(loggedUser.getMatricNo());
            updated.setSubjectName(request.getParameter("subjectName"));
            subjectDAO.updateSubject(updated);
            response.sendRedirect(request.getContextPath() +
                "/SubjectServlet?action=view");
        }
    }
}