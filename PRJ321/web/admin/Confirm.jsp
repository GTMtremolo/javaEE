<%-- 
    Document   : Confirm.jsp
    Created on : Nov 3, 2017, 8:41:53 AM
    Author     : giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href="../images/logo.png">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <title>Confirm</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <jsp:useBean id="bb" class="com.bean.BillBean"/>
        <jsp:setProperty name="bb" param="acountID" property="acountID"/>
        <jsp:useBean id="cb" class="com.bean.CustomerBean"/>
        
        
        <div class="container">
            
            <c:if test="${!empty param.btnConfirm}">
                <jsp:setProperty name="bb" param="billId" property="billId"/>
                <p style="display: none">${bb.confirm}</p>
            </c:if>
             <table class="table table-bordered table-hover table-responsive bg-success">    
                
                <tr>

                    <th>Bill ID</th>
                    <th style="width: 200px">Order Date</th>
                    <th style="width: 150px">Customer Name</th>
                    <th>Address Order</th>
                    <th>Payment</th>
                    <th>Note</th>
                    <th>Confirm</th>
                </tr>
                <c:forEach var="x" items="${bb.billByCustomerState}">
                    <tr>
                        <form action="Confirm.jsp" method="get" onsubmit="return confirm('do you wanna confirm the bill')">
                        <jsp:setProperty name="cb" value="${x.accountId}" property="accountID"/>
                        <td>
                            <c:url value="COC.jsp" var="u">
                                <c:param value="${x.orderId}" name="orderId"/>
                            </c:url>
                            <a href="${u}" style="text-decoration: none">${x.orderId}</a></td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${x.orderDate}"/></td>
                        <td>${cb.users.get(0).name}</td>
                        <td>${x.address}</td>
                        <td>${x.payment}</td>
                        <td>${x.note}</td>
                        <td>
                            <input type="submit" value="Confirmed" name="btnConfirm" class="btn btn-danger" />
                            <input type="hidden" class="btn btn-danger" name="billId" value="${x.orderId}" />
                        </td>
                        </form>
                    </tr>

                </c:forEach>
            </table>
            
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
