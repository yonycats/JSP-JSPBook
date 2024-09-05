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
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
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
							ch05_test_process.jsp에서 전송받은 모든 데이터를  taglib를 이용하여 출력해주세요.
							
							[출력예시]
							아이디 : a001 (입력받음)
							비밀번호 : 1234 (입력받음)
							이름 : 홍길동 (입력받음)
							성별 : 남자 (입력X, 선택(radio))
							핸드폰번호 : 010-1234-5678 (입력받음)
							주소 : 대전광역시 중구 오류동 123 (입력받음)
							자기소개 : 아자아자! 화이티잉!!! (입력받음)
							
							그리고 5초 뒤에 www.naver.com 홈페이지로 이동시켜주세요.
						 -->
						 <%
							String userId = request.getParameter("id");
							String userPw = request.getParameter("pw");
							String userName = request.getParameter("name");
							String userGender = request.getParameter("gender");
							String userTel = request.getParameter("tel");
							String userAdd = request.getParameter("add");
							String userIntroduce = request.getParameter("introduce");						 
						 %>
						 <c:set value="<%=userId %>" var="id"/>
						 <c:set value="<%=userPw %>" var="pw"/>
						 <c:set value="<%=userName %>" var="name"/>
						 <c:set value="<%=userGender %>" var="gender"/>
						 <c:set value="<%=userTel %>" var="tel"/>
						 <c:set value="<%=userAdd %>" var="add"/>
						 <c:set value="<%=userIntroduce %>" var="introduce"/>
						 
						 
						 아이디 : <c:out value="${id }"></c:out><br>
						 비밀번호 : <c:out value="${pw }"></c:out><br>
						 이름 : <c:out value="${name }"></c:out><br>
						 성별 : 
						 <c:if test="${gender eq 'M' }">
							 <c:out value="남"></c:out><br>						 	
						 </c:if>
						 <c:if test="${gender eq 'G' }">
							 <c:out value="여"></c:out><br>						 	
						 </c:if>
						 <c:if test="${!(gender eq 'G') && !(gender eq 'M') }">
							 <br>				 	
						 </c:if>
						 핸드폰번호 : <c:out value="${tel }"></c:out><br>
						 주소 : <c:out value="${add }"></c:out><br>
						 자기소개 : <c:out value="${introduce }"></c:out><br>
						<br>
						<c:out value="5초 뒤에 이동합니다!"></c:out>
						
						<%
						 response.setHeader("Refresh","5; URL=http://www.naver.com"); 						
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