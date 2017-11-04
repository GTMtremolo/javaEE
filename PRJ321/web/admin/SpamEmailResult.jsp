<%-- 
    Document   : SpamEmailResult
    Created on : Oct 11, 2017, 1:33:45 PM
    Author     : snail
--%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="../images/logo.png">
        <title>Spam Email Result</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container">
            <jstl:if test="${spamResults.size()>0}">   
                <table class="table table-hover table-bordered">
                    <thead>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Sent</th>
                    </thead>
                    <jstl:forEach var="spamResult" items="${spamResults}">
                        <tbody>
                        <td>${spamResult.email}</td>
                        <td>${spamResult.date}</td>
                        <td>${spamResult.sent}</td>
                        </tbody>
                    </jstl:forEach>
                </table>
            </jstl:if>
            <jstl:if test="${!(spamResults.size()>0)}">                
                <div class="well alert-danger">
                    No email was sent!
                </div>
            </jstl:if>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
