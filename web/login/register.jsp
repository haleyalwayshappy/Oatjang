
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
<script>
$(document).ready(function() {
	var id_checker = false;				// id 확인
	var pw1_checker = false;			// pw1 확인
	var pw2_checker = false;			// pw2 확인

	$('#id').keyup(function () {
		var send = "id=" + $('#id').val();
		console.log(send);
		
		$.ajax({
			type:'POST',
			url:'idCheck.jsp',
			dataType:"html",
			data:send,
			error:function() {
				//TODO: fix the comment
				console.log("Problem Occurred While Checking Valid ID")
				/* $('#id').css("border", "2px solid #ff0000"); */
				// TODO: true
				id_checker = true;
			},
			success:function(data) {
				$('#idCheck').html(data);
				/* $('#id').css("border", "2px solid #00ff00"); */
				id_checker = true;
			}
		});
		
	});
		
		
		// 비밀번호 강도와, 비밀번호 체크
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
				// weak
				pwStatus = 0;
				$('#pw1').css("border", "2px solid #ff0000");
				pw1_checker = false;
			} else {
				 if (pw1.match(number) && pw1.match(alphabets) && pw1.match(special_characters)) {
					 // strong
					 pwStatus = 2;
					 $('#pw1').css("border", "2px solid #00ff00");
					 pw1_checker = true;
				 } else {
					 // medium
					 pwStatus = 1;
					 $('#pw1').css("border", "2px solid #ff0000");
					 pw1_checker = false;
				 }
			}
			
			
			if (pwStatus == 2) {
				if (pw1 == pw2) {
					$("#pwCheck").text("비밀번호가 일치합니다.").css({
						'font-weight' : 'bold',
						'color' : 'green'
					});
					$('#pw2').css("border", "2px solid #00ff00");
					pw1_checker = true;
					pw2_checker = true;
				} else {
					$("#pwCheck").text("비밀번호가 일치하지 않습니다. ").css({
						'font-weight' : 'bold',
						'color' : 'red'
					});
					$('#pw2').css("border", "2px solid #ff0000");
					pw2_checker = false;
				}
			} else {
				$("#pwCheck").text("비밀번호에 영문, 숫자, 기호가 있어야해요").css({
					'font-weight' : 'bold',
					'color' : 'red'
				});
				pw1_checker = true;
			}
		});  // 비밀번호

		
		// 다음으로 넘어가기 위해 모든 필드가 작성 되었는지 여부 확인
		$('#to_next_register').on('click', function() {
			// TODO: change checker
			if (id_checker && pw1_checker && pw2_checker) {
				var send_id = $('[name="id"]').val();
				var send_pw = $('[name="pw"]').val();
				
				
				$( '.align' ).load( "register2.jsp", 
						{ id: send_id, pw: send_pw } ,
						function( response, status, xhr ) {
							if ( status == "error" ) {
								var msg = "Sorry but there was an error: ";
							}
						});
			} else {
				alert("정보를 입력/확인 해주세요")
			}
			
	});
});
</script>


</head>

<body class="container">
	<script>
    	$(document).ready(function() {
    		$('.navigation_bar').load( "./loginMenu.jsp", function( response, status, xhr ) {
    			if ( status == "error" ) {
    				var msg = "Sorry but there was an error: ";
    			}
    		});
    	})
    </script>
	<div class="navigation_bar"></div>

	<div class="align">
		<div class="login_image">
			<div class="login_container">
				<div class="grid">
					<div class="form login">

						<div class="form__field">
							<input id="id" type="text" name="id" class="form__input"
								placeholder="Username" autocomplete="off" required
							>
							<span id="idCheck">아이디를 입력하세요.</span>
						</div>


						<div class="form__field">
							<div class="form__field__password">
								<input id="pw1" type="password" class="form__input"
									placeholder="Password" required
								>

								<input id="pw2" type="password" name="pw" class="form__input"
									placeholder="Password " required
								>
							</div>
							<span id="pwCheck">비밀번호를 입력하세요.</span>
						</div>

						<%-- 다음으로 버튼, 취소하기 버튼 --%>
						<div class="form__field">
							<input type="button" value="다음으로" id="to_next_register">
							<a href="../index.jsp">취소하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>




		<script>



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
