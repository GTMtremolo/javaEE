<%-- 
    Document   : ListProduct
    Created on : Oct 14, 2017, 1:44:42 PM
    Author     : giangtm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Divine Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/slider.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">

    </head>
    <body>
        <%@include file="Header.jsp"%>    
        <div class="container">

            <jsp:useBean id="pb" class="com.bean.ProductsBean" scope="request"/>
            <jsp:useBean id="urlb" class="com.bean.URLImageBean" scope="request"/>
            <jsp:setProperty name="pb" property="category" param="category"/>

            <div class="row">
            <c:forEach var="p" items="${pb.products}">
                
                    <div class="col-md-4">
                        <jsp:setProperty name="urlb" property="productID" value="${p.id}"/>
                        <img src="${urlb.urlImages.get(0).imageURL}" style="width: 300px;
                             height: 200px" class="img-responsive center-block img-rounded"/>
                        <P></P>
                        <h4 style="text-align: center; color: red"><b>${p.name}</b></h4>
                        <h4 style="text-align: center; color: gray">$:${p.unitPrice}</h5>
                    </div>
                    
                
            </c:forEach>
                </div>
        </table
    </div>
    <%@include file="Footer.jsp"%>    


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
</html>
