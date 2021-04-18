<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/oatjang/styles/board.css">
<link rel="stylesheet" href="/oatjang/styles/style.css">

<script>
	$(document).ready( function() {
 		$('#searchAddress').on( 'click', function() {
 			console.log('iii')
 			var pop = window.open("/oatjang/login/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
		});
	});

	// 주소 가지고 오기
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo, entX, entY,
			lat, lng) {
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
		document.getElementById('addr2').value = addrDetail + ", "
				+ roadAddrPart2;

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
</script>
<script>
	var sel_file = [];
	var sel_files = [];
	$().ready(
			function() {
				$('.navigation_bar').load("/oatjang/login/loginMenu.jsp",
						function(response, status, xhr) {
							if (status == "error") {
								var msg = "Sorry but there was an error: ";
							}
						});

				$("#input_img").on("change", handleImgFileSelect);
				$("#input_imgs").on("change", handleImgFilesSelect);
			});
	function mainFileUploadAction() {
		$("#input_img").trigger('click');
	}
	function subFileUploadAction() {
		$("#input_imgs").trigger('click');
	}
	function handleImgFileSelect(e) {
		sel_file = [];
		$(".imgs_wrap").empty();

		var file = e.target.files[0];

		if (!file.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}

		sel_file.push(file);
		var reader = new FileReader();
		reader.onload = function(e) {
			var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(0)\" id=\"img_id_0\"><img src=\""+e.target.result+"\" data-file='"+file.name+"' class='selProductFile' title='Click to remove'></a>";
			$(".imgs_wrap").append(html);
		}

		reader.readAsDataURL(file);
	}
	function handleImgFilesSelect(e) {
		sel_files = [];
		$(".imgs_wraps").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 1;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					var reader = new FileReader();
					reader.onload = function(e) {
						sel_files.push(f);
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImagesAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wraps").append(html);
						index++;
					}

					reader.readAsDataURL(f);
				});
	}

	function deleteImageAction(index) {
		sel_file.splice(index, 1);
		var img_id = "#img_id_0";
		$(img_id).remove();

	}
	function deleteImagesAction(index) {
		sel_files.splice(index, 1);
		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}
	function checkCondition(){
		if($(".title").val()===''){
			alert("제목을 입력하세요");
			$(".title").focus();
			return;
		}
		if($(".price").val()===''){
			alert("가격을 입력하세요");
			$(".price").focus();
			return;
		}
		if($("#category").val()==='분류' || $("#category").val()==='-------'){
			alert("카테고리를 정하세요");
			$("#category").focus();
			return;
		}
		if($("#input_img").val()===''){
			alert("메인사진을 정하세요");
			return;
		}
		if($("#addr1").val()===''){
			alert("거래장소를 정하세요");
			return;
		}
		$("#boardInsertForm").submit();
	}
</script>
</head>
<body>

	<div class="navigation_bar"></div>
		<form action="../boardInsert.do" id="boardInsertForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginComplete.userId }" />
			<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
			<div class="textbox">
				<!-- 제목,가격,카테고리,설명 -->
				<div class="div_title">
					<input class="box title" type="text" name="title" value=""
						placeholder="제목을 입력하세요." /> <br> 
					<div class="div_category">
                  		<input class="price" type="text" name="price" value="" placeholder="가격을 입력하세요." />
                  		<select class="category" name="category" id="category" >
		                     <option value="분류">분류</option>
		                     <option value="-------">-------</option>
		                     <option value="상의">상의</option>
		                     <option value="하의">하의</option>
		                     <option value="아우터">아우터</option>
		                     <option value="원피스">원피스</option>
		                     <option value="악세사리">악세사리</option>
		                     <option value="신발">신발</option>
                  		</select>
               		</div>	
				</div>
			</div>

			<!-- 설명칸  -->
			<div class="div_intext">
				<textarea class="textinput bi" name="description" value=""
					placeholder="내용을 입력하세요."></textarea>
			</div>



	<div class="picture">
		<!--  메인사진 -->
		<div class="picturein">
			<div class="div_main">
				<div>
					<h2>메인사진</h2>
				</div>
				<div class="input_wrap">
					<a href="javascript:" onclick="mainFileUploadAction();"
						class="my_button">파일 업로드</a> <input type="file" id="input_img"
						name="mainfile" hidden="true" />
				</div>
			</div>
			<div>
				<div class="imgs_wrap">
					<img id="img" />
				</div>
			</div>

			<!-- 서브사진 -->
			<div class="div_main">
				<h2>서브사진</h2>
				<div class="input_wraps">
					<a href="javascript:" onclick="subFileUploadAction();"
						class="my_button">파일 업로드</a> <input type="file"
						multiple="multiple" id="input_imgs" name="subfile[]" hidden="true" />
				</div>
			</div>
			<div>
				<div class="imgs_wraps">
					<img id="imgs" />
				</div>
			</div>
		</div>

		<div class="div_intext addressbox box">
			<div class="address_search">
				<input id="addr1" type="text" name="addr1" class="form__input"
					placeholder="주소" required readonly>

				<button id="searchAddress" name="search_btn" type="button">
					<i class='fa fa-search'></i>
				</button>
			</div>

			<input id="addr2" type="text" name="addr2" class="form__input"
				placeholder="상세 주소" required readonly> <input type="hidden"
				id="roadFullAddr" name="roadFullAddr" /> <input type="hidden"
				id="roadAddrPart1" name="roadAddrPart1" /> <input type="hidden"
				id="roadAddrPart2" name="roadAddrPart2" /> <input type="hidden"
				id="addrDetail" name="addrDetail" /> <input type="hidden" id="lat"
				name="lat" /> <input type="hidden" id="lng" name="lng" />
		</div>
		<br>
		<!-- 버튼 -->
		<div class="btn">
			<div id="rightbtn">
				<input class="go_btn masterBtn" type="button" value="이전으로" onclick="location.href='/oatjang/boardList.do?pg=1'"/>
			</div>
			<div>
				<input class="back_btn masterBtn" type="button" onclick="checkCondition()" value="게시하기" />
			</div>
		</div>
	</div>

	</form>
</body>

</html>
