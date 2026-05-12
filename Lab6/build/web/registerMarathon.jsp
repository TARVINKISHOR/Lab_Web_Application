<%-- 
    Document   : registerMarathon
    Created on : May 12, 2026, 9:29:06 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marathon Registration</title>
    </head>
    <body>
        <fieldset style="width: 400px;">
            <legend>Marathon Registration</legend>
            <form action="processMarathon.jsp" method="post">
                <table>
                    <tr>
                        <td>IC No</td>
                        <td>
                            <input type="text" name="icno" 
                                   placeholder="E.g.: 920315-10-1234"
                                   pattern="\d{6}-\d{2}-\d{4}"
                                   maxlength="14"
                                   required
                                   title="Format: YYMMDD-PB-XXXX (e.g.: 920315-10-1234)" />
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter your name" />
                        </td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="category">
                                <option value="5 KM">5 KM</option>
                                <option value="7 KM">7 KM</option>
                                <option value="10 KM">10 KM</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Submit" />
                            <input type="reset" value="Cancel" />
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>
