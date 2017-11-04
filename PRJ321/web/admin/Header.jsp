<%-- 
    Document   : Header
    Created on : Oct 3, 2017, 4:11:21 PM
    Author     : daisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="../images/logo.png">
    </head>
    <body>

        <jsp:useBean id="categoryBean" class="com.bean.CategoryBean" scope="request"/>
        <img src="../images/banner.png"  style="width: 100% ;"/>
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
                        <li class="active"><a href="../Home.jsp">Trang chủ</a></li>
                        <li><a href="#">Sale</a></li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Game bản quyền<span class="caret"></span></a>
                            <ul class="dropdown-menu">


                                <c:forEach var="p" items="${categoryBean.categories}">
                                    <c:url var="u" value="ListProduct.jsp">
                                        <c:param name="category" value="${p.id}"/>
                                    </c:url>
                                    <li><a href="${u}">${p.name}</a></li>

                                </c:forEach>
                            </ul>
                        </li>
                        <li><a href="AddProduct.jsp">Add game</a></li>
                        <li><a href="CustomerInfor.jsp">Customer Infor</a></li>
                        <li><a href="SpamEmail.jsp">Send Email</a></li>
                        <li><a href="Confirm.jsp">Confirm Order</a></li>
                        
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        
                            
                        <c:choose>
                            <c:when test="${sessionScope.LoginUser!= null}">
                                <li><a href="index.jsp"><span  class="glyphicon glyphicon-user" >   ${sessionScope.LoginUser.name}</span></a></li>
                                 <li><a href="/PRJ321/LogoutController"><span class="glyphicon glyphicon-log-out" >   Logout</span></a></li>
                            </c:when>
                            
                            <c:otherwise>
                                <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span>  Đăng nhập</a></li> 
                                 <li><a href="SignUp.jsp"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                            </c:otherwise>
                        </c:choose>
                        
                      
                    </ul>
                </div>
            </div>
        </nav>


        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>

    </body>
</html>
