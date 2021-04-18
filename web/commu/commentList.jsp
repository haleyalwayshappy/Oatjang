<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:forEach items="${list }" var="ob">
<c:if test="${ob.rid==ob.ref }">
<div class="replyList">
</c:if>
<c:if test="${ob.rid!=ob.ref }">
<div class="re_replyList">
</c:if>
        
         <div class="nickname_content">
            <h4><strong>${ob.nickname }</strong></h4>
            <div class="reply__content">
            	<!-- css 필요 -->
            	<div id="replyUpdate${ob.rid }" style="display:none;">
	            	<form id="replyUpdateForm${ob.rid }">
		               <input type="hidden" id="ridrid" name="rid" value="${ob.rid }"/>
		               <input type="hidden" id="" name="iid" value="${ob.iid }"/>
		               <input type="text" id="updateContent${ob.rid }" name="content"/>
		               <input type="button" onclick="closeUpdate(${ob.rid})" value="취소"/>
		               <input type="button" onclick="updateReply2(${ob.rid})" value="수정"/>
	            	</form>
            	</div>
            	<div id="replyContent${ob.rid }">${ob.content }</div>
            	
            </div>
         </div>
         <div class="replyButtonGroup">
            <a href="javascript:" onclick="openReReply(${ob.rid })" class="replyButton">답글</a>
            <c:if test="${userid==ob.userid }">
            	<a href="javascript:" onclick="deleteReply(${ob.rid})" class="replyButton">삭제</a>
            	<a href="javascript:" onclick="updateReply(${ob.rid})"class="replyButton">수정</a>
         	</c:if>
         </div>
         
         <div id="reReplyInsert${ob.rid }" style="display:none;">
            <!-- css 필요 -->
            <form id="reReplyInsertForm${ob.rid }">
               <input type="hidden" name="iid" value="${ob.iid }"/>
               <input type="hidden" id="replyRef${ob.rid }" name="ref" value="${ob.ref }"/>
               <input type="text" id="comment${ob.rid }" name="comment"/>
               <input type="button" onclick="closeReReply(${ob.rid})" value="취소"/>
               <input type="button" onclick="insertReReply(${ob.rid})" value="답글"/>
            </form>
         </div>
</div>
</c:forEach>