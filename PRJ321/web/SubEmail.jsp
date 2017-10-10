<%-- 
    Document   : SubEmail
    Created on : Oct 9, 2017, 3:05:08 PM
    Author     : snail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>Email Subscribe</title>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        <div class="container">
            <jstl:if test="${subEmail!=null}">
                <div class="alert alert-success">
                    Your email <strong>${subEmail}</strong> is now subscribed!
                </div>
            </jstl:if>
            <jstl:if test="${subEmail==null}">
                <div class="alert alert-danger">
                    Your email <strong>${subEmail}</strong> is invalid!
                </div>
            </jstl:if>
        </div>
        <%@include file="Footer.jsp"%>
    </body>
</html>
