<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
    <link rel="stylesheet" href="/oatjang/styles/style.css"/>
   <link rel="stylesheet" href="/oatjang/styles/board.css" />
   <style>
      h2 {
         text-align: center;
         font-size: 32px;
      }

      .divMaster {
         margin: auto;
         width: 66vw;
         display: flex;
         flex-direction: row;
         flex-wrap: wrap;
      }

      .div1 {
         padding-top: 2rem;
         width: 20vw;
         margin-left: 10px;
         margin-right: 10px;
      }

      .div1 img {
         width: 100%;
         margin-right: auto;
         margin-left: auto;
      }

      .div2 {
         width: 100%;
         display: flex;
         margin-right: auto;
         margin-left: auto;
         flex-direction: column;
         border: 1px solid gray;
      }

      .div3 {
         width: 100%;
         display: flex;
         flex-direction: column;
         text-align: left;
         margin: 5px;
         padding: 5px;

      }

      .div3 a {
         color: black;
         margin-bottom: 5px;
      }

      .okBtn {
         margin-right: auto;
         margin-left: auto;
      }

      .menu_nav {

         display: flex;
         justify-content: space-between;
         flex-direction: row;
         margin: 15px;
      }

      .boardmain {
         font-weight: bold;
         font-size: 36px;
         color: black;
      }
      .imageBoxBox{
		height: 200px;
		background-size: cover;
		background-repeat: no-repeat;
      }
   </style>
</head>
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
    			location.href="/oatjang/board/boardInsert.jsp";
    		}else{
    			alert("로그인이 필요합니다.");
    			location.href="/oatjang/login/login.jsp";
    		}
    	}
</script>

<body>
<div class="navigation_bar"></div>

	<div class="btn_div">
		<a class="board_a" href="/oatjang/boardList.do?pg=1">DEALS</a>
		<input type="hidden" id="loginCheck" value="${loginComplete.userId }" />
		<input class="write_btn2" type="button" onclick="writeCheck()" value="글쓰기" />
	</div>
	<hr class="boardList_hr">


	<div class="divMaster">
   	<c:forEach items="${list }" var="ob">
      <div class="div1">
      		<c:if test="${ob.success ==2 }">
      		<div class="div2" onclick="#">
            <div class="imageBoxBox" style="background-image:url('images/${fn:split(ob.images,',')[0]}'); opacity:0.1;">
            </div>
            <div class="div3" onclick="#">
               <a href="">제목 : ${ob.title }</a>
               <a href="#">가격 : ${ob.price }</a>
               <a href="#">카테고리 :
               <c:if test="${ob.category ==0}">상의</c:if>
               <c:if test="${ob.category ==1}">하의</c:if>
               <c:if test="${ob.category ==2}">아우터</c:if>
               <c:if test="${ob.category ==3}">원피스</c:if>
               <c:if test="${ob.category ==4}">신발</c:if>
               <c:if test="${ob.category ==5}">악세사리</c:if></a>
            </div>
         </div>
      		</c:if>
      		<c:if test="${ob.success !=2 }">
      		<div class="div2" onclick="location.href='/oatjang/boardView.do?iid=${ob.iid}&pg=${pg }'">
            <div class="imageBoxBox" style="background-image:url('images/${fn:split(ob.images,',')[0]}');">
            </div>
            <div class="div3" onclick="/oatjang/boardView.do?iid=${ob.iid}&pg=${pg }">
               <a href="">제목 : ${ob.title }</a>
               <a href="/oatjang/boardView.do?iid=${ob.iid}&pg=${pg }">가격 : ${ob.price }</a>
               <a href="/oatjang/boardView.do?iid=${ob.iid}&pg=${pg }">카테고리 :
               <c:if test="${ob.category ==0}">상의</c:if>
               <c:if test="${ob.category ==1}">하의</c:if>
               <c:if test="${ob.category ==2}">아우터</c:if>
               <c:if test="${ob.category ==3}">원피스</c:if>
               <c:if test="${ob.category ==4}">신발</c:if>
               <c:if test="${ob.category ==5}">악세사리</c:if></a>
            </div>
         </div>
      		</c:if>

      </div>
	</c:forEach>

   </div>
   <br>
   <hr class="boardList_hr">
   <div class="boardList_pageNum"><c:if test="${empty paging}">${paging2.getPagingHTML()}</c:if>
	<c:if test="${!empty paging}">${paging.getPagingHTML()}</c:if></div>
</body>

</html>
