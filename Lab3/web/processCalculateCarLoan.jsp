<%-- 
    Document   : processCalculateCarLoan
    Created on : Apr 14, 2026, 2:12:03 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <title>Perform Car Loan Calculation</title>
    </head>
    <body>
        <h2>Passing data from main JSP page to another JSP page</h2>
    </body>

    <fieldset>
        <%
        //define variables..
            String amount = null;
            String period = null;
            double result = 0.0;
            final double interest = 0.045;
            //use request.getParameter() method to retrieve data from the form in memberRegister.jsp
            amount = request.getParameter("amount");
            period = request.getParameter("period");
            
            if(!amount.isEmpty() && !period.isEmpty()){
                result = Double.parseDouble(amount) + ((Double.parseDouble(amount) * interest) * Integer.parseInt(period));
            }
        %>
        <!-- display the output -->
        <p style="color: blue;">Details of car loan</p>
        <p>Amount: <%= Double.parseDouble(amount)%></p>
        <p>Period : <%= period%></p>
        <p>Total Loan (+interest): <%=result%></p>
    </fieldset>
</html>
