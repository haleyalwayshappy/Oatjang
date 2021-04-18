<%@page import="com.commu.dto.CommuDTO"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/oatjang/styles/board.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js">
	
</script>
<script>
$().ready(function() {$('.navigation_bar').load("/oatjang/login/loginMenu.jsp",
					function(response, status, xhr) {
						if (status == "error") {
							var msg = "Sorry but there was an error: ";
					}
	});
});
</script>
</head>
<body>
<%
	int pg = (Integer)request.getAttribute("pg");
	int iid = (Integer)request.getAttribute("iid");
	CommuDTO dto = (CommuDTO)request.getAttribute("dto");
%>

   <div class="navigation_bar"></div>
<form action="/oatjang/commuUpdate.do?pg=<%=pg %>&iid=<%=iid %>" method="post">
	<input type="hidden" name="userid" value="${dto.userid }"/>	<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
	<div class="textbox">
	
		<div class="div_title">
               <input class="box title" type="text" name="title" value="${dto.title }" placeholder="제목을 입력하세요." />
               <br>
	</div>
            <!-- 설명칸  -->
            <div class="div_intext">
               <textarea class="textinput bw" name="description" placeholder="내용을 입력하세요.">${dto.description }</textarea>
            </div>
			<div class="btn">
                  <div id="rightbtn">
                     <input class="go_btn masterBtn" type="button" onclick="location.href='/oatjang/commuView.do?pg=${pg}&iid=${iid }'" value="이전으로"/>
                  </div>
                  <div>
                     <input class="back_btn masterBtn" type="submit" value="수정하기" />
                  </div>
            </div>
</form>
</body>
</html>