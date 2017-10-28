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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>Product Detail</title>
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
            <!--Has no key ID parameter-->
            <c:if test="${param.keyId==null}">
                <div class="alert alert-danger">
                    Key ID: N/A
                </div>
            </c:if> 

            <!--Has key ID parameter-->
            <c:if test="${param.keyId!=null}">
                <jsp:useBean id="pb" scope="request" class="com.bean.ProductsBean"/>
                <jsp:setProperty name="pb" property="id" param="keyId"/>
                <c:set var="product" value="${pb.productById}"/>    

                <!--FOUND PRODUCT-->
                <c:if test="${product!=null}">
                    <div class="container well col-lg-12" style="background-color: white">
                        <!--Get product images & max index of images-->
                        <jsp:useBean id="uib" scope="request" class="com.bean.URLImageBean"/>
                        <jsp:setProperty name="uib" property="productID" param="keyId"/>
                        <c:set var="imgs" value="${uib.urlImages}"/>
                        <c:set var="maxIndex" value="${imgs.size()-1}"/>

                        <!--Product images carousel-->
                        <div class="container col-lg-4">
                            <div id="carousel" class="carousel slide" data-ride="carousel">
                                <!--Indicators-->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel" data-slide-to="0" class="active"/>
                                    <c:forEach begin="1" end="${maxIndex}" var="step">
                                        <li data-target="#carousel" data-slide-to="${step}"/>
                                    </c:forEach>
                                </ol>
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img src="${imgs.get(0).imageURL}" class="product-image">
                                    </div>
                                    <c:forEach begin="1" end="${maxIndex}" var="step">
                                        <div class="item">
                                            <img src="${imgs.get(step).imageURL}">
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#carousel" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="container col-lg-8" style="padding-bottom: 10px">
                            <!--Product info--> 
                            <div class="container col-lg-4" style="padding-bottom:0px;padding-left:5px;padding-right:0px;padding-top:5px;">
                                <p><strong>Product name: </strong>${product.name}</p>           
                                <c:if test="${product.amount>0}">
                                    <strong>Status: <span style="color: green">Available</span></strong>
                                </c:if>
                                <c:if test="${product.amount<=0}">
                                    <strong>Status: <span style="color: red">Out of stock</span></strong>
                                </c:if>
                            </div>
                        </div>
                        <!--Description-->
                        <div class="container col-lg-8" style="height: 125px; padding: 0px;">   
                            <textarea class="rounded" readonly style="width: 100%; height: 100%; resize: none; background: #f5f5f5; border-radius: 1rem; padding: 5px;">${product.detail}</textarea>
                        </div>
                        <!--Price & add to cart-->
                        <div class="container col-lg-12 center-block" style="padding: 10px;">
                            <!--Price-->
                            <div class="container col-lg-3">
                                <span class="price">$${product.unitPrice}</span>
                            </div>   
                            <!--Button add to Cart-->
                            <form method="POST" action="AddToCartServlet">
                                <!--Quantity-->
                                <div class="container col-lg-2" style="height: 30px; padding-top: 10px;">      
                                    <strong style="text-align: center;">Quantity:<input name="quantity" class="form-control input-sm" type="number" min="1" value="1" max="10" style="float: right; clear: both; width: 50%;"></strong>
                                </div>
                                <div class="container col-lg-2" style="padding: 5px;">                                
                                    <button name="btnAddToCart" class="btn btn-success" type="submit" value="clicked">Add to Cart</button>
                                </div>
                                <input type="hidden" name="productId" value="${param.keyId}"/>
                            </form>
                        </div>
                    </div>
                </c:if>
                <!--FOUND NO PRODUCT-->
                <c:if test="${product==null}">
                    <div class="alert alert-warning">Invalid product ID!</div>
                </c:if>
            </c:if>
        </div>
        <%@include file="Footer.jsp"%>    
    </body>
</html>
