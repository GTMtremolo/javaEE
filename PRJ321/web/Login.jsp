<%-- 
    Document   : Login
    Created on : Oct 4, 2017, 3:00:51 PM
    Author     : daisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png">
        <title>Login</title>
    </head>
    <body>

        <%@include file="Header.jsp"%>

        <div class="container">
            <div class="row ">
                <div class="col-sm-4 background4">
                    <h4><b>Khách hàng mới</b></h4>
                    <hr style="border: 1px solid #999 " />
                    <p><b>Đăng ký tài khoản</b></p>
                    <p>Bằng cách tạo tài khoản bạn sẽ có thể mua sắm nhanh hơn, cập nhật tình trạng đơn hàng, theo giõi những đơn hàng đã đặt</p>
                    <a href="SignUp.jsp"><button type="button" class="btn btn-success">Đăng ký</button></a>
                </div>

                <div class="col-sm-4 background4">
                    <h4><b>Khách hàng cũ</b></h4>
                    <hr style="border: 1px solid #999"/>
                    <p><b>Tôi là khách hàng cũ</b></p>
                    <form>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label>Mật Khẩu</label>
                            <input type="password" class="form-control" placeholder="Password">
                        </div>

                        <button type="submit" class="btn btn-primary">Đăng Nhập</button>
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
