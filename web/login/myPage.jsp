<%@page import="com.login.dto.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
	<link rel="stylesheet" href="/oatjang/styles/myPage.css" />
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
<!-- getAddr ==> getAddrId 3개 빠꿈 -->

<%
	LoginDTO dto = (LoginDTO)request.getAttribute("loginUserEntity");
	AddressDTO addr_dto = (AddressDTO)request.getAttribute("addressEntity");

	int passLength = dto.getPw().length();
	System.out.println("passLength : "+passLength);
	String passTemp = "";
	for(int i=0; i<passLength; i++){
		passTemp += "*";
	}
	System.out.println("passTemp : "+passTemp);
%>

  <div class="my_page">
	<h3><%=dto.getNickname()%>님의 Page</h3>
	<hr>
	<table class="information_form">
            <thead>
                <tr class="information_select">
                    <td>Username</td>
                    <th><%=dto.getId()%></th>
                </tr>
            </thead>
            <thead>
                <tr class="information_select">
                    <td>Password</td>
                    <th><%=passTemp%></th>
                </tr>
            </thead>

            <thead>
                <tr class="information_select">
                    <td>name</td>
                    <th><%=dto.getName()%></th>
                </tr>
            </thead>
            <thead>
                <tr class="information_select">
                    <td>Birthday</td>
                    <th><%=dto.getAge()%></th>
                </tr>
            </thead>
            <thead>
                <tr class="information_select">
                    <td>Phone #</td>
                    <th><%=dto.getPhone()%></th>
                </tr>
            </thead>
            <thead>
                <tr class="information_select">
                    <td>address</td>
                    <th><%=addr_dto.getRoadAddrPart1()%><br><%=addr_dto.getAddrDetail()%> <%=addr_dto.getRoadAddrPart2() %></th>
                </tr>
            </thead>


        </table>

        <div class="info_btns">
        	<form action="/oatjang/login/passConf.jsp" method="post">
				<input type="hidden" name="id" value="<%=dto.getId()%>">
				<input type="hidden" name="pw" value="<%=dto.getPw()%>">
				<input type="hidden" name="nickname" value="<%=dto.getNickname()%>">
				<input type="hidden" name="name" value="<%=dto.getName()%>">
				<input type="hidden" name="age" value="<%=dto.getAge()%>">
				<input type="hidden" name="phone" value="<%=dto.getPhone()%>">
				<input type="hidden" name="addr" value="<%=dto.getAddrId()%>">
				<input type="hidden" id="roadFullAddr" name="roadFullAddr" value="<%=addr_dto.getRoadFullAddr()%>"/>
				<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" value="<%=addr_dto.getRoadAddrPart1()%>"/>
				<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" value="<%=addr_dto.getRoadAddrPart2()%>"/>
				<input type="hidden" id="addrDetail" name="addrDetail" value="<%=addr_dto.getAddrDetail()%>"/>
				<input type="hidden" id="lat" name="lat" value="<%=addr_dto.getLat()%>"/>
				<input type="hidden" id="lng" name="lng" value="<%=addr_dto.getLng()%>"/>
				<input type="submit" value="회원정보수정">
				<input type="button" value="취 소" onclick="location.href='/oatjang/index.jsp'">
			</form>

        </div>
    </div>

</body>
</html>
