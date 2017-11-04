<%-- 
    Document   : COC
    Created on : Nov 3, 2017, 1:09:24 AM
    Author     : giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="../images/logo.png">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <title>CustomerInof</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container">
            <jsp:useBean id="cib" class="com.bean.CartItemBean" />
            <jsp:useBean id="pb" class="com.bean.ProductsBean" />
            <jsp:useBean id="imgb" class="com.bean.URLImageBean" />
            <jsp:setProperty name="cib" param="orderId" property="billId"/>
            <table class="table   table-condensed ">
                <tr>
                    <th colspan="7" class="text-info text-center h3">Detail of bill id ${param.orderId}</th>
                </tr>
                <tr>

                    <th width="100px">Cart ID</th>

                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>

                </tr>
                <c:set value="${0}" var="total"/>
                <c:forEach var="x" items="${cib.cartItems}">
                    <jsp:setProperty name="pb" value="${x.productId}" property="productID"/>
                    <jsp:setProperty name="imgb" value="${x.productId}" property="productID"/>

                    <tr>
                        <td><h5 class="text-info">${x.cartId}<h5></td>
                        <td class="text-info " width="300px">
                            <c:url value="../ProductDetails.jsp" var="u">
                                <c:param name="keyId" value="${x.productId}"/>

                            </c:url>
                            <a href="${u}" style="text-decoration: none">
                                <div class="row">
                                    <c:if test="${!empty imgb.urlImages}">
                                        <img src="../${imgb.urlImages.get(0).imageURL}" style="" width="204" height="120    " class="img-responsive top-left img-rounded"/>
                                    </c:if>
                                </div>

                                <h4 >${pb.product.name}</h4>
                            </a>

                        </td>
                        <td>${x.quantity}</td>
                        <td>${x.quantity *pb.product.unitPrice}</td>
                        <c:set value="${(x.quantity *pb.product.unitPrice) + total}" var="total"/>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" class="h4 text-info text-right">Total: ${total} $</td>
                </tr>
            </table>

        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
