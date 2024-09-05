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
h5 {
	font-size: 19px;
	font-weight: bold;
}
</style>
	
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">유효성검사</h1>
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
						<!-- 
							문제 풀어보기
							아래 정규식을 풀어보고 통과 했다면 '통과하였습니다!' 결과를 출력해주세요. 
							
							정규식 테스트 URL : https://regexr.com
						-->
						<form id="frm" action="./ch08_test_process.jsp" method="post">
							<h5>1) 숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.</h5>
							<input type="text" class="form-control" id="quest1" name="quest1"/>
							<p id="err_quest1"></p>
							<br/>	
							
							<h5>2) 시작은 영소문자 abc고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.</h5>
							<input type="text" class="form-control" id="quest2" name="quest2"/>
							<p id="err_quest2"></p>
							<br/>	
							
							<h5>3) 아이디는 영소문자로 시작하고 영소문자,숫자  8~16자로 설정해주세요.</h5>
							<input type="text" class="form-control" id="mem_id" name="mem_id"/>
							<p id="err_id"></p>
							<br/>	
					
							<h5>4) 비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자  8~16자로 설정해주세요.</h5>
							<input type="text" class="form-control" id="mem_pw" name="mem_pw"/>
							<p id="err_pw">비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자  8~16자로 설정해주세요.</p>
							<br/>
					
							<h5>5) 이름은 한글 2-5글자로 설정해주세요.</h5>
							<input type="text" class="form-control" id="mem_name" name="mem_name"/>
							<p id="err_name">이름은 한글 2-5글자로 설정해주세요.</p>
							<br/>
							
							<h5>
							6) 핸드폰번호는 아래의 형식에 맞춰 설정해주세요.<br/>
							첫번째 자리 : 011,016,017,019,070,010 만 가능하게 해주세요.<br/>
							두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요.<br/>
							세번째 자리 : 숫자 4자리로 설정해주세요.<br/>
							예시) 010-1234-1234, 016-123-1234
							</h5>
							<input type="text" class="form-control" id="mem_phone" name="mem_phone"/>
							<p id="err_phone">
								
							</p>
							<br/>
							
							<p id="success"></p>
							
							<input type="submit" class="btn btn-primary" id="sendBtn" value="전송"/>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	
<script type="text/javascript">
let flagQuest1 = false;
let flagQuest2 = false;
let flagId = false;
let flagPw = false;
let flagName = false;
let flagPhone = false;

let quest1 = document.querySelector('#quest1');
let quest2 = document.querySelector('#quest2');
let memId = document.querySelector('#mem_id');
let memPw = document.querySelector('#mem_pw');
let memName = document.querySelector('#mem_name');
let memPhone = document.querySelector('#mem_phone');

let text = document.querySelectorAll('h5');

let regExpQuest1 = /^[0-9]{7,12}$/;
let regExpQuest2 = /^[abc][a-zA-Z]{7,11}$/;
let regExpMemId = /^[a-z][a-z0-9]{7,15}$/;
let regExpmemPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+])[A-Z][a-zA-Z0-9!@#$%^&*()_+]{7,15}$/;
let regExpMemName = /^[가-힣]{2,5}$/;
let regExpMemPhone = /^(011|016|017|019|070|010)-[0-9]{3,4}-[0-9]{4}$/;


quest1.onkeyup = function () {
	console.log(quest1.value);
	console.log(text);
	
	if (!regExpQuest1.test(quest1.value)) {
		document.querySelector('#err_quest1').style.color = 'red';
		document.querySelector('#err_quest1').style.display = 'block';
		document.querySelector('#err_quest1').innerHTML = text[0].innerText;
		flagQuest1 = false;
		
		success();
	} else {
		document.querySelector('#err_quest1').style.color = 'green';
		document.querySelector('#err_quest1').innerHTML = '정상';
		flagQuest1 = true;
		
		success();
	}
}

quest2.onkeyup = function () {
	console.log(quest2.value);
	
	if (!regExpQuest2.test(quest2.value)) {
		document.querySelector('#err_quest2').style.color = 'red';
		document.querySelector('#err_quest2').style.display = 'block';
		document.querySelector('#err_quest2').innerHTML = text[1].innerText;
		flagQuest2 = false;
		
		success();
	} else {
		document.querySelector('#err_quest2').style.color = 'green';
		document.querySelector('#err_quest2').innerHTML = '정상';
		flagQuest2 = true;
		
		success();
	}
}

memId.onkeyup = function () {
	console.log(memId.value);
	
	if (!regExpMemId.test(memId.value)) {
		document.querySelector('#err_id').style.color = 'red';
		document.querySelector('#err_id').style.display = 'block';
		document.querySelector('#err_id').innerHTML = text[2].innerText;
		flagId = false;
		
		success();
	} else {
		document.querySelector('#err_id').style.color = 'green';
		document.querySelector('#err_id').innerHTML = '정상';
		flagId = true;
		
		success();
	}
}

memPw.onkeyup = function () {
	console.log(memPw.value);
	
	if (!regExpmemPw.test(memPw.value)) {
		document.querySelector('#err_pw').style.color = 'red';
		document.querySelector('#err_pw').style.display = 'block';
		document.querySelector('#err_pw').innerHTML = text[3].innerText;
		flagPw = false;
		
		success();
	} else {
		document.querySelector('#err_pw').style.color = 'green';
		document.querySelector('#err_pw').innerHTML = '정상';
		flagPw = true;
		
		success();
	}
}

memName.onkeyup = function () {
	console.log(memName.value);
	
	if (!regExpMemName.test(memName.value)) {
		document.querySelector('#err_name').style.color = 'red';
		document.querySelector('#err_name').style.display = 'block';
		document.querySelector('#err_name').innerHTML = text[4].innerText;
		flagName = false;
		
		success();
	} else {
		document.querySelector('#err_name').style.color = 'green';
		document.querySelector('#err_name').innerHTML = '정상';
		flagName = true;
		
		success();
	}
}

memPhone.onkeyup = function () {
	console.log(memPhone.value);
	
	if (!regExpMemPhone.test(memPhone.value)) {
		document.querySelector('#err_phone').style.color = 'red';
		document.querySelector('#err_phone').style.display = 'block';
		document.querySelector('#err_phone').innerHTML = text[5].innerText;
		flagPhone = false;
		
		success();
	} else {
		document.querySelector('#err_phone').style.color = 'green';
		document.querySelector('#err_phone').innerHTML = '정상';
		flagPhone = true;
		document.querySelector('#success').innerHTML = "통과하셨습니다!";
		
		success();
	}
}

function success () {
	if (flagQuest1 && flagQuest2 && flagId && flagPw && flagName && flagPhone) {
		document.querySelector('#success').innerHTML = "통과하셨습니다!";
	} else {
		document.querySelector('#success').innerHTML = "";
	}
}

</script>
	
</body>
</html>