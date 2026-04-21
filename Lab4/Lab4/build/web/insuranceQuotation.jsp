<%-- 
    Document   : insuranceQuotation
    Created on : Apr 21, 2026, 2:09:48 PM
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
    <body>
    <h1>Insurance Quotation</h1>
 
        <div class="card">
            <form action="processInsuranceQuo.jsp" method="post">
                <fieldset>
                    <legend>Insurance Calculation</legend>
 
                    <div class="form-group">
                        <label for="icNo">IC No*</label>
                        <input type="text" id="icNo" name="icNo"
                               placeholder="E.g. 401210-08-0478" required>
                    </div>
 
                    <div class="form-group">
                        <label for="name">Name*</label>
                        <input type="text" id="name" name="name"
                               placeholder="Enter name" required>
                    </div>
 
                    <div class="form-group">
                        <label for="marketPrice">Market Price*</label>
                        <input type="number" id="marketPrice" name="marketPrice"
                               placeholder="Price" min="0" step="0.01" required>
                    </div>
 
                    <div class="form-group">
                        <label for="coverageType">Coverage Type</label>
                        <select id="coverageType" name="coverageType">
                            <option value="thirdParty">Third Party</option>
                            <option value="thirdPartyFireTheft">Third Party, Fire &amp; Theft</option>
                            <option value="comprehensive">Comprehensive</option>
                        </select>
                    </div>
 
                    <div class="form-group">
                        <label for="ncd">No Claims Discount (NCD)</label>
                        <select id="ncd" name="ncd">
                            <option value="0.10">10%</option>
                            <option value="0.15">15%</option>
                            <option value="0.20">20%</option>
                            <option value="0.25">25%</option>
                            <option value="0.30">30%</option>
                        </select>
                    </div>
 
                    <div class="buttons">
                        <button type="submit" class="btn">Submit</button>
                        <button type="reset" class="btn">Cancel</button>
                    </div>
                </fieldset>
            </form>
        </div>
 
    </body>
</html>
