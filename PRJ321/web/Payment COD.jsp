<%-- 
    Document   : Payment
    Created on : Oct 5, 2017, 8:56:36 PM
    Author     : snail
--%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>Payment: COD</title>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        <div class="well-lg container">
            <%--ORDER INFO--%>
            <div class="alert alert-info">         
                <table class="table-responsive">
                    <tr>
                        <td><strong>Order</strong></td>  
                        <td><strong>:</strong> SE1112</td> 
                    </tr>
                    <tr>
                        <td><strong>Date</strong></td>  
                        <td><strong>:</strong> 00:00 - 10/10/1010</td>
                    </tr>
                    <tr>
                        <td><strong>Status</strong></td>  
                        <td><strong>:</strong> Delivered</td>
                    </tr>
                </table>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <th>Index</th>
                    <th>Index</th>
                    <th>Index</th>
                    <th>Index</th>
                    <th>Index</th>
                </table>
            </div>
        </div>
        <%@include  file="Footer.jsp" %>
    </body>
</html>
