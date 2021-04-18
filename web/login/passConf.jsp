<!-- 
로그인 후, 마이페이지에서 회원수정을 누를때, 비밀번호를 확인하는 페이지.
 -->

<%@page import="com.login.dto.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title> 
<%
		request.setCharacterEncoding("UTF-8");
		LoginDTO dto = (LoginDTO) session.getAttribute("loginComplete");
		AddressDTO addr_dto = (AddressDTO)request.getAttribute("addressEntity");
		
		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String addrDetail = request.getParameter("addrDetail");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));

%>
<link rel="stylesheet" href="/oatjang/styles/login.css" />
<link rel="stylesheet" href="/oatjang/styles/style.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="container">
	<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "/oatjang/login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
<div class="navigation_bar"></div>
<div class="align">
	<div class="login_image">
		<div class="login_container">
			<div class="grid">
				<form action="/oatjang/mypageUpdate.do" method="POST" class="form login">
					<div class="form__field">
						<label for="login__username">
							<svg class="icon">
								<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user">
								</use>
							</svg>
						</label>
						 <input id="login__username" type="text" name="id" class="form__input" placeholder="<%=dto.getId()%> " value="<%=dto.getId()%>"
                                required readonly> 
					</div>
					<div class="form__field">
						<label for="login__password">
							<svg class="icon">
								<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock">
								</use>
							</svg>
						</label>
						<input id="login__password" type="password" name="pwd" class="form__input" placeholder="Password"
                               	 required>
             		</div>
           	 	 <div class="form__field">
           	 	 
             		<input type="submit" value="Sign In">
            	 </div>
            	 
          	 	<input type="hidden" name="id" value="<%=dto.getId()%>">
				<input type="hidden" name="pw" value="<%=dto.getPw()%>">
				<input type="hidden" name="nickname" value="<%=dto.getNickname()%>">
				<input type="hidden" name="name" value="<%=dto.getName()%>">
				<input type="hidden" name="age" value="<%=dto.getAge()%>">
				<input type="hidden" name="phone" value="<%=dto.getPhone()%>">
				<input type="hidden" name="addr" value="<%=dto.getAddrId()%>"> 
        	</form>  	 
		</div>
	</div>
</div>
<svg xmlns="http://www.w3.org/2000/svg" class="icons">
            <symbol id="arrow-right" viewBox="0 0 1792 1792">
                <path
                    d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z" />
            </symbol>
            <symbol id="lock" viewBox="0 0 1792 1792">
                <path
                    d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z" />
            </symbol>
            <symbol id="user" viewBox="0 0 1792 1792">
                <path
                    d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z" />
            </symbol>
        </svg>
</div>
</body>
</html>