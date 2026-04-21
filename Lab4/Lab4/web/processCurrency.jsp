<%-- 
    Document   : processCurrency
    Created on : Apr 21, 2026, 1:49:14 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"/>
        <title>JSP Page</title>
    </head>

    <%!
// Define constant exchange rates
        final double USD = 0.25;
        final double EURO = 0.21;
        final double JPY = 40;
        final double SGD = 0.32;
// Method to calculate conversion

        private double calculateRate(String currency, int amount) {
            double currencyChange = 0.0;
            if (currency != null) {
                if (currency.equals("1")) {
                    currencyChange = amount * USD;
                } else if (currency.equals("2")) {
                    currencyChange = amount * EURO;
                } else if (currency.equals("3")) {
                    currencyChange = amount * JPY;
                } else {
                    currencyChange = amount * SGD;
                }
            }
            return currencyChange;
        }
    %>

    <%
        
        String amountRaw = request.getParameter("amount");
        String currencyType = request.getParameter("currencyType");
        int amount = 0;
        double total = 0;
        try {
            if (amountRaw != null) {
                amount = Integer.parseInt(amountRaw);
                total = calculateRate(currencyType, amount);
            }
        } catch (Exception e) {
            amount = 0;
        }
// Determine currency name for display
        String currencyName = "N/A";
        if ("1".equals(currencyType))
            currencyName = "USD";
        else if ("2".equals(currencyType))
            currencyName = "EURO";
        else if ("3".equals(currencyType))
            currencyName = "JPY";
        else if ("4".equals(currencyType))
            currencyName = "SGD";
    %>

    

    <body>

        <h1>JSP Application Result</h1>

        <div class="card">
            <h2>Conversion Result</h2>

            <div class="result-group">
                <label>Amount in Ringgit Malaysia (RM):</label>
                <p>RM <%= amount %></p>
            </div>

            <div class="result-group">
                <label>Converted to (<%= currencyName %>):</label>
                <p><%= String.format("%.2f", total) %></p>
            </div>

            <button class="btn" onclick="history.back()">Back to Converter</button>
        
    </body>
</html>
