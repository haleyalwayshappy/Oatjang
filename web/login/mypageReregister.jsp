<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.login.dto.LoginDTO" %>
<%@page import="com.login.dto.AddressDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oatjang - 마이페이지수정</title>
<link rel="stylesheet" href="/oatjang/styles/myPage.css" />
<link rel="stylesheet" href="/oatjang/styles/style.css">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {

		$('#pw1, #pw2').keyup(function() {
			var number = /([0-9])/;
            var alphabets = /([a-zA-Z])/;
            var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;

			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			var pwStrength = $("#pwStrength");
			var pwCheck = $("#pwCheck");
			var pwStatus = 0;

			if (pw1.length < 6) {
				pwStrength.text("weak")
						  .css({'color': 'red'})
				pwStatus = 0;
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 pwStatus = 2;
					 pwStrength.text("strong")
					  .css({'color': 'green'})
				 } else {
					 pwStatus = 1;
					 pwStrength.text("medium").css({'color': 'yellow'})
				 }
			}


			if (pwStatus == 2) {
				if (pw1 == pw2) {
					$("#pwCheck").text("비밀번호가 일치합니다.").css({
						'font-weight' : 'bold',
						'color' : 'green'
					});
				} else {
					$("#pwCheck").text("비밀번호가 일치하지 않습니다. ").css({
						'font-weight' : 'bold',
						'color' : 'red'
					});
				}
			} else {
				$("#pwCheck").text("비밀번호를 더 강하게 만들어 주세요").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
			}


		});

		// TODO: 본인인증

		// TODO: 주소 찾기
		$('#searchAddress').on('click', function () {
			var pop = window.open("/oatjang/login/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
		});


	});
	// 주소 가지고 오기
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY,lat,lng){

		document.getElementById('addr1').value = roadAddrPart1;
		document.getElementById('addr2').value = addrDetail + ", " + roadAddrPart2;

		document.getElementById('roadFullAddr').value = roadFullAddr;
		document.getElementById('roadAddrPart1').value = roadAddrPart1;
		document.getElementById('roadAddrPart2').value = roadAddrPart2;
		document.getElementById('addrDetail').value = addrDetail;
		document.getElementById('lat').value = lat;
		document.getElementById('lng').value = lng;
	}

</script>


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
	LoginDTO dto = (LoginDTO)session.getAttribute("loginComplete");
	AddressDTO addr_dto = (AddressDTO)request.getAttribute("addressEntity");
%>
<form action="/oatjang/reRegister.do" method="post">
<div class="my_page">
	<h3>로그인 정보</h3>
	<hr>
	<table class="information_form">
		<thead>
        	<tr class="information_select_fix">
            	<td>Username</td>
                <th><%=dto.getId()%><input type="hidden" id="id"  name="id" value="<%=dto.getId()%>"></th>
                <td>아이디는 수정할 수 없습니다</td>
            </tr>
    	</thead>
    	<thead>
        	<tr class="information_select_fix">
            	<td>Password</td>
                <th><input type="password" id="pw1" value="<%=request.getParameter("pw")%>"></th>
                <td><span id="pwStrength"></span></td>
            </tr>
    	</thead>
    	<thead>
        	<tr class="information_select_fix">
            	<td>Password Check</td>
                <th><input type="password" id="pw2" name="pw" value="<%=request.getParameter("pw")%>"></th>
                <td><span id="pwCheck">비밀번호가 일치합니다. </span></td>
            </tr>
    	</thead>
    </table>
    <h3>회원 정보</h3>
	<hr>
    <table class="information_form">
    	<thead>
        	<tr class="information_select_fix">
            	<td>Nickname</td>
                <th><input type="text" name="nickname" value="<%=request.getParameter("nickname")%>"></th>
                <td><span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span></td>
            </tr>
    	</thead>
    	<thead>
        	<tr class="information_select_fix">
            	<td>name</td>
                <th><input type="text" name="name" value="<%=request.getParameter("name")%>"></th>
            </tr>
    	</thead>
    	<thead>
        	<tr class="information_select_fix">
            	<td>Birthday</td>
                <th><input type="text" name="age" value="<%=request.getParameter("age")%>"></th>
            </tr>
    	</thead>
    	<thead>
        	<tr class="information_select_fix">
            	<td>Phone #</td>
                <th><input type="text" name="phone" value="<%=request.getParameter("phone")%>"></th>
            </tr>
    	</thead>
    </table>
    <h3>주소 정보</h3>
	<hr>
	<table class="information_form_address">
    	<thead>
        	<tr class="information_select_fix">
            	<td rowspan="2">address</td>
                <th id="select_roadAddrPart1">
                <input id="addr1" type="text" name="addr1" class="form__input"
					   placeholder="주소" value="<%=addr_dto.getRoadAddrPart1()%>" required readonly>
               	<input type="button" id="searchAddress" name="search_btn" value="검색"></input>

				</th>
            </tr>
            <tr class="information_select_fix">
                <th id="select_roadAddrPart2"><input id="addr2" type="text" name="addr2" class="form__input"
						placeholder="상세 주소" value="<%=addr_dto.getAddrDetail()%> <%=addr_dto.getRoadAddrPart2()%>" required readonly></th>
            </tr>
            <input type="hidden" name="addrId" value="<%=dto.getAddrId()%>">
          	<input type="hidden" id="roadFullAddr" name="roadFullAddr" value="<%=addr_dto.getRoadFullAddr()%>"/>
			<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
			<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
			<input type="hidden" id="addrDetail" name="addrDetail" />
			<input type="hidden" id="lat" name="lat" />
			<input type="hidden" id="lng" name="lng" />

    	</thead>
	</table>


	<div class="info_btns">
		<input type="submit" value="회원정보수정">
		<input type="button" value="취 소" onclick="location.href='/oatjang/index.jsp'">
	</div>
</div>
</form>
</body>
</html>


<%--  value="<%=addr_dto.getRoadFullAddr%>"  --%>
