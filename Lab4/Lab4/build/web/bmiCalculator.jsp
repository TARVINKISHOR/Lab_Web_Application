<%-- 
    Document   : bmiCalculator
    Created on : Apr 21, 2026, 2:24:44 PM
    Author     : Kishor Mohan
--%>

<%-- bmiCalculator.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bmi.css"/>

<%@ include file="header.jsp" %>

<div class="card">
    <h2 class="card-title">BMI Calculator</h2>


    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="error-box">
        <%
            if ("invalid".equals(error)) {
                out.print("&#9888; Please enter valid numeric values for weight and height.");
            } else if ("zeroh".equals(error)) {
                out.print("&#9888; Height must not be zero.");
            }
        %>
    </div>
    <% }%>

    <form action="processBMI.jsp" method="post">
        <div class="form-group">
            <label for="weight">Weight (kg)</label>
            <input type="number" id="weight" name="weight"
                   placeholder="e.g. 50" step="0.1" min="1" required>
        </div>

        <div class="form-group">
            <label for="height">Height (m)</label>
            <input type="number" id="height" name="height"
                   placeholder="e.g. 1.75" step="0.01" min="0.01" required>
        </div>

        <div style="margin-top: 24px;">
            <button type="submit" class="btn btn-primary">Calculate BMI</button>
            <button type="reset"  class="btn btn-secondary">Reset</button>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>

