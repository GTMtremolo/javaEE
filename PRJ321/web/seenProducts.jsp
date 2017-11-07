<%-- 
    Document   : seenProducts
    Created on : Nov 3, 2017, 7:58:50 AM
    Author     : Xuan Truong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link type='text/css' rel='stylesheet' href='style.css'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seen Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-12">
                
            <c:forEach var="p" items="${spb.arrID}">
                
                <div class="col-md-2" style="padding-top: 15px;">
                    <c:url value="ProductDetails.jsp" var="urlDetail">
                        <c:param name="keyId" value="${p.intValue()}"/>
                    </c:url>
                    <a href="${urlDetail}" style="text-decoration: none">
                        <c:choose>
                            <c:when test="${urlb.urlImages.size()!= 0}">
                                        <img src="imgs/${p.intValue()}_0.png" style="width: 200px;
                                             height: 100px" class="img-responsive center-block img-rounded"/>
                                </c:when>
                                <c:otherwise>
                                    <h4 style="width: 300px;
                                        height: 200px ; text-align: center" ><b>Image Not Found</b></h4>
                                </c:otherwise>
                            </c:choose>
                    </a>
                </div>
                
            </c:forEach>
        </div>
            </div>
    </body>
</html>
