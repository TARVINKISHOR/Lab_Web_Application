<%-- 
    Document   : feeCalculator
    Created on : Apr 14, 2026, 3:51:00 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Membership Fee Calculator Page</title>
    </head>



    <form id="memberFee" method="get">
        <fieldset>
            <legend>Membership Fee Calculator</legend>
            <label for="activity" required>Number of Activities</label>
            <input type="text" id="activity" name="activity" size="10" placeholder="activity" ><br/>
            <p>
                <input type="submit" id="btnSubmit" value="Submit">
                <input type="reset" id="btnCancel" value="Cancel">
            </p>
        </fieldset>
    </form>

    <%
        String activity = request.getParameter("activity");
        final double fee = 10;
        Double totalFee = null;
        
        

        if ( activity != null && !activity.isEmpty()){
        totalFee = Double.parseDouble(activity) * fee;
        }
    %>
            <!-- display the output -->
        <p style="color: blue;">Details of activity fee</p>
        <p>Activity <%=activity%></p>
        <p>Fixed Fee : <%= fee%></p>
        <p>Total Fee : <%=totalFee%></p>

        <%@include file="footer.jsp" %>
</html>
