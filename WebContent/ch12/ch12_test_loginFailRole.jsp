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
                        <h1 class="page-title">필터</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH12</li>
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
							1. 시큐리티 로그인 인증 실패 페이지를 작성해주세요.
							2. 로그인 실패 시, 해당 페이지가 작동합니다.
							     입력한 정보가 맞지 않아 발생하는 문제이므로, '아이디와 비밀번호를 다시 입력해주세요.' 라는 메세지를 출력하기 위해
							   loginSecurity.jsp로 이동하여 메세지를 띄어주세요.
						-->
						<%
							session.invalidate();
						%>
				 		
						<div><h2><strong>입력한 계정 정보가 일치하지 않습니다!</strong></h2></div>
						<br><br>
						<input class="btn btn-primary" type="button" value="ch12_test.jsp 이동" onclick="location.href='<%=request.getContextPath() %>/ch12/ch12_test.jsp'">
						
						 
						 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>