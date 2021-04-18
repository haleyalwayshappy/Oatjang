<%@page import="com.board.dto.SearchPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list");
 	int pg = (Integer)request.getAttribute("pg");
	SearchPaging paging = (SearchPaging)request.getAttribute("paging");
%>

<table>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
	<tr>
		<th width="100">글번호</th>
		<th width="300">사진</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="100">조회수</th>
		<th width="100">작성일</th>
	</tr>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
<%
	if(list!=null){
		for(BoardDTO ob:list){
			String imgName = ob.getImages().split(",")[0];
			
%>
	<tr>
		<td align="center"><%= ob.getIid() %></td>
		<td><img src="images/<%=imgName%>"></td>
		<td><a href="/oatjang/boardView.do?iid=<%=ob.getIid()%>&pg=<%=pg%>"><%=ob.getTitle() %></a>
		</td>
		<td align="center">작성자 </td>
		<td align="center"><%=ob.getHit() %> </td>
		<td align="center"><%=ob.getLogtime() %> </td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="cccccc"></td>
	</tr>
<%
		} // end for
	}	//end if
%>
	<tr>
		<td colspan="5" bgcolor="777777"></td>
	</tr>
	<tr>
		<td colspan="5" align="center"><%= paging.getPagingHTML()%> </td>
	</tr>
</table>
</body>
</html>
