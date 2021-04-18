<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OatJang - 메인 페이지</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href="/oatjang/styles/style.css">
    <link rel="stylesheet" href="/oatjang/styles/home.css">
</head>
<body class="container">
    <script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
    <div class="navigation_bar"></div>
    <div class="canvas">
        <div id="renderCanvas"></div>
        <div class="description">
            <span id="name">OATJANG</span>
            <span id="describe"> 우리들의 패.잘.알 커뮤니티</span>
        </div>
    </div>


    <div class="menu">
        <div class="menu_item" id="community" onclick="location.href='commuList.do?pg=1'">Community</div>
        <div class="menu_item" id="maps" onclick="location.href='map.do'">Maps</div>
        <div class="menu_item" id="deals" onclick="location.href='boardList.do?pg=1'">Deals</div>
    </div>

    <script type="module" src="/oatjang/lib/app.js"></script>
</body>

</html>
