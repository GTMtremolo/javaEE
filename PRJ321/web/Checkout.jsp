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
            <jstl:set var="total" value="0"/>
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
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
                        <jstl:forEach begin="0" end="5" varStatus="loop">
                            <tr>
                                <td class="text-center" style="vertical-align: middle">${loop.index+1}</td>
                                <td style="vertical-align: middle">
                                    <div class="media">
                                        <div class="media-left">
                                            <img src="images/items/${loop.index}_ava.jpg" class="img-rounded top-left" alt="item_1" width="204" height="120">                                   
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">Some cool name</h4>
                                            <p>Something like "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat."</p>
                                        </div>
                                    </div>
                                <td class="text-center" style="vertical-align: middle"><fmt:formatNumber type="currency" value="${(loop.index+1)*100}"/></td>
                                <td class="text-center" style="vertical-align: middle"><input type="number" class="form-control" value="${loop.index+1}"></td>
                                <td class="text-right" style="vertical-align: middle"><fmt:formatNumber type="currency" value="${(loop.index+1)*100*(loop.index+1)}"/></td>
                            </tr>
                            <jstl:set var="total" value="${total + (loop.index+1)*100*(loop.index+1)}"/>
                        </jstl:forEach>
                        <tr class="success">
                            <td><strong>Total</strong></td> 
                            <td class ="text-right" colspan="4"><strong><fmt:formatNumber type="currency" value="${total}"/></strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left">
                    <a href="#" class="btn btn-block btn-info">Shop for more!</a>
                </div>
                <div class="col-sm-6 text-right">   
                    <a href="Payment.jsp" class="btn btn-block btn-success">Continue</a>
                </div>
            </div>
        </div>
        <%@include  file="Footer.jsp" %>
    </body>
</html>
