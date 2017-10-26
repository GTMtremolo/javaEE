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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="../css/slider.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">

    </head>
    <body>
        <%@include file="Header.jsp"%>    
        <div class="container">
            
            <jsp:useBean id="pb" class="com.bean.ProductsBean" scope="request"/>
            <jsp:useBean id="urlb" class="com.bean.URLImageBean" scope="request"/>
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
                <c:forEach var="p" items="${pb.products}">

                    <div class="col-md-4">
                        <br/>
                        
                        <jsp:setProperty name="urlb" property="productID" value="${p.id}"/>
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
