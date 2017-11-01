<%-- 
    Document   : OrdersLog
    Created on : Oct 31, 2017, 12:03:48 AM
    Author     : rat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>Order Detail</title>
        <style>
            .price{        
                font-size: xx-large;
                color: white;
                background-color: #555;
                padding: 5px;       
                padding-left: 25px; 
                background-image: url("images/price-tag.png");
                background-position: left top;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp"%>    
        <div class="container">
            <p>Order time: ${orderDetail.orderDate}</p>
            <c:forEach var="cartItem" items="${orderDetail.cartItems}">
                <p>Product ID: ${cartItem.productId}</p>
                <p>Quantity: ${cartItem.quantity}</p>
            </c:forEach>
        </div>
            <%@include file="ChatLive.jsp"%>
        <%@include file="Footer.jsp"%>    
    </body>
</html>
