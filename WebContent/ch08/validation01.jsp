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
                        <h1 class="page-title">유효성 검사</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH08</li>
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

						
					<!-- 자바스크립트의 onsubmit 이벤트 -->
						<h3>자바스크립트 버전 </h3><br>
						<form action="validation01_process.jsp" method="post" name="loginForm" 
								onsubmit="return submitEvent()">
							아이디 : <input type="text" name="id">	<br>			
							비밀번호 : <input type="text" name="pw"><br>		
							<input type="submit" value="전송" onclick="CheckLogin()">			
						</form>
						<br>
						
						
					<!-- jquery 버튼 click 이벤트 -->
						<h3>jquery 버전 </h3><br>
						<form action="validation01_process.jsp" method="post" id="loginForm2">
							아이디 : <input type="text" name="id" id="id2">	<br>			
							비밀번호 : <input type="text" name="pw" id="pw2">	<br>				
							<input type="button" id="subBtn" value="전송">			
						</form>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>

<script type="text/javascript">

// 자바스크립트 onsubmit 이벤트
function CheckLogin() {
	var form = document.loginForm;	// form name element 요소 얻어오기
	// 입력한 아이디 값의 길이를 이용해 특정 범위 내에서만 입력할 수 있도록 제한
	if ( form.id.value.length < 4 || form.id.value.length > 12 ) {
		alert("<js> 아이디는 4~12자 이내로 입력 가능합니다!");
		form.id.select();	// id 입력란으로 focus 이동
		return false;
	}
	// 입력한 비밀번호 값의 길이를 이용해 특정 범위 내에서만 입력할 수 있도록 제한
	if ( form.pw.value.length < 4 ) {
		alert("<js> 비밀번호는 4자 이상 입력 가능합니다!");
		form.pw.select();	// pw 입력란으로 focus 이동
		return false;
	}
	
	// 정상적으로 데이터가 입력되었다면 서버로 전송
 	form.submit();
}

 
// jquery 버튼 click 이벤트
$(function(){
	var subBtn = $("#subBtn");			// 버튼 element
	var loginForm2 = $("#loginForm2");	// form element
	
	subBtn.on("click",function(){
		var id = $("#id2").val(); 
		var pw = $("#pw2").val(); 
		
		// 입력한 아이디 값의 길이를 이용해 특정 범위 내에서만 입력할 수 있도록 제한
		if( id.length < 4 || id.length > 12 ){
			alert("<jq> 아이디는 4~12자 이내로 입력 가능합니다!");
			$('#id2').select();
			return false;
		}
		// 입력한 비밀번호 값의 길이를 이용해 특정 범위 내에서만 입력할 수 있도록 제한
		if( pw.length < 4 ){
			alert("<jq> 비밀번호는 4자 이상 입력 가능합니다!");
			$('#pw2').focus();
			return false;
		}
		// 데이터가 정상적으로 입력되었다면 서버로 전송
		loginForm2.submit();
	});
	
}); 

</script>

</body>
</html>