<%-- 
    Document   : ChangePassword
    Created on : Nov 2, 2017, 3:46:24 PM
    Author     : DuDu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="cb" class="com.bean.CustomerBean"/>

        <jsp:setProperty name="cb" value="${sessionScope.LoginUser.acountID}" property="accountID"/>
        <jsp:setProperty name="cb" value="${param.txtName}" property="name" />
        <jsp:setProperty name="cb" value="${param.txtAddress}" property="adderss" />
        <jsp:setProperty name="cb" value="${param.txtEmail}" property="email" />
        <jsp:setProperty name="cb" value="${param.txtPhone}" property="phone" />
        <jsp:setProperty name="cb" value="${param.txtNewPassword}" property="pwd" />
        

        <t:if test="${!empty param.btnChangePass}">

            <t:if test="${param.txtCurrentPassword eq sessionScope.LoginUser.pwd}">

                ${cb.changePassword}
                <t:set var="LoginError" value="Information has been change, login again" scope="session"/>
                <t:remove var="LoginUser" scope="session"/>
                <%
                    if(request.getParameter("btnChangePass")!= null){
                        response.sendRedirect("Login.jsp");
                        return;
                    }
                    
                %>
            </t:if>
        </t:if>
        <t:if test="${!empty param.btnChangeInfo}">
            ${cb.changeInfo}
            <t:set var="LoginError" value="Information has been change, login again" scope="session"/>
            <t:remove var="LoginUser" scope="session"/>
            <%response.sendRedirect("Login.jsp");%>
        </t:if>


        <%@include file="Header.jsp"%>

        
        <div class="container">
            <t:if test="${!empty param.btnChangePass}">
            <t:choose>
                <t:when test="${param.txtCurrentPassword eq sessionScope.LoginUser.pwd}">

                   
                    <t:set var="LoginError" value="Information has been change, login again" scope="session"/>
                    <t:remove var="LoginUser" scope="session"/>
                    <%
                        if (request.getParameter("btnChangePass") != null) {
                            response.sendRedirect("Login.jsp");
                            return;
                        }

                    %>
                </t:when>
                <t:otherwise>
                    <div class="alert alert-danger">
                        <strong>Information error!!! input again</strong> 
                    </div>
                </t:otherwise>
            </t:choose>
             </t:if>
            <div class="row ">
                <div class="col-sm-9">

                    <h2>Change information</h2>
                    <hr />
                    <form class="form-horizontal" action="ChangePassword.jsp" method="get">

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="name">Name </label>
                            <div class="col-sm-10"> 
                                <input type="text" class="form-control" id="name" name ="txtName" value="${sessionScope.LoginUser.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" name="txtEmail" value="${sessionScope.LoginUser.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="phone">Phone number:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phone" name="txtPhone" value="${sessionScope.LoginUser.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="address">Address</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phone" name="txtAddress" value="${sessionScope.LoginUser.address}">
                            </div>
                        </div>

                        <div class="form-group"> 
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-success" name="btnChangeInfo" value="Save Change"/>
                            </div>
                        </div>
                        <br />
                        <h2>Change Password</h2>
                        <p>You should use a strong password that you have not used anywhere else</p>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="password">Current password </label>
                            <div class="col-sm-10"> 
                                <input type="password" class="form-control" id="password" name ="txtCurrentPassword" placeholder="Current password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="newPass">New password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="newPass" name="txtNewPassword" placeholder="New password" >

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="cfPass">Enter a new password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="cfPass" name="txtCfPassword" placeholder="Enter a new password">
                            </div>
                        </div>

                        <div class="form-group"> 
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-success" name="btnChangePass" value="Save Change"/>
                            </div>
                        </div>
                    </form>
                </div>

            </div>

        </div>


        <%@include file="Footer.jsp"%>
    </body>
</html>
