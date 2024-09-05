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
form div label {
	width: 100px;
}
.form-group {
	margin-top: 20px;
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
                        <h1 class="page-title">폼 태그</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
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
			            	타입, 아이디, 비밀번호, 이름 , 핸드폰번호, 성별, 취미, 가입인사 입력 폼양식을 만들고
			            	ch06_test_process.jsp로 결과를 전송해주세요.
			            	
							타입 : 사용자(user) / 관리자(admin)을 선택할 수 있는 입력 양식을 만들어주세요.
							아이디 : 아이디를 입력 받을 수 있는 양식으로 만들어주세요.			            	
							비밀번호 : 비밀번호를 입력 받을 수 있는 양식으로 만들어주세요.			            	
							이름 : 이름을 입력 받을 수 있는 양식으로 만들어주세요.			            	
							핸드폰번호 : 첫번째 자리는 010,011,016,017,019,070을 선택 할 수 있도록 입력 양식을 만들어주세요.
									두번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.	
									세번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.
							성별 : 남자(male), 여자(female)로 선택 할 수 있는 입력 양식을 만들어주세요.
								- value : male / female
							취미 : 개발(development), 독서(book), 영화감상(movie), 음악감상(music), 운동(sports), 기타(etc)
								- 기타 일 때는 직접 입력할 수 있는 입력 양식이 동적으로 생성되어 입력 양식이 나타나게 해주세요.
							가입인사 : 가입인사를 문장으로 입력 할 수 있는 입력 양식으로 만들어주세요. 
						 -->
						
						<form class="form-inline" action="ch06_test_process.jsp" target="_self">
						
							<div class="form-group">
								<select class="form-control" name="type">
									<option value="">선택</option>
									<option value="user">사용자</option>
									<option value="admin">관리자</option>
								</select>
							</div><br>
  							
							<div class="form-group">
								<label for="id">아이디 </label>
								<input type="text" class="form-control" id="id" name="id" size=100 placeholder="아이디를 입력하세요">
  							</div><br>
  							
							<div class="form-group">
								<label for="pw">비밀번호 </label>
								<input type="password" class="form-control" id="pw" name="pw" size=100 placeholder="비밀번호를 입력하세요">
  							</div><br>
  							
							<div class="form-group">
								<label for="name">이름 </label>
								<input type="text" class="form-control" id="name" name="name" size=100 placeholder="이름을 입력하세요">
  							</div><br>
							
							<div class="form-group">
								<label for="phone1">휴대폰번호 </label>
								<select class="form-control" name="phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="070">070</option>
								</select> - 
								<input class="form-control" type="text" name="phone2" id="phone2" maxlength="4" size="4"/> - 
								<input class="form-control" type="text" name="phone3" id="phone3" maxlength="4" size="4"/>
							</div><br>

							<div class="form-group"> 
								<label for="gender">성별 </label>
								<input type="radio" id="gender" name="gender" value="male" /> 남자&ensp;
								<input type="radio" id="gender" name="gender" value="female" /> 여자 
							</div><br>
							
							<!-- 개발(development), 독서(book), 영화감상(movie), 음악감상(music), 운동(sports), 기타(etc) -->
							<div class="form-group">
								<label for="hobby">취미 </label>
								<input type="checkbox" name="hobby" id="hobby1" value="개발"/> 개발&ensp;&ensp;
								<input type="checkbox" name="hobby" id="hobby2" value="독서" /> 독서&ensp;&ensp;
								<input type="checkbox" name="hobby" id="hobby3" value="영화감상" /> 영화감상&ensp;&ensp;
								<input type="checkbox" name="hobby" id="hobby4" value="음악감상" /> 음악감상&ensp;&ensp;
								<input type="checkbox" name="hobby" id="hobby5" value="운동" /> 운동&ensp;&ensp;
								<input type="checkbox" id="hobby6" onclick="f_hobby()" /> 기타  
								<input type="text" style="display: none;" class="form-control" name="hobby" id="hobby7" size=10 /> 
							</div>
  							<br><br>
  							
  							<div>
								<textarea class="form-control" id="introduce" name="introduce" rows="10" cols="116" placeholder="가입 인사를 입력하세요" ></textarea>
  							</div>
  							<br>
  							
							<input type="submit" class="btn btn-primary" value="전송">
							<input type="reset" class="btn btn-primary" value="리셋">

						</form>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	
<script>
function f_hobby() {
	let etc = document.querySelector('#hobby6');
	
	if (etc.checked) {
		document.querySelector('#hobby7').style.display = "inline";
		
	} else if (!etc.checked) {
		document.querySelector('#hobby7').style.display = "none";
	}
}

</script>

</body>
</html>