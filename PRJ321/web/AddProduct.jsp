<%-- 
    Document   : AddProduct
    Created on : Oct 7, 2017, 1:38:35 AM
    Author     : snail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/logo.png">
        <title>Add product</title>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        <div class="container well-lg">
            <form class="form-horizontal">
                <!--NAME AND DETAILS-->
                <div class="container col-sm-12">
                    <!--Product name-->
                    <div class="form-group">
                        <label for="name">Product name</label>
                        <input class="form-control"type="text" id="name">
                    </div>
                    <!--Product descriptions-->
                    <div class="form-group">
                        <label for="details">Details</label>
                        <textarea class="form-control" rows="5" id="details"></textarea>
                    </div>
                </div>
                <!--PRICE, QUANTITY AND CATEGORY-->
                <div class="form-group">
                    <!--Price-->
                    <div class="container col-sm-4">
                        <label for="price">Price</label>
                        <input class="form-control"type="number" id="price">
                    </div>
                    <!--Quantity-->
                    <div class="container col-sm-4">
                        <label for="quantity">Quantity</label>
                        <input class="form-control"type="number" id="quantity">
                    </div>
                    <!--Select category-->
                    <div class="container col-sm-4">
                        <label for="category">Category</label>
                        <select class="form-control" id="category">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                        </select>
                    </div>
                </div>
                <!--SELECT AVATAR AND IMAGES-->
                <!--Choose avatar button & file path label-->
                <label for="selectAva">Product avatar</label>
                <div class="input-group" id="selectAva">
                    <span class="input-group-btn">
                        <button class="btn btn-info">Browse</button>
                    </span>
                    <input type="text" class="form-control" placeholder="Pick an image" disabled>
                </div>
                <br>
                <!--Choose detail images button & file path label-->
                <label for="selectAva">Product detail images</label>
                <div class="input-group" id="selectAva">
                    <span class="input-group-btn">
                        <button class="btn btn-info">Browse</button>
                    </span>
                    <input type="text" class="form-control" placeholder="Pick images" disabled>
                </div>
                <!--CLEAR AND ADD PRODUCT BUTTONS-->
                <br>
                <div class="row">
                    <!--Clear all button-->
                    <div class="col-sm-6 text-left">
                        <a href="#" class="btn btn-block btn-warning">Clear all</a>
                    </div>
                    <!--Add product button-->
                    <div class="col-sm-6 text-right">   
                        <a href="#" class="btn btn-block btn-success">Add product</a>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="Footer.jsp"%>
    </body>
</html>
