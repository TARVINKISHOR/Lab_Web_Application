<%-- 
    Document   : doLogin
    Created on : May 12, 2026, 11:00:35?PM
    Author     : Kishor Mohan
--%>

<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null ||
        username.trim().isEmpty() || password.trim().isEmpty()) {
        response.sendRedirect("login.jsp?errorMsg=Invalid+username+or+password..!");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean valid = false;
    String firstname = "";
    String lastname  = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/csa3203",
            "root",
            "admin"
        );

        String sql = "SELECT firstname, lastname FROM userprofile WHERE username = ? AND password = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, username.trim());
        ps.setString(2, password.trim());
        rs = ps.executeQuery();

        if (rs.next()) {
            valid     = true;
            firstname = rs.getString("firstname");
            lastname  = rs.getString("lastname");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs   != null) try { rs.close();   } catch (Exception ignored) {}
        if (ps   != null) try { ps.close();   } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }

    if (valid) {
        session.setAttribute("username",  username.trim());
        session.setAttribute("firstname", firstname);
        session.setAttribute("lastname",  lastname);
        response.sendRedirect("main.jsp");
    } else {
        response.sendRedirect("login.jsp?errorMsg=Invalid+username+or+password..!");
    }
%>

