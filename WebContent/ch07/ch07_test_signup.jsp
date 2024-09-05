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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
							회원가입 페이지를 작성해주세요.
							아이디 : _____________
							비밓번호 : _____________
							이름 : ______________
							성별 : O 남자 O 여자
							프로필 이미지 : [ 파일선택 ]
							-----------------------
							[ 가입하기 ] [ 뒤로가기 ]
						-->
						
						 <form action="ch07_test_signup_process.jsp"
                    	 	enctype="multipart/form-data" method="post">
							<div>
								<label for="id">아이디 : </label><br>
								<input type="text" id="id" name="id" style="width: 1000px;">
		                   	</div><br>
		                   	
		                   	<div>
								<label for="pass">비밀번호 : </label><br>
								<input type="password" id="pass" name="pass" style="width: 1000px;">
		                   	</div><br>
		                   	
		                   	<div>
								<label for="name">이름 : </label><br>
								<input type="text" id="name" name="name" style="width: 1000px;">
		                   	</div><br>

							<div>
								<span>성별 : </span>
								<input type="radio" id="gender" name="gender" value="남자"> 남자&ensp;
								<input type="radio" id="gender" name="gender" value="여자"> 여자
							</div><br>
							
							<div>
								<p>프로필 이미지</p>
								<input type="file" name="profile" class="form-control">
							</div><br>
		                   	
                    	 	<div>
                    	 		<input class="btn btn-primary" type="submit" value="가입하기">
                    	 		<input class="btn btn-primary" type="button" value="뒤로가기" onclick="location.href='<%=request.getContextPath() %>/ch07/ch07_test_signin.jsp'">
                    	 	</div><br>

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