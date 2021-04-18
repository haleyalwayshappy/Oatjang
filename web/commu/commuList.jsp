<%@page import="com.board.dto.BoardPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/oatjang/styles/board.css"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
		function writeCheck(){
				if($("#loginCheck").val()){
						location.href="/oatjang/commu/commuInsert.jsp";
				}else{
						alert("로그인이 필요합니다.");
						location.href="/oatjang/login/login.jsp";
				}
		}
		</script>
    <div class="navigation_bar"></div>
	<input type="hidden" id="loginCheck" value="${loginComplete.userId }"/>

	<div class="btn_div">
		<a href="/oatjang/commuList.do?pg=1" class="board_a">COMMUNITY</a>
		<input type="button" onclick="writeCheck()" class="write_btn2" value="글 작성" />
	</div>
	<hr class="boardList_hr">


	<div class="board_list_wrap"> <!-- 전체영역 -->
	<table class="board">
		<thead class="board menu">
			<td width="10%" class=td_head>번호</td>
			<td width="40%">제목</td>
			<td width="20%">이름</td>
			<td width="20%">작성날짜</td>
			<td width="10%">조회수</td>

		</thead>
		<c:forEach items="${list }" var="ob">
			<tbody  onclick="location.href='/oatjang/commuView.do?iid=${ob.iid}&pg=${pg }'" class="board_text" id="board_text_id">
				<td class="td_class" >${ob.iid}</td>
				<td id="td_title">${ob.title }&nbsp;<c:if test="${ob.reply!=0 }"><font color="red">(${ob.reply })</font></c:if></td>
				<td>${ob.nickname }</td>
				<td>${ob.logtime }</td>
				<td>${ob.hit }</td>
				 <tr height="1" bgcolor="#808080"><td colspan="5"></td></tr>
			</tbody>
		</c:forEach>
		<td colspan="5" align="center" class="td_a">
		<c:if test="${empty paging}">${paging2.getPagingHTML()}</c:if>
		<c:if test="${!empty paging}">${paging.getPagingHTML()}</c:if>
		</td>
	</table>
	</div>
</body>
</body>
</html>
