<%-- 
    Document   : Header
    Created on : Oct 3, 2017, 4:11:21 PM
    Author     : daisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="images/logo.png">
    </head>
    <body>
        <img src="images/banner.png"  style="width: 100% ;"/>
        <nav class="navbar navbar-inverse navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Shop Game</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Trang chủ</a></li>
                        <li><a href="#">Sale</a></li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Game bản quyền<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Adventure</a></li>
                                <li><a href="#">Early Access</a></li>
                                <li><a href="#">RGP</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Wallet</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Hướng dẫn<span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                <li><a href="#">Giới Thiệu Divine Shop</a></li>
                                <li><a href="#">Giới thiệu Steam</a></li>
                                <li><a href="#">Hướng dẫn mua game</a></li>
                                <li ><a href="#">Hướng Dẫn nhận code game trên Steam</a></li>
                            </ul>
                        </li>
                        <li><a href="#">liên hệ</a></li>
                        <li><a href="#">Giỏ hàng</a></li>
                        <li><a href="#">Thanh toán</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                        <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span>  Đăng nhập</a></li>
                    </ul>
                </div>
            </div>
        </nav>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
