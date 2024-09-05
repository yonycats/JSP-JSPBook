<%@page import="java.util.Enumeration"%>
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
                        <li>CH13</li>
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
						
						<h3>-----------------세션을 삭제하기 전-----------------</h3>
						<%
							String name;
							String value;
							
							// 세션에 저장된 모든 세션 속성명을 가져오도록 session 내장 객체의 getAttributeNames() 메소드를 작성
							// 세션 이름들의 집합을 Enumeration 타입으로 이관 (조력자 도움 구하기)
							Enumeration en = session.getAttributeNames();
							
							int i = 0;
							
							// 조력자를 통해서 sesstion 주머니에 값이 있는지 여부 확인
							while (en.hasMoreElements()) {
								i++;
								name = en.nextElement().toString();				// 세션명 꺼내기
								value = session.getAttribute(name).toString();	// 세션 값 꺼내기
								
								out.print("설정된 세션의 속성 이름 ["+ i + "] : " + name + "<br>");
								out.print("설정된 세션의 속성 값 ["+ i + "] : " + value + "<br>");
							}
							
							session.removeAttribute("userId");
						%>
						
						<h3>-----------------세션을 삭제한 후-----------------</h3>
						<%
							en = session.getAttributeNames();
							
							i = 0;
							
							// 조력자를 통해서 sesstion 주머니에 값이 있는지 여부 확인
							while (en.hasMoreElements()) {
								i++;
								name = en.nextElement().toString();				// 세션명 꺼내기
								value = session.getAttribute(name).toString();	// 세션 값 꺼내기
								
								out.print("설정된 세션의 속성 이름 ["+ i + "] : " + name + "<br>");
								out.print("설정된 세션의 속성 값 ["+ i + "] : " + value + "<br>");
							}
							
							session.removeAttribute("userId");
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