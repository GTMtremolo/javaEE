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
                   <div class="fb-page" data-href="https://www.facebook.com/L&#x1ead;p-Tr&#xec;nh-Nh&#xfa;ng-143638259511428/" data-width="300" data-height="250" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/L&#x1ead;p-Tr&#xec;nh-Nh&#xfa;ng-143638259511428/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/L&#x1ead;p-Tr&#xec;nh-Nh&#xfa;ng-143638259511428/">Lập Trình Nhúng</a></blockquote></div>
               </div>
                  
                <div class="col-sm-4">
                    <h3>Thông tin liên hệ: </h3>
                    <p><b>Địa chỉ:</b> Phòng Đai học FPT , Tân Xã Thạch Hòa Thạch Thất Hà Nội</p>
                    <p>SĐT: 0987654321</p>
                    <p>---------------</p>
                    <p><b>SĐT tư vấn mua hàng:</b>0987654321</p>
                </div>
                
                <div class="col-sm-4 pull-right"  >
                    <br/>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.979456257939!2d105.85019721435859!3d21.03350799299337!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abbf7fb1baed%3A0x90c05e1ee6bbec6e!2zQsO6biBuZ2FuIE5ow6Bu!5e0!3m2!1sen!2s!4v1507018834361"  height="250"  frameborder="0" style="border:0" allowfullscreen ></iframe>

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
