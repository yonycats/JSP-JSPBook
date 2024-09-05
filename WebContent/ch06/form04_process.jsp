<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
						
						<%
							request.setCharacterEncoding("UTF-8");
						
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String name = request.getParameter("name");
							String phone1 = request.getParameter("phone1");
							String phone2 = request.getParameter("phone2");
							String phone3 = request.getParameter("phone3");
							String gender = request.getParameter("gender");
							String[] hobby = request.getParameterValues("hobby");
							
							String comment = request.getParameter("comment");
						%>
						
						<p>아이디 : <%=id %></p>
						<p>비밀번호 : <%=pw %></p>
						<p>이름 : <%=name %></p>
						<p>연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
						<p>성별 : <%=gender %></p>
						<p>취미 : 
							<%
								if (hobby != null) {
									for (int i=0; i<hobby.length; i++) {
										out.print(" " + hobby[i]);
									}
								}
							%>
						</p>
						<!-- 
							브라우저 스펙에 따라서 wrap="hard" 속성에 따른 출력이 제대로 사용되지 않을 수 있다.
							그래서  CSS를 설정해준다. (white-space: pre-wrap;)
						 -->
						<p style="white-space: pre-wrap;">가입인사 : <c:out value="<%=comment %>"/></p>
						
						<!-- style="white-space: pre-wrap;" => textarea, 텍스트 에어리어에서 엔터를 쳤을 때, 그 엔터도 반영이 됨 -->
                    
                    	<!-- 
                    		textarea wrap 속성
                    		wrap = "off" : 줄바꿈 안함
                    		wrap = "soft" : 자동 줄바꿈
                    		wrap = "hard" : 자동 줄바꿈, 서버 전송 시 캐리지 리턴(엔터문자) 문자를 전달함
                    		
                    		해당 속성은 html5에서 새롭게 추가된 기능,
                    		wrap = "hard" 속성을 사용 시, cols 속성이 꼭 명시되어 있어야 한다.
                    		
                    		wrap 속성의 값을 soft, hard로 설정 시, textarea 설정 크기 안에서 Enter를 치지 않고 텍스트를 입력해 나갈 때
                    		textarea 가로 길이 오른쪽 맨 끝에 다다를 때 자동으로 아래줄로 넘어가 작성이 되는데 이때, Enter를 직접 치지는
                    		않았지만 아래줄로 내려가 작성된다.
                    		
                    		이 때, hard는 개행문자가 포함된 데이터가 전송된다.
                    		(개행문자인 '\n\r'이 데이터상에 보여지지는 않지만, 데이터를 확인해보면 Enter가 쳐진 상태의 데이터를 
                    		  확인할 수 있다.)
                    	 -->
                    
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>