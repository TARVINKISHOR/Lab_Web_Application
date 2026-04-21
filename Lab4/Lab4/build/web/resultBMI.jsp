<%-- 
    Document   : resultBMI
    Created on : Apr 21, 2026, 2:25:39 PM
    Author     : Kishor Mohan
--%>

<%-- resultBMI.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bmi.css"/>

<%@ include file="header.jsp" %>

<%

    String bmiResult = request.getParameter("bmi");
    String categoryResult = request.getParameter("category");
    String weightResult = request.getParameter("weight");
    String heightResult = request.getParameter("height");

    double bmi = 0;
    double weight = 0;
    double height = 0;
    String category = "N/A";

    try {
        bmi = Double.parseDouble(bmiResult);
    } catch (Exception e) {
    }
    try {
        weight = Double.parseDouble(weightResult);
    } catch (Exception e) {
    }
    try {
        height = Double.parseDouble(heightResult);
    } catch (Exception e) {
    }
    if (categoryResult != null) {
        category = categoryResult;
    }


    String badgeClass = "badge-normal";
    if ("Underweight".equals(category)) {
        badgeClass = "badge-underweight";
    } else if ("Overweight".equals(category)) {
        badgeClass = "badge-overweight";
    }
%>

<div class="card">
    <h2 class="card-title">BMI Result</h2>

    <div class="result-group">
        <label>Weight</label>
        <p><%= String.format("%.1f", weight)%> kg</p>
    </div>

    <div class="result-group">
        <label>Height</label>
        <p><%= String.format("%.2f", height)%> m</p>
    </div>

    <hr class="divider">

    <div class="result-group">
        <label>Your BMI</label>
        <p class="bmi-value"><%= String.format("%.2f", bmi)%></p>
        <span class="bmi-badge <%= badgeClass%>"><%= category%></span>
    </div>

    <hr class="divider">

    <div class="result-group">
        <label>BMI Scale Reference</label>
        <p style="font-size:0.82rem; color: var(--muted); line-height: 1.7;">
            &lt; 18.5 &rarr; Underweight<br>
            18.5 &ndash; 25.0 &rarr; Normal<br>
            &gt; 25.0 &rarr; Overweight
        </p>
    </div>

    <button class="btn-back" onclick="window.location.href = 'bmiCalculator.jsp'">
        &#8592; Calculate Again
    </button>
</div>

<%@ include file="footer.jsp" %>
