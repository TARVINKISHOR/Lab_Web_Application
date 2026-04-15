<%-- 
    Document   : populateArray
    Created on : Apr 14, 2026, 2:00:25 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String[] salesmen = {"Salesman 1", "Salesman 2", "Salesman 3"};

    int[][] sales = {
        {2500, 2100, 2200},  // Salesman 1: Jan, Feb, Mar
        {2000, 1900, 2400},  // Salesman 2: Jan, Feb, Mar
        {1800, 2200, 2450}   // Salesman 3: Jan, Feb, Mar
    };
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Populate Array</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                padding: 30px;
            }
            .container {
                text-align: center;
            }
            h2 {
                margin-bottom: 20px;
            }
            table {
                border-collapse: collapse;
                margin: 0 auto;
                min-width: 350px;
            }
            th {
                background-color: #b8960c;
                color: white;
                padding: 10px 20px;
                border: 1px solid #ccc;
            }
            td {
                padding: 10px 20px;
                border: 1px solid #ccc;
                text-align: center;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Read Java array and populate it into HTML table.</h2>

            <table>
                <tr>
                    <th>Salesman</th>
                    <th>Jan</th>
                    <th>Feb</th>
                    <th>Mar</th>
                </tr>

                <%-- Read the array and populate into HTML table --%>
                <% for (int i = 0; i < salesmen.length; i++) { %>
                <tr>
                    <td><%= salesmen[i] %></td>
                    <td><%= sales[i][0] %></td>
                    <td><%= sales[i][1] %></td>
                    <td><%= sales[i][2] %></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>

