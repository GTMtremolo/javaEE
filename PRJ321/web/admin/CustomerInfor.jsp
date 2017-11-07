<%-- 
    Document   : CustomerInfor.jsp
    Created on : Nov 2, 2017, 11:38:55 PM
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
        <jsp:useBean id="cb" class="com.bean.CustomerBean"/>
        <jsp:setProperty name="cb" property="page" value="${param.page}"/>
        <jsp:setProperty name="cb" property="pageSize" value="${param.pageSize}"/>
        <%@include file="Header.jsp" %>
        <div class="container">

            <table class="table table-bordered table-hover table-responsive bg-success">
                <tr>
                    <td colspan="6" class="text-center h3 text-danger" >Information of all customer</td>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Detail Bill</th>
                </tr>
                <c:forEach var="x" items="${cb.allCustomers}">
                    <tr>
                        <td>${x.acountID}</td>
                        <td>${x.name}</td>
                        <td>${x.email}</td>
                        <td>${x.address}</td>
                        <td>${x.phone}</td>
                        <td>
                            <c:url var="url" value="BOC.jsp">
                                <c:param value="${x.acountID}" name="acountID"/>
                                <c:param value="${x.name}" name="name"/>
                                <c:param value="${x.phone}" name="phone"/>
                                <c:param value="${x.address}" name="userAdress"/>
                                <c:param value="${x.email}" name="userEmail"/>
                            </c:url>
                            <a href="${url}" style="text-decoration: none" class="text-info">Bill of Customer</a>
                        </td>

                    </tr>
                </c:forEach>
            </table>
            
            <div style="text-align: center">
                <c:forEach var="i" begin="1" end="${cb.totalPage}">
                    <c:url var="u" value="CustomerInfor.jsp">
                        <c:param name = "page" value="${i}"/>
                        <c:param name="pageSize" value="2"/>
                    
                    </c:url>
                    <a href="${u}"><button class="btn btn-info">${i}</button></a>

                </c:forEach>
            </div>

        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
