<%-- 
    Document   : healthInfo
    Created on : Apr 21, 2026, 2:25:55 PM
    Author     : Kishor Mohan
--%>

<%-- healthInfo.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bmi.css"/>
<%-- JSP Page Directive: import Java classes --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>

<%@ include file="header.jsp" %>

<%
    // Store BMI categories using ArrayList
    ArrayList<String> categories = new ArrayList<>();
    categories.add("Underweight");
    categories.add("Normal");
    categories.add("Overweight");

    // BMI range data
    LinkedHashMap<String, String[]> bmiData = new LinkedHashMap<>();
    // key = category, value = [range, description, advice, badgeClass]
    bmiData.put("Underweight", new String[]{
        "< 18.5",
        "Body weight is below the healthy range for height.",
        "Increase caloric intake with nutrient-rich foods. Consult a dietitian.",
        "badge-underweight"
    });
    bmiData.put("Normal", new String[]{
        "18.5 – 25.0",
        "Body weight is within the healthy range for height.",
        "Maintain a balanced diet and regular physical activity.",
        "badge-normal"
    });
    bmiData.put("Overweight", new String[]{
        "> 25.0",
        "Body weight exceeds the healthy range for height.",
        "Adopt a calorie-controlled diet and increase physical activity.",
        "badge-overweight"
    });
%>

<div class="page-title">Health Information</div>
<p class="page-subtitle">BMI categories, ranges, and health guidance based on Body Mass Index.</p>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Category</th>
            <th>BMI Range</th>
            <th>Description</th>
            <th>Recommendation</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Dynamically display categories from ArrayList
            for (int i = 0; i < categories.size(); i++) {
                String cat      = categories.get(i);
                String[] data   = bmiData.get(cat);
                String range    = data[0];
                String desc     = data[1];
                String advice   = data[2];
                String badge    = data[3];
        %>
        <tr>
            <td><%= (i + 1) %></td>
            <td><span class="tag <%= badge %>"><%= cat %></span></td>
            <td><strong><%= range %></strong></td>
            <td><%= desc %></td>
            <td><%= advice %></td>
        </tr>
        <% } %>
    </tbody>
</table>

<br>
<button class="btn-back" onclick="window.location.href='bmiCalculator.jsp'">
    &#9632; Go to BMI Calculator
</button>

<%@ include file="footer.jsp" %>

