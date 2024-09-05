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
</head>
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
						<div class="table-responsive">
							<table class="table table-bordered table-hover" width="100%">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<tr>
									<td>10</td>
									<td>네이버웍스 비정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-16</td>
									<td>1455</td>
								</tr>
								<tr>
									<td>9</td>
									<td>네이버웍스 일부 기능의 사양 변경 및 종료 안내</td>
									<td>관리자</td>
									<td>2022-11-15</td>
									<td>234</td>
								</tr>
								<tr>
									<td>8</td>
									<td>[프로모션 공지] 네이버웍스 X 워크플레이스 결합 서비스 신규 가입 20%추가 할인(~12.31)</td>
									<td>관리자</td>
									<td>2022-11-14</td>
									<td>23444</td>
								</tr>
								<tr>
									<td>7</td>
									<td>[중요] 네이버웍스 V3.5 정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-13</td>
									<td>12466</td>
								</tr>
								<tr>
									<td>6</td>
									<td>[프로모션 사전 공지] 네이버웍스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
									<td>관리자</td>
									<td>2022-11-12</td>
									<td>111</td>
								</tr>
								<tr>
									<td>5</td>
									<td>드라이브 서비스 DB 업그레이드 작업 사전 안내</td>
									<td>관리자</td>
									<td>2022-11-11</td>
									<td>2233</td>
								</tr>
							</table>
						</div>
						<hr/><br/>
						<div class="col-md-12 stretch-card grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" id="chk" value="Y"> 
										<label class="form-check-label" for="chk">append 여부</label>
									</div>
										<h6>선택한 td안에 있는 글자를 아래 P태그에 출력해주세요!</h6>
									<p id="output" class="text-dark">출력란</p>
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	
<script src="jquery-3.7.1.min.js"></script>
<script type="text/javascript">

$(function() {
	let tds = $("td");
	let text = "";
	let ele = null;
	
	$('td').on('click', function() {
		// console.log("내가 누른 td : " + $(this));
		// console.log("내가 누른 td index : " + $(this).index());
		// console.log("내가 누른 td text : " + $(this).text());
		
		text = $(this).text(); // 내가 클릭한 텍스트를 저장
		ele = $(this);
		
		// 동적으로 만드는 엘리멘트 요소
		let html = "";
		html += "<p id='p'>"+ text + "</p><br/>";
		html += "<button class='btn btn-warning' id='udtBtn'>수정</button>";
		html += "<button class='btn btn-danger' id='delBtn'>삭제</button><br>";
		
		// 파라미터를 넣지 않으면 getter, 파라미터를 넣으면 setter / java 메소드와 비슷함
		// $('#output').text(text); // 얻어온 텍스트를 집어넣음
		$('#output').html(html);  
	}); 
	
	// 동적 요소에 함수 주기 -> 동적으로 생성된 버튼을 클릭할 때 이벤트를 처리하는 경우, 이벤트 위임을 사용
	// 두 번째 파라미터 : 이벤트를 위임할 선택자이다. 여기서는 #udtBtn이라는 ID를 가진 요소에서 
	// 클릭 이벤트가 발생할 때 핸들러가 실행된다. 이 선택자는 #output의 자식 요소로서 존재해야 한다.
	// 	$('#부모요소').on('이벤트종류', '선택자(자식요소)', 핸들러함수() {}); 
	$("#output").on("click", "#udtBtn", function(){
		// console.log("수정 클릭함")
		let btnText = $(this).text();
		
		if(btnText == "수정"){
			let pText = $('#output').find('#p').text();
			
			// find() : 부모 요소 내부의 자식 요소를 찾을 때 사용하는 함수
			$("#output").find("p").html("<input type='text' value='" + pText + "'/>");
			$(this).text("확인");
		} else {
			let valText = $("#output").find("input").val();
			$("#output").find("p").html(valText);
			ele.html(valText);
			$(this).text("수정");	
		}
	}); 
	
	$('#output').on('click', '#delBtn', function() {
		// console.log("삭제 클릭함");
		$("#output").find("#p").html("");
		ele.html("");
	}); 
});

</script>
	
</body>
</html>