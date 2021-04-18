<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/oatjang/styles/board.css">
<link rel="stylesheet" href="/oatjang/styles/style.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&family=Roboto&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js">
	
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
			var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(0)\" id=\"img_id_0\"><img src=\"" + e
               .target.result + "\" data-file='" + file.name +
               "' class='selProductFile' title='Click to remove'></a>";
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
								+ "\"><img src=\"" + e.target.result + "\" data-file='" + f.name +
                  "' class='selProductFile' title='Click to remove'></a>";
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
		if($("#input_img").val()===''){
			alert("메인사진을 정하세요");
			return;
		}
		$("#commuInsertForm").submit();
	}
</script>
</head>

<body>

	<div class="navigation_bar"></div>
		<form action="../commuInsert.do" id="commuInsertForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userid" value="${loginComplete.userId }" />
			<!-- 임시로 1로 해둠 나중에 로그인 아디로 바꿔야함 -->
			<div class="textbox">
				<!-- 제목,가격,카테고리,설명 -->
				<div class="div_title">
					<input class="box title" type="text" name="title" value=""
						placeholder="제목을 입력하세요." /> <br>
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