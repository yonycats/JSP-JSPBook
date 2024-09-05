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
							<caption>앞(SEM PC 자리)</caption>
		  					 <table class="table table-bordered" style="text-align:center; font-size:24px;">
		                        <tr height="80px">
		                           <td width="10%">강성연</td>
		                           <td width="10%">김필거</td>
		                           <td width="10%">김수연</td>
		                           <td width="10%">이영준</td>
		                           <td width="20%"></td>
		                           <td width="10%">정현영</td>
		                           <td width="10%">최동재</td>
		                           <td width="10%">나성훈</td>
		                           <td width="10%">황현준</td>
		                        </tr>
		                        <tr height="80px">
		                           <td>이건우</td>
		                           <td>이은재</td>
		                           <td>김연희</td>
		                           <td>김예지</td>
		                           <td></td>
		                           <td>김선영</td>
		                           <td>권기혁</td>
		                           <td>박범진</td>
		                           <td>박민수</td>
		                        </tr>
		                        <tr height="80px">
		                           <td>박병준</td>
		                           <td>이현수</td>
		                           <td>윤다빈</td>
		                           <td>김민강</td>
		                           <td></td>
		                           <td>이동형</td>
		                           <td>박현진</td>
		                           <td>김용주</td>
		                           <td>문형석</td>
		                        </tr>
		                        <tr height="80px">
		                           <td></td>
		                           <td>임효정</td>
		                           <td>정문성</td>
		                           <td>김은태</td>
		                           <td></td>
		                           <td></td>
		                           <td></td>
		                           <td></td>
		                           <td></td>
		                        </tr>
		                     </table>

							<hr/>
							<div class="progress" style="height: 40px;">
								<div class="progress-bar progress-bar-striped progress-bar-animated" id="myBar" role="progressbar" 
									aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%; height: 40px;">
									<span class="">0%</span>
								</div>
							</div>
							<br/>
							<h4 id="txt" class="mb-5" style="font-weight: bold; font-size: 35px;"></h4>
							<button type="button" style="padding:12px;border:none;cursor:pointer;" onclick="f_random()">출력</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<!-- 
	프로그레스바 % 증가 이벤트 
	스타일 요소의 width를 증가시켜주면 됨.
	.css("width", "100");
	.style.width = 100;
-->
<script type="text/javascript">
// 1. 앉은 학생들의 배열화
let tds = document.querySelectorAll('table td')
let myBar = document.getElementById("myBar");
let ran = 0;
let width = 0;
lastText = ""; // 학생 이름 저장용 (빈칸 출력 방지)
let intervalId; // setInterval의 ID를 저장할 변수

function f_random() {
    // 모든 td의 배경색을 화이트로 설정
    tds.forEach(td => {
        td.style.backgroundColor = "";
    });
    // 기존의 setInterval이 설정되어 있다면 정리, 중복 실행 방지 (멀티스레드 방지)
    if (intervalId) clearInterval(intervalId);
	
	ran = 0;
	width = 0;
	
	intervalId = setInterval(increaseWidth, 100);
}

// 2. 프로그래스바 1~100 범위 내 조건 분기!
function increaseWidth() {
	if (width < 100) {
		tds[ran].style.backgroundColor = "";
		ran = Math.floor(Math.random() * tds.length);

		if (tds[ran].textContent.trim() != "") {
			width += 1;
			myBar.style.width = "" + width + "%";
			myBar.textContent = "" + width + "%";
			
			tds[ran].style.backgroundColor = "yellow";
			lastText = tds[ran].textContent;
			document.querySelector('#txt').innerText = lastText;
		}
	} else {
		document.querySelector('#txt').innerText = lastText + "!!!";
		clearInterval(intervalId); // 프로그래스 바가 100이 되면 정리
		return;
	}
}
</script>

</html>