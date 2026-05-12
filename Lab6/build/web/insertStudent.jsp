<%-- 
    Document   : insertStudent
    Created on : May 12, 2026, 4:27:13 PM
    Author     : Kishor Mohan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Registration</title>
    </head>
    <body>
        <fieldset style="width: 400px;">
            <legend>Student Registration</legend>
            <form action="processStudent.jsp" method="post">
                <table>
                    <tr>
                        <td>Student No</td>
                        <td>
                            <input type="text" name="stuno" placeholder="E.g.: U00000X" pattern="[A-Z0-9]*"  title="Must start with capital letters then numbers" />
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter your name" />
                        </td>
                    </tr>
                    <tr>
                        <td>Program</td>
                        <td>
                            <select name="program">
                                <option value="bsc_soft_eng">BSc. Soft. Eng.</option>
                                <option value="bsc_it">BSc. with IM</option>
                                <option value="bsc_networking">BSc. in Networking</option>
                                <option value="bsc_robotics">BSc. in Robotics</option>
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