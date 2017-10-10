<%-- 
    Document   : index.jsp
    Created on : Sep 28, 2017, 7:06:24 PM
    Author     : daisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <title>Header</title>
    </head>
    <body>
        <div class="container" style="padding-top: 10px; margin-bottom: 10px" >
            <div class="row " >
                <div class="col-sm-4">
                    <h3>Fanpage:</h3>
                    <div class="fb-page" data-href="https://www.facebook.com/Web-b%C3%A1n-game-v%C3%A0-ph%E1%BB%A5-ki%E1%BB%87n-1742631946038822/" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/Web-b%C3%A1n-game-v%C3%A0-ph%E1%BB%A5-ki%E1%BB%87n-1742631946038822/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/Web-b%C3%A1n-game-v%C3%A0-ph%E1%BB%A5-ki%E1%BB%87n-1742631946038822/">Web bán game và phụ kiện</a></blockquote></div> 
                </div>

                <div class="col-sm-4">      
                    <h3>Thông tin liên hệ: </h3>
                    <p><b>Địa chỉ:</b> Phòng Đai học FPT , Tân Xã Thạch Hòa Thạch Thất Hà Nội</p>
                    <p>SĐT: 0987654321</p>
                    <p>---------------</p>             
                    <!--Regist for emails-->
                    <p><b>Subscribe for news:</b></p>
                    <form action="SubEmailServlet" method="POST">
                        <div class="input-group" id="selectAva">
                            <span class="input-group-btn">
                                <button class="btn btn-info">Subscribe</button>
                            </span>
                            <input type="text" name="txtSubemail" class="form-control" placeholder="Enter your email">
                        </div>
                    </form>
                    <p>---------------</p>     
                    <p><b>SĐT tư vấn mua hàng: </b>0987654321</p> 
                </div>

                <div class="col-sm-4 pull-right"  >
                    <br/>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4814943885453!2d105.524278214225!3d21.01341178600666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2zRlBUIFVuaXZlcnNpdHkgSMOyYSBM4bqhYw!5e0!3m2!1sen!2s!4v1507263433844"  height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>  
            </div>


        </div>

        <div class="row" style="margin-top: 10px; color: white; background-color: #3B3738; text-align: center">
            <div class="col-sm-12" style="padding: 10px"><h3>Copyright © 2017 · PRJ321 PROJECT</h3></div>
        </div>

        <!--facebook sdk--> 
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10&appId=1774295316197245";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
