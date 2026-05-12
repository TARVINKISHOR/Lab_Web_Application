<%-- 
    Document   : insertAuthor
    Created on : May 12, 2026, 3:40:35 PM
    Author     : Kishor Mohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Lab 6 - Task 2</title>
    </head>
    <body>

        <h2>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h2>

        <fieldset>
            <legend>Author Registration</legend>

            <form action="processAuthor.jsp" method="post">

                <table>
                    <tr>
                        <td><label for="authno">Author No</label></td>
                        <td><input type="text" id="authno" name="authno" placeholder="E.g.: U9XXXXXX" /></td>
                    </tr>
                    <tr>
                        <td><label for="name">Name</label></td>
                        <td><input type="text" id="name" name="name" placeholder="Enter your name" /></td>
                    </tr>
                    <tr>
                        <td><label for="address">Address</label></td>
                        <td><input type="text" id="address" name="address" placeholder="Enter your address" /></td>
                    </tr>
                    <tr>
                        <td><label for="city">City</label></td>
                        <td><input type="text" id="city" name="city" placeholder="Enter your city" /></td>
                    </tr>
                    <tr>
                        <td><label for="state">State</label></td>
                        <td>
                            <select id="state" name="state">
                                <option value="" disabled selected>Select your state</option>
                                <option>Johor</option>
                                <option>Kedah</option>
                                <option>Kelantan</option>
                                <option>Melaka</option>
                                <option>Negeri Sembilan</option>
                                <option>Pahang</option>
                                <option>Penang</option>
                                <option>Perak</option>
                                <option>Perlis</option>
                                <option>Sabah</option>
                                <option>Sarawak</option>
                                <option>Selangor</option>
                                <option>Terengganu</option>
                                <option>W.P. Kuala Lumpur</option>
                                <option>W.P. Labuan</option>
                                <option>W.P. Putrajaya</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="zip">Zip</label></td>
                        <td><input type="text" id="zip" name="zip" placeholder="Enter your zip" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit" />
                            <input type="reset" value="Cancel" />
                        </td>
                    </tr>
                </table>

            </form>
        </fieldset>


    </body>
</html>