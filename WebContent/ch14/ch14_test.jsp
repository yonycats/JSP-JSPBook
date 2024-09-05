<%@page import="java.net.URLDecoder"%>
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
                        <li>CH14</li>
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
							# 로그인 페이지를 작성해주세요.
							
							아이디 : ________
							비밀번호 : ________
							[] 아이디 저장
							[로그인]
						
							1. 로그인 페이지를 작성하고, 아이디/비밀번호를 입력 후 로그인을 진행해주세요.
								> 로그인은 작성된 아이디, 비밀번호를 임의로 결정한 후 해당 아이디, 비밀번호가 입력되어 넘어올 때
									로그인 처리로 간주하여 진행해주세요. (admin / 1234)
							2. 아이디 저장을 체크하지 않고 로그인 시, 쿠키를 저장하지 않고 로그인 처리를 진행합니다.
								아이디 저장을 체크하고 로그인 시, 쿠키를 저장하고 로그인 처리를 진행합니다.
								
							***
							[아이디 저장] 체크 후 로그인 처리가 완료된 다음, 해당 로그인 페이지를 다시 요청했을 때
								로그인 당시에 입력했던 아이디가 입력란에 입력되어 있어야 하고, 아이디 저장이 체크되어 있어야 한다.
							[아이디 저장] 체크 해제 후 로그인 진행 후, 해당 페이지를 다시 요청 했을 때
								아이디 입력란이 비어있고 아이디 저장도 체크 해제가 되어 있어야 한다.
						 -->
						 
						 <%
						 	String saveId = "";
						 	boolean isCheck = false;
						 
						 	Cookie[] cookies = request.getCookies();
							 
							if (cookies != null) {
								for (int i=0; i<cookies.length; i++) {
									Cookie thisCookie = cookies[i];
									String n = thisCookie.getName();
									
									if (n.equals("saveId")) {
										saveId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
										isCheck = true;
									}
								}
							}
						 %>
						
						<form action="ch14_test_process.jsp" method="post" class="form-inline">
						 	<div>
								<label for="id" style="width: 90px;">아이디</label>
								<input type="text" id="id" name="id" style="width: 80%;" value="<%=saveId %>">
		                   	</div><br>
		                   	
		                   	<div>
								<label for="pw" style="width: 90px;">비밀번호</label>
								<input type="password" id="pw" name="pw" style="width: 80%;">
		                   	</div><br>
		                   	
							 <p>아이디 저장&emsp;<input type="checkbox" name="checkId" value="on" <%=isCheck ? "checked" : "" %>/></p>		
							 <p><input class="btn btn-primary" type="submit" value="전송" /></p>		
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