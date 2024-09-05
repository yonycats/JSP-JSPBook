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
                        <h1 class="page-title">세션</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH13</li>
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
						<!-- 여기에 내용을 입력해주세요 -->
						
						<!-- 
							1.초기 세션 만료 시간을 30초로 설정해주세요.
							2. 세션 만료 시간이 15초일 때, '로그인 세션이 곧 만료됩니다! 연장하시겠습니까?' 라는 알림창이 나타나고
							[확인] 버튼을 클릭 시, 세션 만료시간을 60초로 연장 후, 해당 페이지에서 60초부터 세션 만료시간이 관리될 수 있도록 해주세요.
							[취소] 버튼을 클릭 시, 세션 만료가 그대로 진행되게 하고 세션 만료 시간이 0일 때 '로그인 세션 시간이 만료되어 자동 로그아웃 
							되었습니다.' 를 출력해주세요.
						 -->
						 <%
						    // 쿼리 식별키를 가져와서 키가 있으면 세션 60초 세팅, null이면 30초 유지
						    String sec = request.getParameter("sec") == null ? "" : request.getParameter("sec");
						    if (sec.equals("60")) {
						        session.setMaxInactiveInterval(60); // 세션 만료 시간을 60초로 연장
						    } else {
							 	// 세션 기본 시간을 30초로 설정하기
							 	session.setMaxInactiveInterval(30);
						    }
						    
							 int defaultTimeSec = session.getMaxInactiveInterval();
						 %>
						 <c:set value="<%=defaultTimeSec %>" var="time"/>
						 
						 <div class="card" style="width: 400px;">
							<div class="card-header">
								<p>현재 세션 현황입니다.</p>
							</div>
							<div class="card-body">
								<p>설정된 세션 시간은 ${time }초 입니다.</p>
								<h4><strong>남은 시간 : <span id="sessionTime">${time }</span>초</strong></h4>
							</div>		
						 </div>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>

<script>
let countBox = document.querySelector("#sessionTime"); // sessionTime id를 가진 박스 객체 불러오기
let sec = parseInt(countBox.innerText); // sessionTime id를 가진 박스의 텍스트 불러오기 (숫자로 변환)

// 초 실시간 출력 및 세션 연장 함수
function updateSecTime() {
	// 세션이 15초가 남았을 때
	if (sec == 15) {
		// 세션 연장할지 물어보기
		if (confirm("로그인 세션이 곧 종료됩니다. 연장하시겠습니까?")) {
			alert("로그인 세션이 1분으로 연장되었습니다!");
			location.href="ch13_test.jsp?sec=60"; // 쿼리 스트링으로 식별키 보내기
		}
	}
	// 세션이 1초가 남았을 때, ch13_test_exit.jsp 페이지로 넘어감
	if (sec == 1) {
		location.href="ch13_test_exit.jsp";
	}
	
	sec--;
	countBox.innerText = sec; // -된 숫자를 출력하기
}

// JavaScript에서 특정 코드를 일정한 간격으로 반복 실행하도록 예약하는 함수,
// setInterval()은 비동기적으로 작동하며, 주로 주기적인 작업을 수행할 때 사용함
// 1초마다 updateSecTime() 함수를 호출함
setInterval(updateSecTime, 100)
// 비슷한 함수로 setTimeout()을 재귀함수로 사용하여 반복호출하는 방법이 있음
</script>

</html>