<%-- 
    Document   : processBMI
    Created on : Apr 21, 2026, 2:25:17 PM
    Author     : Kishor Mohan
--%>

<%-- processBMI.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bmi.css"/>

<%
    String weightRaw = request.getParameter("weight");
    String heightRaw = request.getParameter("height");

    double weight = 0, height = 0, bmi = 0;
    String category = "";


    try {
        weight = Double.parseDouble(weightRaw);
        height = Double.parseDouble(heightRaw);
    } catch (NumberFormatException e) {
        response.sendRedirect("bmiCalculator.jsp?error=invalid");
        return;
    }

    if (height == 0) {
        response.sendRedirect("bmiCalculator.jsp?error=zeroh");
        return;
    }

    // Calculate BMI = weight / height^2
    bmi = weight / (height * height);

    // Determine category
    if (bmi < 18.5) {
        category = "Underweight";
    } else if (bmi <= 25.0) {
        category = "Normal";
    } else {
        category = "Overweight";
    }

    // Pass values forward using jsp:param via request attributes
    request.setAttribute("bmi",      bmi);
    request.setAttribute("category", category);
    request.setAttribute("weight",   weight);
    request.setAttribute("height",   height);
%>

<%-- Forward to resultBMI.jsp using JSP Standard Action --%>
<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmi"      value="<%= bmi %>"/>
    <jsp:param name="category" value="<%= category %>"/>
    <jsp:param name="weight"   value="<%= weight %>"/>
    <jsp:param name="height"   value="<%= height %>"/>
</jsp:forward>

