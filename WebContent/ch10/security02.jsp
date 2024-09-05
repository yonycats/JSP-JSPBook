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
                        <h1 class="page-title">시큐리티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH10</li>
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
						
						<!-- 인증된 사용자를 가져오도록 request 내장 객체의 getRemoteUSer() 함수 사용 -->
						<!-- getRemoteUser : 사용자가 인증된 경우 요청을 한 사용자의 로그인 정보(ID)를 리턴함 -->
						<p>사용자명 : <%=request.getRemoteUser() %></p>
						<!-- 인증 처리 방식을 가져오도록 request 내장 객체의 getAuthType() 함수 사용 -->
						<!-- GetAuthType : 클라이언트 인증 중에 사용되는 HTTP 인증 체계를 검색함(BASIC, FORM 등) -->
						<p>인증방법 : <%=request.getAuthType() %></p>
						
						<!-- 
							로그인시 인증한 사용자의 역할 이름이 tomcat인지, role1인지 확인하도록
							request 내장 객체의 isUserInRole() 함수 사용
						 -->
						 <!-- isUserInRole : 현재 로그온한 사용자가 지정된 역할에 속하는지 여부를 나타내는 값(tomcat-users.xml에서의 roles)을 가져옴 -->
						<p>
							인증한 사용자명이 역할명 'tomcat'에 속하는 사용자인가요?<br>
							<%=request.isUserInRole("tomcat") %>
						</p>	
						<p>
							인증한 사용자명이 역할명 'role1'에 속하는 사용자인가요?<br>
							<%=request.isUserInRole("role1") %>
						</p>	
						<!-- request.getRemoteUser()에는 시큐리티 권한을 가진 유저의 id가 있는 것이고
							 request.getUserPrincipal().getName()은 똑같이 유저의 정보가 들어 있지만
							 인증받은 유저의 정보가 principal 객체에 저장되기 때문에, 인증을 받은 유저의 정보를 출력하고 있다. -->
						<%
							out.print("principal 객체 저장된 정보 : " + request.getUserPrincipal().getName());
						%>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>