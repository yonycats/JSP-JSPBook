<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- web.xml 내부에 500 에러가 발생했을 때의 경우를 태그로 지정했기 때문에 isErrorPage가 필요없음 -->

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
                        <h1 class="page-title">예외처리</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH11</li>
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
						
						<!-- try-catch를 사용해서 예외 처리하기  -->
						<!-- NumberFormatException : 숫자가 아닌 값이 입력되었을 때의 예외 처리해보기 -->
						<%
							try {
								String num1 = request.getParameter("num1");
								String num2 = request.getParameter("num2");
							
								int a = Integer.parseInt(num1);
								int b = Integer.parseInt(num2);
								
								int c = a / b;
								out.print(num1 + " / " + num2 + " = " + c);
								
							} catch (NumberFormatException e) {
								request.getRequestDispatcher("tryCatch_error.jsp").forward(request, response);
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