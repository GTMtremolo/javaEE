<%-- 
    Document   : BOC
    Created on : Nov 3, 2017, 12:36:15 AM
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
        <title>CustomerInof</title>
    </head>
    <body>
        <jsp:useBean id="bb" class="com.bean.BillBean"/>
        <jsp:setProperty name="bb" param="acountID" property="acountID"/>
        <jsp:setProperty name="bb" property="page" value="${param.page}"/>
        <jsp:setProperty name="bb" property="pageSize" value="${param.pageSize}"/>
        <%@include file="Header.jsp" %>
        <div class="container">
            <table class="table table-bordered table-hover table-responsive bg-success">    
                <tr>
                    <th colspan="7" class="text-info text-center h3">List Bill of customer ${param.name}</th>

                </tr>
                <tr> <th colspan="7" class="text-info ">
                        Phone: <i>${param.phone}</i><br/>
                        Address: <i>${param.userAdress}</i>
                        <br/>
                        Email: <i>${param.userEmail}</i>

                    </th></tr>

                <tr>

                    <th>Bill ID</th>
                    <th style="width: 200px">Order Date</th>
                    <th style="width: 150px">State</th>
                    <th>Address</th>
                    <th>Payment</th>
                    <th>Note</th>
                    <th>Cart Detail</th>
                </tr>
                <c:forEach var="x" items="${bb.billByCustomerID}">
                    <tr>
                        <td>${x.orderId}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${x.orderDate}"/></td>
                        <td>${x.state}</td>
                        <td>${x.address}</td>
                        <td>${x.payment}</td>
                        <td>${x.note}</td>
                        <td>
                            <c:url var="url" value="COC.jsp">
                                <c:param value="${x.orderId}" name="orderId"/>
                            </c:url>
                            <a href="${url}" style="text-decoration: none" class="text-info">Detail</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>

            <div style="text-align: center">
                <c:forEach var="i" begin="1" end="${bb.totalPage}">
                    <c:url var="u" value="BOC.jsp">
                        <c:param name = "page" value="${i}"/>
                        <c:param name="pageSize" value="5"/>
                        <c:param name="acountID" value="${param.acountID}"/>
                        <c:param value="${param.name}" name="name"/>
                        <c:param value="${param.phone}" name="phone"/>
                        <c:param value="${param.userAdress}" name="userAdress"/>
                        <c:param value="${param.userEmail}" name="userEmail"/>


                    </c:url>
                    <a href="${u}"><button class="btn btn-info">${i}</button></a>

                </c:forEach>
            </div>
        </div>

        <%@include file="Footer.jsp" %>
    </body>
</html>
