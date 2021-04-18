<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
:root {
            --background_size: 860px;
            --content_size: 800px;
        }
    
        * {
            margin: 0;
            padding: 0;
        }

        .ArticleContentBox {
            
            width: var(--background_size);
            padding: 30px 30px 30px 30px;
            border: 1px solid gray;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            margin: 0 auto;
        }

        .article_header {
            width: var(--content_size);
            padding: 0px 0px 20px;
            margin: 0px 0px 20px;
            border-bottom: 1px solid gray;
        }

        .ArticleTitle {
            width: var(--content_size);
            margin: 0px 0px 12px;
        }

        .title_area {
            width: var(--content_size);
            color: #000000;
            font: 26px "Apple SD Gothic Neo";
        }

        .WriterInfo {
            width: var(--content_size);
        }

        .profile_info {
            font: 13px "Apple SD Gothic Neo";
            margin: 0px 6px 0px 0px;
        }

        .article_info {
            color: #979797;
            font: 12px "Apple SD Gothic Neo";
            margin: 0px 8px 0px 0px;
        }

        .article_container {
            width: var(--content_size);
            font: 12px "Apple SD Gothic Neo";
            color: #000000;
        }

        .CommentBox {
            width: var(--background_size);
            padding: 30px 30px 30px 30px;
            border: 1px solid gray;
            border-top: 0px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            margin: 0 auto;
        }

        .comment_option {
            width: var(--content_size);
            margin: 0px 0px 11px;
            padding: 16px 0px 0px;
            padding-bottom: 5px;
            border-bottom: 1px solid gray;
        }

        .comment_title {
            width: 100px;
            height: 23px;
            color: #000000;
            font-family: bold;
            font: 20px "Apple SD Gothic Neo";
            margin: 3px 12px 0px 0px;
        }

        .comment_box {
            width: 800px;
            padding: 12px 23px 10px 0px;
        }

        .boardTag {
            text-decoration: none;
            background-color: #824820;
            padding: 10px 20px;
            font-size: 12px;
            color: #fff;
            border-radius: 5px;
            border: 0;
            font-family: bold;
        }
        
        .boardTag:hover{
			background:#fff;
		 	color:#000;
		}

        /*등록 버튼  */

        .reply_area {
            width: var(--content_size);
            display: flex;   
        }
        

        .reply_area textarea {
            border-radius: 5px;
            padding: 2px;
            border: 1px solid gray ;
            outline: none;
		
        }

        #reply_btn {
            width: 60px;
            height: inherit;    
			background-color: #824820;
			color: #fff;
            border-radius: 5px;
            border:none;
            outline: none;
        }
        
        #reply_btn:hover{
        	background:#fff;
		 	color:#000;
        }

        /* 답글 공간 */
        #commentListForm{
            width: var(--content_size);
        }

        .nickname_content h4 {
            margin-top: 10px;
        }
        .nickname_content .reply__content {
            margin-top: 4px;
        }

        .replyList,
        .re_replyList {
            border-bottom: 1px solid #ddd;
        }

        .replyList .replyButtonGroup {
            text-align: right;
        }
        .replyList .replyButtonGroup a {
            margin: 10px;
            text-decoration: none;
            color: #999;
        }
        .replyList .replyButtonGroup a:hover {
            color: #444;
        }
     
        .re_replyList .replyButtonGroup {
            text-align: right;
        }

        .re_replyList .nickname_content {
            margin-left: 40px;
        }
        .re_replyList .replyButtonGroup a {
            margin: 10px;
            text-decoration: none;
            color: #999;
        }
        .re_replyList .replyButtonGroup a:hover {
            color: #444;
        }
</style>
<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "login/loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
</script>
</head>
<body>
    <div class="navigation_bar"></div>
<div class="ArticleContentBox">
   <div class="article_header">
      <div class="ArticleTitle">
         <h3 class="title_area">
          <!-- 글 제목 -->
          ${dto.title }
         </h3>
      </div>
      <div clas="WriterInfo">
         <div class="profile_area">
            <div class="profile_info">
               <!-- 작성자 닉네임 -->
               ${nickname }
            </div>
            <div class="article_info">
               <!-- 작성일 + 조회수 -->
               ${dto.logtime } 조회 ${dto.hit }
            </div>
         </div>
      </div>
   </div>
   <div class="article_container">
      <!-- 사진 css 필요 -->
   	  <div class="article_fictures">
   	  	<c:forEach var="ob" items="${fn:split(dto.images,',')}">
   	  		<img src="/oatjang/images/${ob }" style="width:30vw;"/>
   	  	</c:forEach>
   	  </div>
      <!-- 내용 -->
      ${dto.description }
   </div>
</div>
<div class="CommentBox">
      <button onclick="location.href='/oatjang/commuList.do?pg=${pg }'" class="boardTag">목록</button>
   <c:if test="${loginComplete.userId == dto.userid}">
      <button onclick="location.href='/oatjang/commuModify.do?iid=${dto.iid }&pg=${pg }'" class="boardTag">수정</button>
      <button onclick="location.href='/oatjang/commuDelete.do?iid=${dto.iid }&pg=${pg }'" class="boardTag">삭제</button>
   </c:if>
   <div class="comment_option">
      <h3 class="comment_title">댓글&nbsp;<span id="cCnt"></span></h3>
   </div>
   <div class="CommentWriter">
      <form id="commentForm" name="commentForm" method="post">
        <div class="reply_area">
            <textarea style="width:740px;" rows="3" cols="30" id="comment" name="comment"
            placeholder="댓글을 입력하세요"></textarea>
            <input type="button" value="등록" id="reply_btn" onclick="fn_comment()">
        </div>
        <input type="hidden" name="ref" value="0"/>
        <input type="hidden" id="iid" name="iid" value="${dto.iid }" />
        <input type="hidden" name="reply" value="${dto.reply }" />
        <input type="hidden" id="userid" name="userid" value="${loginComplete.userId }"/>
        <input type="hidden" id="nickname" name="nickname" value="${loginComplete.nickname}" />
    </form>
</div>


<form id=commentListForm" name="commentListForm" method="post">
      <div id="comment_list">
   
      </div>
   </form>
</div>

<script>
	$(document).ready(function(){
 		getCommentList();
 		$("#comment").on('click',function(){
 			var check = $("#nickname").val();
 			if(!check){
 	 			alert("로그인이 필요합니다.");
 	 			location.href="/oatjang/login/login.jsp";
 	 		}
 		});
	});

	function fn_comment(){
		$.ajax({
			type:'POST',
			url:"<c:url value='/commuReplyInsert.do'/>",
			data:$("#commentForm").serialize(),
			success:function(){
				$("#reply").val($("#reply").val()+1);
				getCommentList();
				$("#comment").val("");
			}
		});
	}
	
 	function getCommentList(){
 		var userid = $("#userid").val();
 		if(!userid){
 			userid = 0;
 		}
 		var iid = "iid="+$("#iid").val()+"&userid="+userid;
		$.ajax({
			type:'GET',
			url:"<c:url value='/commuReplyList.do'/>",
			data:iid,
			success:function(data){
				var html="";
				if(data!=null){
			        $("#comment_list").html(data);
				}else{
		            html += "<div>";
		            html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		            html += "</table></div>";
		            html += "</div>";
			        $("#comment_list").html(html);
				}
			}
		});
 	}
 	function deleteReply(rid){
 		var sendRid = "rid="+rid+"&iid="+$("#iid").val();
		$.ajax({
			type:'GET',
			url:"<c:url value='/commuReplyDelete.do'/>",
			data:sendRid,
			success:function(){
				getCommentList();
			}
		});
 	}
 	
 	function updateReply(rid){
 		$("#replyContent"+rid).hide();
 		$("#replyUpdate"+rid).show();
 		
 	}
 	function closeUpdate(rid){
 		$("#replyContent"+rid).show();
 		$("#replyUpdate"+rid).hide();
 	}
 	function updateReply2(rid){
 		var send= "rid="+rid+"&iid="+$("#iid").val()+"&content="+$("#updateContent"+rid).val();
 		$.ajax({
			type:'GET',
			url:"<c:url value='/commuReplyUpdate.do'/>",
			data:send,
			success:function(){
				getCommentList();
			}
		});
 	}
 	function openReReply(rid){
 		var check = $("#nickname").val();
		if(!check){
 			alert("로그인이 필요합니다.");
 			location.href="/oatjang/login/login.jsp";
 		}
 		$("#reReplyInsert"+rid).show();
 	}
 	function closeReReply(rid){
 		$("#reReplyInsert"+rid).hide();
 	}
 	function insertReReply(rid){
 		var userid = $("#userid").val();
 		if(!userid){
 			userid = 0;
 		}
 		var send = "reply="+${dto.reply}+"&nickname="+$("#nickname").val()+"&iid="+${dto.iid}+"&ref="+$("#replyRef"+rid).val()+"&comment="+$("#comment"+rid).val()+"&userid="+userid;
		$.ajax({
			type:'GET',
			url:"<c:url value='/commuReplyInsert.do'/>",
			data:send,
			success:function(){
				$("#reply").val($("#reply").val()+1);
				getCommentList();
			}
		});
 	}
</script>
</body>
</html>