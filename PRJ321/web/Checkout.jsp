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
        <title>Checkout</title>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        <div class="well-lg container">
            <jstl:if test="${cart.hasProduct()}">
                <form action="PaymentServlet" method="POST">
                    <%--USER INFO--%>
                    <div class="alert alert-info">         
                        <table class="table-responsive">
                            <tr>
                                <td><strong>Username</strong></td>  
                                <td><strong>:</strong> Wade Wilson</td> 
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>  
                                <td><strong>:</strong> deadpool@marvel.com</td>
                            </tr>
                            <tr>
                                <td><strong>Phone</strong></td>  
                                <td><strong>:</strong> 1234567890</td>
                            </tr>
                        </table>
                    </div>
                    <%--PRODUCTS--%>
                    <jsp:useBean id="pb" scope="request" class="com.bean.ProductsBean"/>
                    <jsp:useBean id="uib" scope="request" class="com.bean.URLImageBean"/>
                    <jstl:set var="total" value="0"/>
                    <div class="table-responsive">
                        <table id="productTable" class="table table-hover table-bordered">
                            <thead>
                                <tr class="success">
                                    <th class="text-center">Index</th>
                                    <th class="text-center">Product</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-right">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <jstl:forEach var="cartItem" items="${cart.cartItems}" varStatus="loop">
                                    <!--Only show products that quantity >0-->
                                    <jstl:if test="${cartItem.quantity>0}">
                                        <c:set var="hasProduct" value="1"/>
                                        <!--Get product from DB-->
                                        <jsp:setProperty name="pb" property="id" value="${cartItem.productId}"/>
                                        <c:set var="product" value="${pb.productById}"/> 
                                        <!--Get product image from DB-->
                                        <jsp:setProperty name="uib" property="productID" value="${cartItem.productId}"/>     
                                        <tr>
                                            <td class="text-center" style="vertical-align: middle">${loop.index+1}</td>
                                            <td style="vertical-align: middle">
                                                <div class="media">
                                                    <!--Product image-->
                                                    <div class="media-left">
                                                        <img src="${uib.urlImages.get(0).imageURL}" class="img-rounded top-left" alt="item_1" width="204" height="120">                                   
                                                    </div>
                                                    <!--Product details-->
                                                    <div class="media-body">
                                                        <a href="ProductDetails.jsp?keyId=${cartItem.productId}">
                                                            <h4 class="media-heading">${product.name}</h4>
                                                        </a>                                            
                                                        <p>${product.detail}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <!--Price-->
                                            <td class="text-center" style="vertical-align: middle" >$<span id="price${product.id}">${product.unitPrice}</span></td>
                                            <!--Quantity-->
                                            <td class="text-center" style="vertical-align: middle"><input id="quantity${product.id}" name="quantity${product.id}" type="number" min="0" max="10" class="form-control" value="${cartItem.quantity}" onchange="updateQuantity(${cartItem.productId})"></td>
                                            <!--Total-->
                                            <td class="text-right" style="vertical-align: middle">$<span id="total${product.id}" class="totalValue">${product.unitPrice*cartItem.quantity}</span></td>
                                        </tr>
                                        <jstl:set var="finalTotal" value="${total + (product.unitPrice)*(cartItem.quantity)}"/>
                                    </jstl:if>
                                </jstl:forEach>
                                <tr class="success">
                                    <td><strong>Total</strong></td> 
                                    <td class ="text-right" colspan="4"><strong>$<span id="finalTotal">${finalTotal}</span></strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 text-left">
                            <a href="Home.jsp" class="btn btn-block btn-info">Shop for more!</a>
                        </div>
                        <div class="col-sm-6 text-right">   
                            <button class="btn btn-block btn-success" type="submit">Continue</button>
                        </div>
                    </div>
                </jstl:if>
                <jstl:if test="${!cart.hasProduct()}">
                    <div class="col-sm-12 text-left well-lg alert-warning"><a href="Home.jsp">No product in cart, click to shop for more!</a></div>
                </jstl:if>
            </form>
        </div>
        <%@include file="ChatLive.jsp"%>
        <%@include file="Footer.jsp" %>
    </body>
    <script>
        function updateQuantity(productId) {
            var price = document.getElementById("price" + productId);
            var quantity = document.getElementById("quantity" + productId);
            var totalValues = document.getElementsByClassName("totalValue");
//            Update total value
            document.getElementById("total" + productId).innerHTML = (price.innerText * quantity.value).toFixed(1);

//            Update final total
            var sumTotalValues = 0;
            for (var i = 0; i < totalValues.length; i++) {
                sumTotalValues += parseFloat(totalValues[i].innerText);
            }
            document.getElementById("finalTotal").innerHTML = sumTotalValues.toFixed(1);
        }
    </script>
</html>
