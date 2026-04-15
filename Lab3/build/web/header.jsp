<%-- 
    Document   : header
    Created on : Apr 14, 2026, 2:58:34 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        /* ── Navbar ── */
        .navbar {
            background: burlywood;
            padding: 0 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 60px;
        }

        
        /* ── Links ── */
        .navbar-links {
            list-style: none;
            display: flex;
            gap: 8px;
            margin: 0 auto;
            padding: 0;
        }

        .navbar-links a {
            color: black;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 0.9rem;
        }

        .navbar-links a:hover {
            background: #ffffff18;
            color: #fff;
        }

        .navbar-links a.active {
            background: #e8ff47;
            color: #1a1a2e;
            font-weight: 700;
        }
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>



    <header style="background-color: rgb(252, 228, 197); text-align: center; font-size: 35px; font-weight: bold;">Student Club Registration System</header>
    <body>
    <nav class="navbar">
        <ul class="navbar-links" id="navLinks">
            <li><a href="registerClub.jsp">Register</a></li>
            <li><a href="feeCalculator.jsp">Fee Calculator</a></li>
            <li><a href="memberDirectory.jsp">Member Directory</a></li>
        </ul>
    </nav>
</body>
</ul>
