<%-- 
    Document   : OrdersLog
    Created on : Oct 31, 2017, 12:03:48 AM
    Author     : rat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <h2> My orders </h2>  
            <div class="container">
                <div class="col-lg-4">
                    <form action="GetOrderHistoryServlet">
                        Bill ID : 
                        <select name="billID" onchange="document.forms[0].submit()">
                            <c:forEach var="orr" items="${orderList}">                
                                <option value="${orr.orderId}" ${ orr.orderId == billID ? 'selected' : '' } >${orr.orderId}</option>            
                            </c:forEach>
                        </select>
                    </form>
                </div>            
                <div class="col-lg-8">Order date: <fmt:formatDate value="${orderDetail.orderDate}" pattern="MM/dd/yyyy"/></div>
            </div>

            <!--Show cancel order button if order not canceled-->
            <jsp:useBean id="bB" scope="request" class="com.bean.BillBean"/>
            <c:set var="billState" value="${bB.getBillState(billID)}"/>
            <!--Confirmed, shipping or delivered-->
            <c:if test="${billState!='Canceled'&&billState!='Not confirmed'}">   
                <br>
                <div class="col-lg-12 alert alert-success">
                    <div class="col-lg-10" style="padding-top: 5px;">
                        <strong>Status: ${billState}</strong>
                    </div>
                </div>
            </c:if>
            <!--Not confirmed-->
            <c:if test="${billState=='Not confirmed'}">
                <br>
                <div class="col-lg-12 alert alert-info">
                    <div class="col-lg-10" style="padding-top: 5px;">
                        <strong>Status: ${billState}</strong>
                    </div>
                    <form action="CancelOrderServlet?billId=${billID}" method="POST" onsubmit="return confirm('You sure want to cancel the order?')">
                        <div class="col-lg-2"><button type="submit" class="btn btn-danger pull-right" >Cancel order</button></div>                    
                    </form>
                </div>
            </c:if>
            <!--Show canceled warning if order canceled-->    
            <c:if test="${billState=='Canceled'}"> 
                <br>
                <div class="col-lg-12 alert alert-warning"><strong>Status: Order canceled</strong></div>
            </c:if>
        </div>

        <div class="container">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th style="width: 320px;">Image</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Detail</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="cartItem" items="${orderDetail.cartItems}">
                        <tr>
                            <th><img src="${cartItem.url}" style="width: 320px;
                                     height: 189px;" class="img-responsive center-block img-rounded"/></th>
                            <th> ${cartItem.productId} </th>
                            <th> ${cartItem.productName} </th>
                            <th> ${cartItem.quantity} </th>
                            <th> ${cartItem.unitPrice} </th>
                            <th> ${cartItem.productDetail} </th>
                            <th> ${cartItem.sum} </th>
                            <th> 
                                <input class="btn btn-warning" type="button" value="doisp">
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>

        <div class="container" style="text-align:right; font-weight: bold;">
            Total: ${orderDetail.sum}
        </div>
        <c:if test="${bB.getBillNote(billID)!=null}">
            <div class="container" style="height: 200px;">   
                <label for="note">Note: </label>
                <textarea class="rounded" id="note"readonly style="width: 100%; height: 100%; resize: none; background: #f5f5f5; border-radius: 1rem; padding: 5px;">${bB.getBillNote(billID)}</textarea>
            </div>
        </c:if>
        <%@include file="ChatLive.jsp"%>
        <%@include file="Footer.jsp"%>    
    </body>
</html>
