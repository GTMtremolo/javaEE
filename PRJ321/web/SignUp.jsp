<%-- 
    Document   : SignUp.jsp
    Created on : Oct 5, 2017, 3:57:10 PM
    Author     : daisy
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">
        <title>Đăng ký</title>
    </head>
    <body>

        <%@include file="Header.jsp"%>

        <div class="container">

            <c:if test="${message != null}">
                <div class="alert alert-danger">
                    ${message}

                </div>
            </c:if>
            <div class="row ">
                <div class="col-sm-9">
                    <h1>Đăng ký tài khoản</h1>
                    <p>Nếu bạn đã có tài khoản vui lòng đăng nhập tại <a href="Login.jsp" style="text-decoration: none">đây</a></p>
                    <h3>Thông tin cá nhân</h3>
                    <hr />
                    <form class="form-horizontal" action="CustomerController" method="post">

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="lastName">* Họ và tên </label>
                            <div class="col-sm-10"> 
                                <input type="text" class="form-control" id="lastName" name ="txtName" placeholder="Họ và tên đệm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" name="txtEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="phone">Điện Thoại:</label>
                            <div class="col-sm-10">
                                <input type="txt" class="form-control" id="phone" name="txtPhone" placeholder="Số điện thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="phone">Địa chỉ:</label>
                            <div class="col-sm-10">
                                <input type="txt" class="form-control" id="phone" name="txtAddress" placeholder="Đia chỉ">
                            </div>
                        </div>
                        <br />

                        <h3>Mật khẩu</h3>
                        <hr />


                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">*Mật khẩu:</label>
                            <div class="col-sm-10"> 
                                <input type="password" class="form-control" id="pwd" name="txtPwd" placeholder="Mật khẩu" value="">
                            </div>
                        </div> 

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="rePwd">* Nhập lại mật khẩu:</label>
                            <div class="col-sm-10"> 
                                <input type="password" value="" class="form-control" id="rePwd" name="txtRePwd" placeholder="Nhập lại mật khẩu">
                            </div>
                        </div>


                        <div class="form-group"> 
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox" name="txtConfim" value="confirm"> Tôi đã đọc và đồng ý với<a href="#"> điều khoản Chính sách bảo mật</a></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-success" name="btnSignUp" value="Đăng ký"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-3 ">
                    <table class="table">
                        <thead><th>Tài Khoản</th></thead>
                        <tr><td><a href="#" style="text-decoration: none">Đăng nhập</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Đăng ký</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Quên mật khẩu</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Tài khoản của tôi</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Danh sách địa chỉ</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Giỏ hàng</a></td></tr>
                        <tr><td><a href="#" style="text-decoration: none">Lịch sử đơn hàng</a></td></tr>


                    </table>
                </div>
            </div>

        </div>

        <%@include file="Footer.jsp"%>


        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
