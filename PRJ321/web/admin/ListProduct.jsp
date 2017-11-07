
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="../css/slider.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">
        <style>
            .checked{
                color: orange;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp"%>    
        <div class="container">

            <jsp:useBean id="pb" class="com.bean.ProductsBean" scope="request"/>
            <jsp:useBean id="urlb" class="com.bean.URLImageBean" scope="request"/>
            <jsp:useBean id="rb" class="com.bean.RateBean"/>
            <c:choose>
                <c:when test="${param.category!= null}">

                    <jsp:setProperty name="pb" property="category" param="category"/>
                    <c:remove scope="session" var="message"/>

                </c:when>
                <c:otherwise>
                    <jsp:setProperty name="pb" property="category" value="${sessionScope.categorySession}"/>

                </c:otherwise>
            </c:choose>

            <c:if test="${sessionScope.message!= null}">
                <div class="alert alert-danger">
                    <strong>${sessionScope.message}</strong> 
                </div>
            </c:if>



            <div class="row">
                <div class="col-sm-9">
                    <c:forEach var="p" items="${pb.products}">

                        <div class="col-md-4">
                            <br/>

                            <jsp:setProperty name="urlb" property="productID" value="${p.id}"/>
                            <jsp:setProperty name="rb" property="productId" value="${p.id}"/>

                            <c:choose>


                                <c:when test="${urlb.urlImages.size()!= 0}">
                                    <img src="../${urlb.urlImages.get(0).imageURL}" style="width: 300px;
                                         height: 200px" class="img-responsive center-block img-rounded"/>
                                </c:when>
                                <c:otherwise>
                                    <label  style="width: 300px; height: 200px; text-align: center; color: red" class="img-responsive center-block img-rounded">
                                        Image not found
                                    </label>
                                </c:otherwise>
                            </c:choose>
                            <P></P>
                            <h4 style="text-align: center; color: red"><b>${p.name}</b></h4>
                            <h4 style="text-align: center; color: gray">$:${p.unitPrice}</h5>
                                <div class="row" style="margin-left: 90px">
                                    <label for="star1" class="fa fa-star ${rb.rateScore>=1?"checked":""}"></label>
                                    <label for="star2" class="fa fa-star ${rb.rateScore>=2?"checked":""}"></label>
                                    <label for="star3" class="fa fa-star ${rb.rateScore>=3?"checked":""}"></label>
                                    <label for="star4" class="fa fa-star ${rb.rateScore>=4?"checked":""}"></label>
                                    <label for="star5" class="fa fa-star ${rb.rateScore>=5?"checked":""}"></label>
                                </div>
                                <div class="row">

                                    <div class="col-lg-6">
                                        <form method="post" action="../ProductController" class="col-md-1 col-md-offset-3">
                                            <input type="hidden" value="${p.id}" name="productID"/> 
                                            <input type="hidden" value="${param.category}" name="category"/> 

                                            <input type="submit"  class="btn-warning btn" value="Delete" name="btnDelProduct" id="del" style="display: none"/>
                                            <label for="del"><img src="../images/dele.png" title="delete" width="20px" for="del" /></label>
                                            
                                        </form>
                                    </div>
                                    <div class="col-lg-6">                                   
                                        <c:url value="Update.jsp" var="urlUpdate">
                                            <c:param name="productID" value="${p.id}"/>
                                        </c:url>
                                        <a href=${urlUpdate}><img src="../images/update.png" title="update" width="20px"/></a>  
                                    </div>


                                </div>



                        </div>


                    </c:forEach>
                </div>
                <c:forEach var="p" items="${pb.products}">

                    <div class="col-md-4">
                        <br/>

                        <jsp:setProperty name="urlb" property="productID" value="${p.id}"/>
                        <jsp:setProperty name="rb" property="productId" value="${p.id}"/>

                        <c:choose>


                            <c:when test="${urlb.urlImages.size()!= 0}">
                                <img src="../${urlb.urlImages.get(0).imageURL}" style="width: 300px;
                                     height: 200px" class="img-responsive center-block img-rounded"/>
                            </c:when>
                            <c:otherwise>
                                <label  style="width: 300px; height: 200px; text-align: center; color: red" class="img-responsive center-block img-rounded">
                                    Image not found
                                </label>
                            </c:otherwise>
                        </c:choose>
                        <P></P>
                        <h4 style="text-align: center; color: red"><b>${p.name}</b></h4>
                        <h4 style="text-align: center; color: gray">$:${p.unitPrice}</h5>
                            <div class="row" style="margin-left: 140px">
                                <label for="star1" class="fa fa-star ${rb.rateScore>=1?"checked":""}"></label>
                                <label for="star2" class="fa fa-star ${rb.rateScore>=2?"checked":""}"></label>
                                <label for="star3" class="fa fa-star ${rb.rateScore>=3?"checked":""}"></label>
                                <label for="star4" class="fa fa-star ${rb.rateScore>=4?"checked":""}"></label>
                                <label for="star5" class="fa fa-star ${rb.rateScore>=5?"checked":""}"></label>
                            </div>
                            <div class="row">


                                <form method="post" action="../ProductController" class="col-md-1 col-md-offset-3">
                                    <input type="hidden" value="${p.id}" name="productID"/> 
                                    <input type="hidden" value="${param.category}" name="category"/> 

                                    <input type="submit" class="btn-warning btn" value="Delete" name="btnDelProduct"/>
                                </form>
                                <c:url value="Update.jsp" var="urlUpdate">
                                    <c:param name="productID" value="${p.id}"/>
                                </c:url>
                                <a href=${urlUpdate}><button class="btn-success btn col-md-2 col-md-offset-2">Update</button></a>  
                            </div>



                    </div>


                </c:forEach>
            </div>
        </table
    </div>
    <%@include file="Footer.jsp"%>    


    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>


</body>
</html>
