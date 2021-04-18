<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
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
	<%
		LoginDTO dto = (LoginDTO) request.getAttribute("entity");
	%>
	<div class="align">
		<div class="login_image">
			<div class="login_container">
				<div class="grid">
				<form  class="form login" action="/oatjang/login/login.jsp">
					<div class="loginfail_from">
						<h3>로그인 정보</h3>
						<hr>
 						<br><p style="font-size: 20px;">비밀번호는 <%=dto.getPw()%> 입니다<br></p> 
					</div>
					
					 <div class="form__field">
							<input type="submit" value="login page">
						</div>
					<div class="register_password">
					<p class="text--center" id="find_id">
							<a href="/oatjang/login/findId.jsp">아이디</a>/<a href="/oatjang/login/findPw.jsp">비밀번호</a>를 잊으셨나요?
						</p>
						<p class="text--center" id="register_id">
							<a href="/oatjang/login/register.jsp">회원가입</a>
						</p>
					</div>
				
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














<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>

<%@ include file="loginMenu.jsp" %>

<%
	LoginDTO dto = (LoginDTO)request.getAttribute("entity");
	
%>
 <p>비밀번호는 <%=dto.getPw()%> 입니다</p> 
 <a href="/oatjang/login/login.jsp">로그인 하기</a> 
</body>
</html> --%>


<%-- <%
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");

	if (dto != null) {
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getPhone());
		System.out.println(dto.getAddr());
		
	}
	
	int passLength = dto.getPw().length();
	System.out.println("passLength : "+passLength);
	String passTemp = "";
	for(int i=0; i<passLength; i++){
		passTemp += "*";
	}
	System.out.println("passTemp : "+passTemp);
%>

<p><%=dto.getNickname()%>님의 회원정보</p>
<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=dto.getPw()%></td> --%>