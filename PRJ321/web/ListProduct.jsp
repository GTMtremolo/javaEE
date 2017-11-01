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



        <style>
            .slider {
                -webkit-appearance: none;
                width: 100%;
                height: 15px;
                border-radius: 5px;   
                background: #d3d3d3;
                outline: none;
                opacity: 0.7;
                -webkit-transition: .2s;
                transition: opacity .2s;
            }

            .slider::-webkit-slider-thumb {
                -webkit-appearance: none;
                appearance: none;
                width: 25px;
                height: 25px;
                border-radius: 50%; 
                background: #AAAAAA;
                cursor: pointer;
            }

            .slider::-moz-range-thumb {
                width: 25px;
                height: 25px;
                border-radius: 50%;
                background: #FFFFFF;
                cursor: pointer;
            }

        </style>

    </head>
    <body>
        <%@include file="Header.jsp"%>    
        <div class="container">

            <jsp:useBean id="pb" class="com.bean.ProductsBean" scope="request"/>
            <jsp:useBean id="urlb" class="com.bean.URLImageBean" scope="request"/>
            <jsp:setProperty name="pb" property="category" param="category"/>
            <jsp:setProperty name="pb" property="name" param="name"/>
            <jsp:setProperty name="pb" property="price" param="price"/>


            <div class="row">
                <div class="col-sm-9">



                    <c:forEach var="p" items="${pb.products}">
                        <jsp:setProperty name="urlb" property="productID" value="${p.id}"/>
                        <div class="col-md-4">
                            <c:url value="ProductDetails.jsp" var="urlDetail">
                                <c:param name="keyId" value="${p.id}"/>
                            </c:url>
                            <a href="${urlDetail}" style="text-decoration: none">
                                <c:choose>
                                    <c:when test="${urlb.urlImages.size()!= 0}">

                                        <img src="${urlb.urlImages.get(0).imageURL}" style="width: 300px;
                                             height: 200px" class="img-responsive center-block img-rounded"/>
                                    </c:when>
                                    <c:otherwise>
                                        <h4 style="width: 300px;
                                             height: 200px ; text-align: center" ><b>Image Not Found</b></h4>
                                    </c:otherwise>
                                </c:choose>


                                <P></P>
                                <h4 style="text-align: center; color: red"><b>${p.name}</b></h4>
                            </a>

                            <h4 style="text-align: center; color: gray">$:${p.unitPrice}</h5>
                        </div>
                    </c:forEach>

                </div>
                <div class="col-sm-3">
                    <form action="ListProduct.jsp" class="form-horizontal form-group" method="post">
                        <input type="hidden" name ="category" value="${param.category}"/>
                        <div class="row"> 
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="txtName" name="name" placeholder="Enter product's name" value="${param.name}">
                            </div>

                            <div class="col-sm-2">
                                <input type="submit" value="Search" class="btn btn-primary" name="btnSearch" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-10">
                                <label for="maxPrice"> Maximum Price : 
                                </label>
                                <label id="txtValue" > ${param.price} </label>
                                <label> $ </label>
                            </div>

                            <div class="col-sm-10">
                                <input type="range" min="1" max="${pb.maxPrice}" value="${param.price}" class="slider" name="price" id="myRange">
                            </div>
                        </div>

                    </form>

                </div>

            </div>

        </div>
        <%@include file="ChatLive.jsp"%>
        <%@include file="Footer.jsp"%>    


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

            $(document).ready(function () {

                $("#myRange").change(function () {
                    var result = $("#myRange").val();
                    $("#txtValue").text(result);
                });
            });
        </script>


    </body>
</html>
