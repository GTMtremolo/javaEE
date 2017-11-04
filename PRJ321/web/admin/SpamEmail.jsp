<%-- 
    Document   : SpamEmail
    Created on : Oct 9, 2017, 3:29:39 PM
    Author     : snail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="../images/logo.png">
        <title>Spam Email</title>
    </head>
    <body>  
        <%@include file="Header.jsp"%>
        <div class="container">
            <form action="SpamEmailServlet" method="POST">
                <div class="form-group">
                    <label for="txtHeader">Header: </label>
                    <input type="text" id = "txtHeader"class="form-control" name="txtHeader">
                </div>
                <div class="form-group">
                    <label for="txtHeader">Content: </label>
                    <textarea name="txtContent" class="form-control" rows="15">
                    </textarea>
                </div>
                <input type="submit" name="btnSpam" value="Spam" class="btn btn-danger" />
            </form>
        </div>
        <%@include file="Footer.jsp"%>
    </body>
</html>
