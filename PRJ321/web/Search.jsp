<%-- 
    Document   : Search
    Created on : Oct 18, 2017, 10:58:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/slider.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">
        <title> Search </title>



    </head>

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

    <body>

        <%@include file="Header.jsp"%>

        <script>

            $(document).ready(function () {

                $("#myRange").change(function () {
                    var result = $("#myRange").val();
                    $("#txtValue").text(result);
                });
            });
        </script>

        <form action="SearchServlet" class="form-horizontal form-group" method="post">
            <div class="container">

                <div class="col-lg-8">
                    <input type="text" class="form-control" id="txtName" name="txtName" placeholder="Enter product's name" value="${param.txtName}">
                </div>

                <div class="col-lg-2">
                    <input type="submit" value="Search" class="btn btn-primary" name="btnSearch" />
                </div>

                <br>
                <br>

                <div class="col-sm-4" >
                    <div class="col-sm-10">
                        <label for="maxPrice"> Maximum Price : 
                        </label>
                        <label id="txtValue" > ${param.sliPrice} </label>
                        <label> $ </label>
                    </div>

                    <div class="col-sm-10">
                        <input type="range" min="1" max="300" value="${param.sliPrice}" class="slider" name="sliPrice" id="myRange">
                    </div>
                </div> 

                <div class="col-sm-8">
                    <div class="col-sm-8">
                        <label for="species"> Species </label>
                    </div>
                    <div class="col-lg-8">
                        <div class="col-lg-4">
                            <c:forEach var="item" items="${listCategoryName.subList(0, listCategoryName.size()/2 )}" >
                                <div class="radio">
                                    <label><input type="radio" name="optradio" value="${item}" ${ param.optradio == item ? 'checked': '' } > ${item} </label>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="col-lg-4">
                            <c:forEach var="item" items="${listCategoryName.subList(listCategoryName.size()/2, listCategoryName.size() )}" >
                                <div class="radio">
                                    <label><input type="radio" name="optradio" value="${item}" ${ param.optradio == item ? 'checked': '' } > ${item} </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div> 
                </div>
            </div>
        </form>

        <br>
        <br>

        <!-- <div class="container">
        <c:forEach var="item" items="${listDemoEntity}">

            <div class="col-lg-4">
            ${item.productName}
            ${item.unitPrice}
            
            <img src="${item.urlImage}" style="width: 30%;
                 height: 20%; float:left" class="img-responsive center-block img-rounded"/>
        </div>

        </c:forEach>
    </div> -->

        <div class="container">
            <c:forEach var="item" items="${listDemoEntity}">
                <div class="col-md-4">
                    <img src="${item.urlImage}" style="width: 300px;
                         height: 200px" class="img-responsive center-block img-rounded"/>
                    <P></P>
                    <h4 style="text-align: center; color: red"><b>${item.productName}</b></h4>
                    <h4 style="text-align: center; color: gray">$:${item.unitPrice}</h5>
                </div>
            </c:forEach>
        </div>

        <%@include file="Footer.jsp"%>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
