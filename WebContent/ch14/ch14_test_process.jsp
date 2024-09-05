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
						
							<%
								request.setCharacterEncoding("UTF-8");
							
								String id = request.getParameter("id");
								String pw = request.getParameter("pw");
								String checkId = request.getParameter("checkId") == null ? null : request.getParameter("checkId");
							
								// 전송된 아이디와 비밀번호가 각각 admin/1234와 일치하면 쿠키를 생성한다.
								if (id.equals("admin") && pw.equals("1234")) {
									Cookie saveId = new Cookie("saveId", id);
									
									if (checkId != null) {
										saveId.setMaxAge(60 * 60 * 24 * 10); // 체크박스 O -> 10일로 세팅
									} else {
										saveId.setMaxAge(0); // 체크박스 X -> 0초로 세팅
									}
									response.addCookie(saveId);
									response.sendRedirect("ch14_test_loginSuccess.jsp");
									
								} else {
									response.sendRedirect("ch14_test_loginFailed.jsp");
								}
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