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
						
						<form action="form04_process.jsp" name="member" method="post">
							아이디 : <input type="text" name="id" id="id"/><br>
							비밀번호 : <input type="text" name="pw" id="pw"/><br>
							이름 : <input type="text" name="name" id="name"/><br>
							연락처 : <select name="phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
								  </select>
								  	<input type="text" name="phone2" id="phone2" maxlength="4" size="4"/>-
									<input type="text" name="phone3" id="phone3" maxlength="4" size="4"/><br>
							성별 : <input type="radio" name="gender" value="M"/> 남자
									<input type="radio" name="gender" value="G"/> 여자<br>
							취미 : <input type="checkbox" name="hobby" id="hobby1" value="독서"/> 독서
									<input type="checkbox" name="hobby" id="hobby2" value="운동"/> 운동
									<input type="checkbox" name="hobby" id="hobby3" value="영화"/> 영화<br>
							가입인사 : <textarea rows="10" cols="50" name="comment" 
										wrap="hard"
										placeholder="가입 인사를 작성해주세요."></textarea><br>
							<input class="btn btn-danger" type="submit" value="전송"/>
							<input class="btn btn-danger" type="reset" value="리셋"/><br>
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