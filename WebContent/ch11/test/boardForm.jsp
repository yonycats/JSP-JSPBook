<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
	
<style>
.inputWidth {
	border: 1px solid #c5c5c5;
    width: 100%;
    border-radius: 5px;
}

</style>
	
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
					<!-- 
						1. 게시판 등록 페이지를 작성해주세요.
						 
						게시글 등록
						─────────────────────────────
						제목 : 
						내용 :
						─────────────────────────────
						첨부파일 : [파일 선택]
						─────────────────────────────
						[ 등록  ] [ 목록  ]
						
						2. 등록 버튼 클릭 시, 게시글 등록(boardInsert.jsp)을 진행해주세요.
						3. 목록 버튼 클릭 시, 게시판 목록 페이지(boardList.jsp)로 이동해주세요
					 -->
					 				 
						 	<div><h4><strong>게시글 등록</strong></h4>
						 	</div>
						 	<hr>
						 	
						 	<form action="boardInsert.jsp" method="post" enctype="multipart/form-data" name="boardForm">
						 		<table class="table table-bordered">
									<tr>
										<th><label for="title">제목</label></th>
										<td>
											<input class="inputWidth" type="text" id="title" name="title" style="height: 30px;">
										</td>
									</tr>						 	
									<tr>
										<th><label for="content">내용</label></th>
										<td>
											<textarea class="inputWidth" rows="10" cols="50" id="content" name="content" wrap="hard"></textarea>
										</td>
									</tr>						 	
									<tr>
										<th>파일</th>
										<td>
											<div class="file_cus">
												<label for="fileData">
												  <div class="btn btn-success file_btn" style="margin-top: 3px;">파일 업로드</div>
												</label>
												<input class="inputWidth" type="file" name="fileData" id="fileData" name="fileData" style="display: none;">
												<span class="file_name" style="margin-left: 10px;">선택된 파일이 없습니다.</span>
											</div>
										</td>
									</tr>						 	
									<tr>
										<td colspan="2">
											<input class="btn btn-primary" type="button" value="등록" onclick="checkBoard()">
											<input class="btn btn-info" type="button" value="목록" onclick="location.href='<%=request.getContextPath() %>/ch11/test/boardList.jsp'">
										</td>
									</tr>			
						 		</table>
						 	</form>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>

<script>
$(window).on('load', function() {
    fileCus();
})

function fileCus() {
    $(".file_cus input[type=file]").on("change", function() {
        const fileName = $(this).val().split("\\").pop();
        $(this).siblings(".file_name").text(fileName || "파일을 선택해주세요.");
    });
}

/* 파일 용량 제한하기 */
$("input[name=fileData]").on("change", function() {
	let maxSize = 2 * 1024 * 1024; // 2MB 용량 제한
	
	let fileSize = this.files[0].size; // 업로드한 파일 용량
	
	if (fileSize > maxSize) {
		alert("파일첨부 사이즈는 2MB 이내로 가능합니다.");
		$(this).val(''); //업로드한 파일 제거
		return;
	}
});

function checkBoard() {
	let title = document.getElementById("title").value.trim();
	let content = document.getElementById("content").value.trim();

    if (title == "" || content == "") {
        alert("제목과 내용을 입력해 주세요.");
        return false;
    }
    boardForm.submit();
}

</script>
	
</body>
</html>