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
                        <h1 class="page-title">내장객체</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
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
							[문제]
							아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소, 자기소개를 입력받을 폼을 구성해주세요.
							- 성별은 남자일 때는 value를 'M'으로 설정하고, 여자일 때는 'G'로 설정해주세요.
							- 전송은 ch05_test_process.jsp 경로로 입력받은 데이터를 전송해주세요.
						 -->
						
						<form class="form-inline" action="ch05_test_process.jsp" target="_blank">
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
								<label for="gender">성별 </label>
								<input type="radio" id="gender" name="gender" value="M" /> 남자&ensp;
								<input type="radio" id="gender" name="gender" value="G" /> 여자 
							</div><br>
							
							<div class="form-group">
								<label for="tel">핸드폰번호 </label>
								<input type="tel" class="form-control" id="tel" name="tel" size=100 placeholder="핸드폰번호를 입력하세요">
  							</div><br>
							<div class="form-group">
								<label for="add">주소 </label>
								<input type="text" class="form-control" id="add" name="add" size=100 placeholder="주소를 입력하세요">
  							</div><br>
							<div class="form-group">
								<label for="introduce">자기소개 </label>
								<textarea class="form-control" id="introduce" name="introduce" rows="4" cols="102" placeholder="자기소개를 입력하세요" ></textarea>
  							</div><br>
  							
  							<br>
							<button type="submit" class="btn btn-primary">전송</button>

						</form>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>