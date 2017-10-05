<%-- 
    Document   : Payment
    Created on : Oct 5, 2017, 8:56:36 PM
    Author     : snail
--%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="Header.jsp"%>
        <%--USER INFO--%>
        <div class="alert alert-danger">
            <strong>User information: N/A</strong>
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
                            <td class="text-center" style="vertical-align: middle">${loop.index}</td>
                            <td style="vertical-align: middle">
                                <div>   
                                    <div class="col-md-2" style="vertical-align: middle">
                                        <img src="images/items/${loop.index}_ava.jpg" class="img-rounded top-left" alt="item_1" width="204" height="120">                                   
                                    </div>
                                    <div class="col-md-10">
                                        <strong>Name: Some name!</strong>
                                        <p>Description: Something like "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit
                                            augue duis dolore te feugait nulla facilisi."</p>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center" style="vertical-align: middle">$${(loop.index+1)*100}</td>
                            <td class="text-center" style="vertical-align: middle">${loop.index+1}</td>
                            <td class="text-right" style="vertical-align: middle">$${(loop.index+1)*100*(loop.index+1)}</td>
                        </tr>
                        <jstl:set var="total" value="${total + (loop.index+1)*100*(loop.index+1)}"/>
                    </jstl:forEach>
                </tbody>
            </table>
        </div>
        <div class="alert alert-success clearfix">
            <strong>Total: $${total}</strong>
            <button type="button" class="btn btn-success pull-right">Next step</button>      
        </div>
        <%@include  file="Footer.jsp" %>
    </body>
</html>
