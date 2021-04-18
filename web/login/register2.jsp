
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>OatJang - 회원가입</title>
<link rel="stylesheet" href="/oatjang/styles/style.css" />
<link rel="stylesheet" href="/oatjang/styles/register.css" />

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
>

<%
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
System.out.println("id: " + id);
System.out.println("pw: " + pw);
 %>
 
 
<script>

	// TODO: 주소 찾기
		$('#searchAddress').on('click', function () {
			var pop = window.open("/oatjang/login/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		});
		
	// 주소 가지고 오기
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY,lat,lng){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			/* document.form.roadFullAddr.value = roadFullAddr;
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.roadAddrPart2.value = roadAddrPart2;
			document.form.addrDetail.value = addrDetail;
			document.form.engAddr.value = engAddr;
			document.form.jibunAddr.value = jibunAddr;
			document.form.zipNo.value = zipNo;
			document.form.admCd.value = admCd;
			document.form.rnMgtSn.value = rnMgtSn;
			document.form.bdMgtSn.value = bdMgtSn;
			document.form.detBdNmList.value = detBdNmList;
			document.form.bdNm.value = bdNm;
			document.form.bdKdcd.value = bdKdcd;
			document.form.siNm.value = siNm;
			document.form.sggNm.value = sggNm;
			document.form.emdNm.value = emdNm;
			document.form.liNm.value = liNm;
			document.form.rn.value = rn;
			document.form.udrtYn.value = udrtYn;
			document.form.buldMnnm.value = buldMnnm;
			document.form.buldSlno.value = buldSlno;
			document.form.mtYn.value = mtYn;
			document.form.lnbrMnnm.value = lnbrMnnm;
			document.form.lnbrSlno.value = lnbrSlno;
			document.form.emdNo.value = emdNo;
			document.form.entX.value = entX;
			document.form.entY.value = entY; */
			
			document.getElementById('addr1').value = roadAddrPart1;
			document.getElementById('addr2').value = addrDetail + ", " + roadAddrPart2;
			
			document.getElementById('roadFullAddr').value = roadFullAddr;
			document.getElementById('roadAddrPart1').value = roadAddrPart1;
			document.getElementById('roadAddrPart2').value = roadAddrPart2;
			document.getElementById('addrDetail').value = addrDetail;
			document.getElementById('lat').value = lat;
			document.getElementById('lng').value = lng;
			//document.form.addr2.value = e + ", " + n;
			
			/* console.log("Hello World");
			console.log(n, e); */
	}
	function replaceAll(str, searchStr, replaceStr) {
		  return str.split(searchStr).join(replaceStr);
	}
	
	$('#to_next_register').on('click', function() {
		var str = $('[name="age"]').val()		// 1995-06-02

		var str_to_age = replaceAll(str, "-", "");
	
		
		$('#send_age').val(str_to_age);
		document.submitRegister.submit();
	})
	
	$('#login__nickname').keyup(function () {
			var send = "nickname=" + $('#login__nickname').val();
			console.log(send);
			
			$.ajax({
				type:'POST',
				url:'nicknameCheck.jsp',
				dataType:"html",
				data:send,
				error:function() {
					//TODO: fix the comment
					console.log("Problem Occurred While Checking Valid ID")
					/* $('#id').css("border", "2px solid #ff0000"); */
					// TODO: true
					nickname_checker = true;
				},
				success:function(data) {
					$('#nicknameCheck').html(data);
					/* $('#id').css("border", "2px solid #00ff00"); */
					nickname_checker = true;
				}
			});
			
			
	});
</script>
</head>
<!-- <body class="container">
	<header class="header1">
		<h1 class="logo">
			<a href="/oatjang/index.jsp">OatJang</a>
		</h1>

		<div class="middle container red topBotomBordersOut">
			<a href="#" alt="all">all</a> <a href="board.html" alt="community">community</a>
			<a href="#" alt="deals">deals</a> <a href="maps.html" alt="maps">maps</a>
			<a href="#" alt="service">service</a>
		</div>

		<div class="right container red topBotomBordersOut">
			<a href="#" alt="search">search</a> <a
				href="/oatjang/login/login.jsp" alt="login"
			>login</a>
			</li> <a href="#" alt="join us">join us</a>
			</li>
		</div>
	</header>

	<div class="align">
 -->
 
 

<div class="login_image">
	<div class="login_container">
		<div class="grid">
			<form action="/oatjang/register.do" name="submitRegister"
				method="POST" class="form login"
			>
				
				<input type="hidden" name="send_id" id="send_id" value="<%=id %>" />
				<input type="hidden" name="send_pw" id="send_pw" value="<%=pw %>" />

				<div class="form__field form__field__first">
					<input id="login__nickname" type="text" name="nickname"
						class="form__input" placeholder="nickname" autocomplete="off" required
					>
					<span id="nicknameCheck">닉네임을 넣어주세요</span>
				</div>

				<div class="form__field">
					<input id="login__name" type="text" name="name" class="form__input"
						placeholder="Name" autocomplete="off" required
					>
				</div>

				<div class="form__field">
					<input id="login__age" type="date" name="age" class="form__input"
						required
					>
					<input type="hidden" id="send_age" name="send_age">
				</div>

				<div class="form__field">
					<input id="login__phone" type="text" name="phone"
						class="form__input" placeholder="Phone Number" autocomplete="off" required
					>
				</div>

				<div class="form__field ">
					<div class="address_search">
						<input id="addr1" type="text" name="addr1" class="form__input"
							placeholder="주소" required readonly
						>

						<%-- <input type="button" id="search_btn" value="<i class='fa fa-search'></i>"></input> --%>
						<button id="searchAddress" name="search_btn" type="button">
							<i class='fa fa-search'></i>
						</button>
					</div>

					<input id="addr2" type="text" name="addr2" class="form__input"
						placeholder="상세 주소" required readonly
					>
					<input type="hidden" id="roadFullAddr" name="roadFullAddr" />
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
					<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
					<input type="hidden" id="addrDetail" name="addrDetail" />
					<input type="hidden" id="lat" name="lat" />
					<input type="hidden" id="lng" name="lng" />
				</div>


				<div class="form__field">
					<input type="button" value="다음으로" id="to_next_register">
					<a href="#" id="to_previous_register">뒤로가기</a>
				</div>

			</form>

		</div>

	</div>

	<svg xmlns="http://www.w3.org/2000/svg" class="icons">
            <symbol id="arrow-right" viewBox="0 0 1792 1792">
                <path
			d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"
		/>
            </symbol>
            <symbol id="lock" viewBox="0 0 1792 1792">
                <path
			d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"
		/>
            </symbol>
            <symbol id="user" viewBox="0 0 1792 1792">
                <path
			d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"
		/>
            </symbol>
        </svg>
	<!-- 		</div> -->
	<script>
// 뒤로가기
$('#to_previous_register').on('click', function() {
  $( 'body' ).load( "register.jsp", function( response, status, xhr ) {
  if ( status == "error" ) {
    var msg = "Sorry but there was an error: ";
  }
});
});
</script>
	</body>
</html>


<%-- 
	<form action="/oatjang/register.do" method="post">
		<table border="1" align="center" width="600">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id">
				</td>
				<td id="idCheck"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="pw1">
				</td>
				<td>
					<span id="pwStrength"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" id="pw2" name="pw">
				</td>
				<td>
					<span id="pwCheck">비밀번호가 일치합니다. </span>
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname">
				</td>
				<td>
					<span id="nicknameCheck">이미 사용중인 닉네임 입니다.</span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="age">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>
					<input type="text" name="phone">
				</td>
				<td>
					<input type="button" value="본인인증">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" id="addr1" name="addr1">
					<input type="text" id="addr2" name="addr2">
					<input type="hidden" id="roadFullAddr" name="roadFullAddr" />
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" />
					<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" />
					<input type="hidden" id="addrDetail" name="addrDetail" />
					<input type="hidden" id="lat" name="lat" />
					<input type="hidden" id="lng" name="lng" />
				</td>
				<td>
					<input type="button" id="searchAddress" value="주소 찾기">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="로그인">
					<input type="reset" value="취&nbsp;&nbsp;소">
				</td>
			</tr>
		</table>
	</form>  --%>
