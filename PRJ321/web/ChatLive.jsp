<%-- 
    Document   : ChatLive
    Created on : Oct 16, 2017, 9:46:24 PM
    Author     : giangtm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/slider.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.5";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
            function toggleLiveChat() {
                document.getElementById("liveChatBox").style.display = "block";
                document.getElementById("toggleChatBtn").style.display = "none";
            }
        </script>

        <div id="liveChatBox" style="position:fixed; z-index:9999999; right:10px; bottom:10px;" class="fb-page" data-tabs="messages" hidden
             data-href="https://www.facebook.com/Web-b%C3%A1n-game-v%C3%A0-ph%E1%BB%A5-ki%E1%BB%87n-1742631946038822/" data-width="250" data-height="300" 
             data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"></div>
        <button type="button" id="toggleChatBtn" style=" border: none; background: none; box-shadow: none; position:fixed; z-index:9999999; right:10px; bottom:10px;" onclick="toggleLiveChat()">
            <span class="glyphicon glyphicon-comment" style="font-size: 250%; padding: 0px; color: #101010;"></span>
        </button>
    </body>
</html>
