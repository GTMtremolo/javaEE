<%-- 
    Document   : Payment
    Created on : Oct 6, 2017, 3:16:15 AM
    Author     : snail
--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib prefix="j" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">
        <title>Payment</title>
    </head>
    <body>
        <%@include  file="Header.jsp" %>   
        <j:if test="${cart.hasProduct()}">
            <div class="well-lg container">
                <div  class="well-sm"><strong>Choose payment method</strong></div>
                <div class="container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#pay0">Cash on delivery</a></li>
                        <li><a data-toggle="tab" href="#pay1">Credit or debit card</a></li>
                        <li><a data-toggle="tab" href="#pay2">Local ATM card</a></li>
                        <li><a data-toggle="tab" href="#pay3">Kidney</a></li>
                    </ul>
                    <div class="tab-content">
                        <!--COD-->
                        <div id="pay0" class="tab-pane fade in active well">
                            <!--Info-->
                            <div class="container">
                                <p>You can pay in cash to our carrier when you receive the goods at your doorstep.</p>
                                <dl>
                                    <dt>Notice:</dt>
                                    <dd>- Remember to check your order information on the right since this information cannot be changed after we confirm your order.</dd>
                                    <dd>- Lazada.vn will not confirm your order via SMS so please check your order information in our notification email.</dd>
                                    <dd>- In order to protect our individual buyers, Lazada will limit the quantity of product per order. Also, we are sorry to reject those orders with many duplicated items (reseller threat).</dd>
                                    <dd>- Lazada does not provide door-to-door delivery service for apartment or office building.</dd>
                                </dl>     
                                <div class="text-warning" style="padding-right: 20px;">For all deliveries you will receive a personal invoice based on your account information when shopping at Lazada. To request a red invoice for taxation, please contact us within 7 days since purchase date. After this period, Lazada will not support to adjust from personal invoice to red invoice.</div>
                            </div>
                            <form action="OrderServlet" method="POST">
                                <!--Address-->
                                <div class="form-group" style="padding-top: 5px;">
                                    <label for="comment">Address: </label>
                                    <textarea class="form-control" rows="5" style=" height: 80px;" name="address" id="comment"></textarea>
                                </div>
                                <!--Order button-->                        
                                <button type="submit" class="btn btn-block btn-success">Order with CoD</button>
                                <input name="paymentMethod" value="COD" hidden/>
                            </form>
                        </div>
                        <!--CREDIT CARD-->
                        <div id="pay1" class="tab-pane fade well">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Card number</label>
                                    <div class="col-sm-2">
                                        <input class="form-control"type="text">
                                    </div>
                                    <label class="col-sm-2 control-label">Name on Card</label>
                                    <div class="col-sm-2">
                                        <input class="form-control"type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Expiry date</label>
                                    <div class="col-sm-1">
                                        <input class="form-control text-center"type="text" placeholder="MM">
                                    </div>
                                    <div class="col-sm-1">
                                        <input class="form-control text-center"type="text" placeholder="YY">
                                    </div>
                                    <label class="col-sm-2 control-label">CCV/CVV</label>
                                    <div class="col-sm-2">
                                        <input class="form-control text-center"type="text">
                                    </div>                                
                                </div>
                                <p class="text-warning">
                                    For all deliveries you will receive a personal invoice based on your account information when shopping at Lazada. To request a red invoice for taxation, please contact us within 7 days since purchase date. After this period, Lazada will not support to adjust from personal invoice to red invoice.
                                </p>
                            </form>
                        </div>
                        <!--ATM-->
                        <div id="pay2" class="tab-pane fade well">
                            <div class="form-group">
                                <label for="sel1">Select bank:</label>
                                <select class="form-control" id="sel1">
                                    <option>Bank #1</option>
                                    <option>Bank #2</option>
                                    <option>Bank #3</option>
                                    <option>Bank #4</option>
                                </select>
                            </div>
                            <p>You will be redirected to the 123Pay payment gateway to complete the payment.</p>
                            <p class="text-warning">For all deliveries you will receive a personal invoice based on your account information when shopping at Lazada. To request a red invoice for taxation, please contact us within 7 days since purchase date. After this period, Lazada will not support to adjust from personal invoice to red invoice.</p>
                        </div>
                        <!--KIDNEY-->
                        <div id="pay3" class="tab-pane fade well">
                            Just kidding! :")
                        </div>
                    </div>
                </div>
            </div>
        </j:if>

        <!--Show hint if cart has no product-->
        <j:if test="${!cart.hasProduct()}">            
            <div class="well-lg container">
                <div class="col-sm-12 text-left well-lg alert-warning"><a href="Home.jsp">No product in cart, click to shop for more!</a></div>                
            </div>
        </j:if>
        <%@include file="ChatLive.jsp"%>
        <%@include  file="Footer.jsp" %>
    </body>
</html>
