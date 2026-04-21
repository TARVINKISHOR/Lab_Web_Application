<%-- 
    Document   : processCustomer
    Created on : Apr 21, 2026, 1:32:23 PM
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
    <%
// Fixed price
        final double price = 10.0;
// Retrieve form data
        String cust_no = request.getParameter("customerCode");
        String cust_type = request.getParameter("customerType");
        int quantity = 0;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) {
            quantity = 0;
        }
        // Business logic
        double total = 0;
        String message = "";
        if (cust_type.equals("1") && quantity > 100) {
            message = "You're entitled to 10% discount";
            total = quantity * price * 0.9;
        } else if (cust_type.equals("2") && quantity > 100) {
            message = "You're entitled to 25% discount";
            total = quantity * price * 0.75;
        } else {
            message = "You're not entitled to any discount";
            total = quantity * price;
        }
// Display customer type
        String custTypeDisplay = cust_type.equals("1")
                ? "Normal Customer" : "Privilege Customer";
    %>

    <h1>Customer Discount Result</h1>

    <div class="card">

        <div class="result-grid">

            <!-- Left Box: Customer Info -->
            <div class="result-box">
                <h3>Transaction Summary</h3>

                <div class="result-group">
                    <label>Customer Code:</label>
                    <p>S1234</p>
                </div>

                <div class="result-group">
                    <label>Quantity:</label>
                    <p>101</p>
                </div>

                <div class="result-group">
                    <label>Customer Type:</label>
                    <p>Privilege Customer</p>
                </div>
            </div>

            <!-- Right Box: Discount Result -->
            <div class="result-box">
                <h3>Discount Details</h3>

                <div class="result-group-flex">
                    <label>Status:</label>
                    <p>You're entitled to 25% discount</p>
                </div>

                <div class="result-group-flex">
                    <label>Total Amount:</label>
                    <p>RM 757.50</p>
                </div>
            </div>

        </div>

        <button class="btn-back" onclick="history.back()">Back</button>

    </div>


</body>
</html>
