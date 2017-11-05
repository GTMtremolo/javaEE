<%-- 
    Document   : CustomerInfor
    Created on : Nov 1, 2017, 10:04:02 AM
    Author     : DuDu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Infor</title>
    </head>
    <body>

        <jsp:useBean id="cb" class="com.bean.CustomerBean"/>
        <jsp:setProperty name="cb" value="${sessionScope.LoginUser.acountID}" property="accountID"/>
        <%@include file="Header.jsp"%>
        <div class="container" style="padding-top: 10px; margin-bottom: 10px" >
            <c:if test="${!empty cb.users}">
                <form action="ChangePassword.jsp" method="get">
                    <h3 class="h3">Information of customer ${cb.users.get(0).name}</h3>
                    <br/>
                    <table class="table table-hover table-responsive table-bordered">

                        <tr>
                            <td class="h4 text-success">Name</td>
                            <td>${cb.users.get(0).name}</td>
                        </tr>
                        <tr>
                            <td  class="h4 text-success">Email</td>
                            <td>${cb.users.get(0).email}</td>
                        </tr>
                        <tr>
                            <td  class="h4 text-success">Address</td>
                            <td >${cb.users.get(0).address}</td>
                        </tr>
                        <tr>
                            <td  class="h4 text-success">Phone Number</td>
                            <td>${cb.users.get(0).phone}</td>
                        </tr>

                    </table>
              
                            
                            <input type="hidden" value="${cb.users.get(0)}" name="user"/>
                    
                    <input type="submit" value="change Information" name="btnChange" class="btn-success btn"/>
                </form>
            </c:if>


        </div>
        <%@include file="Footer.jsp"%>
    </body>
</html>
