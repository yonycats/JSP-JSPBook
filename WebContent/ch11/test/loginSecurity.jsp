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
.contentBox {
	background: #ffeaed;
    border: 1px solid pink;
    color: #b9475b;
    width: 1000px;
    height: 50px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    padding-left: 15px;
    margin-bottom: 20px;
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
						<!-- 
							1. 시큐리티 보호자원 이동 시, 인증 페이지를 작성해주세요.
							
							시큐리티 인증
							───────────────────────
							아이디 : ________
							비밀번호 : _________
							[ 로그인  ]
							
							*** loginSecurity.jsp에서 로그인을 요청 시, 타겟 정보가 없기 떄문에 404에러가 발생한다.
							    - 직접 인증을 위한 로그인 페이지에서 바로 요청 시, 타겟 정보가 없으므로 에러가 발생합니다.
							    - 이 점을 참고하여 개발을 진행해주세요.
							
							2. 요청에 따른 처리를 진행해주세요.
							- 보호자원(목적지)으로 접근 시, 설정되어 있는 권한에 따른 계정정보가 다를 경우 '아이디 및 비밀번호가 일치하지 않습니다.'를 출력해주세요.
							  > 출력은 loginSecurity.jsp에서 진행해주세요.
							- 보호자원(목적지)으로 접근 시, 설정되어 있는 권한이 아닌 다른 권한을 가진 계정으로 요청 시 접근 거부 에러가 발생합니다.
							    이때, '접근 거부' 커스텀 페이지로 넘어가 접근 거부 페이지를 출력해주세요. (errorPage.jsp)
							    
							3. '아이디 및 비밀번호가 일치하지 않습니다.' 를 출력 시 참고 화면입니다.
							
							# alert으로 출력해도 됩니다!
							
							# 페이지에서 텍스트로 출력해도 됩니다!
							시큐리티 인증
							───────────────────────
							[아이디 및 비밀번호가 일치하지 않습니다.]
							아이디 : ________
							비밀번호 : _________
							[ 로그인  ]
						 -->
						 <%
						 	String auth = request.getParameter("error");
						 %>
						 
						 <div><h3><strong>시큐리티 인증 (권한을 얻기 위한 인증/인가)</strong></h3>
						 </div>
						 <hr style="width: 1000px;">
						 
						 <c:if test="<%=auth != null %>">
						 	<p class="contentBox">
								아이디와 비밀번호를 다시 입력해주세요.
							</p>
						 </c:if>
						 
						 <form action="j_security_check" method="post" class="form-inline">
						 	<div>
								<label for="id" style="width: 80px;">아이디</label>
								<input type="text" id="id" name="j_username" style="width: 80%;">
		                   	</div><br>
		                   	
		                   	<div>
								<label for="pass" style="width: 80px;">비밀번호</label>
								<input type="password" id="password" name="j_password" style="width: 80%;">
		                   	</div><br>
		                   	
							 <div>
							 	<input class="btn btn-primary" type="submit" value="로그인" />
							 </div>		
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