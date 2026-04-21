<%-- 
    Document   : processInsuranceQuo
    Created on : Apr 21, 2026, 2:16:08 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%

        String icno = request.getParameter("icNo");
        String name = request.getParameter("name");
        String coverage = request.getParameter("coverage");
        String ncdStr = request.getParameter("ncd");
        double price = 0;
        double ncd = 0;
        try {
            price = Double.parseDouble(request.getParameter("marketPrice"));
            ncd = Double.parseDouble(ncdStr);
        } catch (Exception e) {
            price = 0;
            ncd = 0;
        }

        double rate = 0;
        String coverageDisplay = "";
        if ("comprehensive".equals(coverage)) {
            rate = 0.05; // 5%
            coverageDisplay = "Comprehensive";
        } else {
            rate = 0.03; // 3%
            coverageDisplay = "Third Party";
        }

        double insurance = price * rate;

        double discount = insurance * ncd;
        double afterNCD = insurance - discount;

        double sst = afterNCD * 0.08;
        double finalAmount = afterNCD + sst;
    %>

    <body>
        <div class="style.css">
            <h1>Insurance Quotation Result</h1>

            <div class="card">

                <!-- Customer Info -->
                <div class="result-group">
                    <label>IC No:</label>
                    <p><%= icno%></p>
                </div>

                <div class="result-group">
                    <label>Name:</label>
                    <p><%= name%></p>
                </div>

                <div class="result-group">
                    <label>Market Price (RM):</label>
                    <p><%= String.format("%.2f", price)%></p>
                </div>

                <div class="result-group">
                    <label>Coverage Type:</label>
                    <p><%= name%></p>
                </div>

                <div class="result-group">
                    <label>NCD:</label>
                    <p><%= ncdStr%></p>
                </div>

                <hr class="divider">

                <!-- Calculated Results -->
                <div class="result-group">
                    <label>Base Insurance:</label>
                    <p>RM <%= String.format("%.2f", insurance)%></p>
                </div>

                <div class="result-group">
                    <label>NCD Discount:</label>
                    <p>RM <%= String.format("%.2f", discount)%></p>
                </div>

                <div class="result-group">
                    <label>After NCD:</label>
                    <p>RM <%= String.format("%.2f", afterNCD)%></p>
                </div>

                <div class="result-group">
                    <label>SST (8%):</label>
                    <p>RM <%= String.format("%.2f", sst)%></p>
                </div>

                <div class="result-group final">
                    <label>Final Insurance Amount:</label>
                    <p>RM <%= String.format("%.2f", finalAmount)%></p>
                </div>

                <button class="btn" onclick="history.back()">Back</button>

            </div>   
        </div>

    </body>
</html>
