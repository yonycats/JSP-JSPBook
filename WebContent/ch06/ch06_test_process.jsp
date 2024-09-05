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

<style>
.mainBox {
	border: 1px solid #cecdcd; 
	border-radius: 5px;
	width: 600px;
	box-sizing: content-box;
	display: none;
}
.title {
	background: #f8f8f8; 
	height: 40px;
	line-height: 40px;
	width: 600px;
	padding-left: 20px;
	border-bottom: 1px solid #cecdcd; 
    border-top-right-radius: 5px;
    border-top-left-radius: 5px;
}
.content {
	width: 600px;
	padding-left: 20px;
    margin-top: 20px;
    margin-bottom: 20px;
}
.selectPrint {
    width: 250px;
    height: 30px;
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
						
						<!-- 
			            	넘겨받은 데이터를 활용해 아래의 문제를 해결해주세요.
			            	
			            	----------------------------------------------------------
			            	1. 출력 결과 상단의 type에 따라 아래와 같이 출력해주세요.
			            	
			            	# 사용자인 경우,
			            	[사용자 '홍길동'님, 환영합니다!]
			            	
			            	# 관리자인 경우,
			            	[관리자 '홍길동'님, 환영합니다!]
			            	
			            	----------------------------------------------------------
			            	2. 나머지 항목의 데이터를 출력해주세요.
			            	
			            	# 출력 결과
			            	아이디		:	a001
			            	비밀번호		:	1234
			            	이름			:	홍길동
			            	핸드폰번호		:	010-1234-1234
			            	성별			:	남자
			            	취미			:	운동, 영화, 독서, 클라이밍
			            	가입인사		:	대덕인재개발원 306호 홍길동입니다!
			            					잘부탁드립니다! 열심히 해볼게요!
			            					아자아자아자아자아자아자아자!!!
			            	
			            	----------------------------------------------------------
			            	3. 출력의 형태를 selectbox를 통해 각 선택에 따른 출력으로 만들어주세요.
			            	
			            	# 출력 결과
			            	[	--출력 형태 선택--	]
			            	[	스크립틀릿으로 출력 	]
			            	[		JSTL로 출력 	] 
			            	
			            	각 선택에 따른 출력 형태로 1,2번 문제에 나오는 출력 결과를 출력해주세요! 
			             -->
			             <%
							request.setCharacterEncoding("UTF-8");
						
							String type = request.getParameter("type");
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String name = request.getParameter("name");
							String phone1 = request.getParameter("phone1");
							String phone2 = request.getParameter("phone2");
							String phone3 = request.getParameter("phone3");
							String gender = request.getParameter("gender");
							String introduce = request.getParameter("introduce");
							
							if (gender.equals("male")) {
								gender = "남자";
							} else if (gender.equals("female")) {
								gender = "여자";
							}
							
							String[] hobbys = request.getParameterValues("hobby");
						%>
						
			            <div class="form-group">
				            <select id="selectBox" class="form-control selectPrint" onclick="f_display()">
				            	<option value="0">--출력 형태 선택--</option>
				            	<option value="s">스크립틀릿으로 출력</option>
				            	<option value="j">JSTL로 출력</option>
				            </select>
			            </div>
			            <br><br>
			            
					<!-- 스크립트 태그를 이용한 방법 -->
						<div class="mainBox" id="script">
							<div class="title">스크립트 태그를 이용한 방법</div>
							<div class="content">
								
								<p>
									<%
										if (type.equals("user")) {
											out.print("[ 사용자 '" + name + "'님, 환영합니다! ]");
										} else if (type.equals("admin")) {
											out.print("[ 관리자 '" + name + "'님, 환영합니다! ]");
										}
									%>
								</p>
								<br>
								<p>아이디 : <%=id %></p>
								<p>비밀번호 : <%=pw %></p>
								<p>이름 : <%=name %></p>
								<p>연락처 : <%=phone1 %> - <%=phone2 %> - <%=phone3 %></p>
								<p>성별 : <%=gender %></p>
								<p>취미 : 
									<%
										if (hobbys != null) {
											for (int i=0; i<hobbys.length; i++) {
												out.print(" " + hobbys[i]);
											}
										}
									%>
								</p>

								<p style="white-space: pre-wrap;">가입인사 : <br><%=introduce %></p>
						
							</div>
						</div>
						
					<!-- JSTL로 출력 -->
						<c:set value="user" var="user" />
						<c:set value="admin" var="admin" />
						<c:set value="<%=type %>" var="type"/>
						<c:set value="<%=id %>" var="id"/>
						<c:set value="<%=pw %>" var="pw"/>
						<c:set value="<%=name %>" var="name"/>
						<c:set value="<%=phone1 %>" var="phone1"/>
						<c:set value="<%=phone2 %>" var="phone2"/>
						<c:set value="<%=phone3 %>" var="phone3"/>
						<c:set value="<%=gender %>" var="gender"/>
						<c:set value="<%=hobbys %>" var="hobbys"/>
						<c:set value="<%=introduce %>" var="introduce"/>

						<div class="mainBox" id="jstl">
							<div class="title">JSTL로 출력</div>
							<div class="content">
								
								<p>
									<%
										if (type.equals("user")) {
											out.print("[ 사용자 '" + name + "'님, 환영합니다! ]");
										} else if (type.equals("admin")) {
											out.print("[ 관리자 '" + name + "'님, 환영합니다! ]");
										}
									%>
								</p>
								<br>
								<p>아이디 : ${id }</p>
								<p>비밀번호 : ${pw }</p>
								<p>이름 : ${name }</p>
								<p>연락처 : ${phone1 } - ${phone2 } - ${phone3 }</p>
								<p>성별 : ${gender }</p>
								<p>취미 : 
									<c:if test="${not empty hobbys}">
										<c:forEach items="${hobbys }" var="hobbyItem">
											<c:out value="${hobbyItem }"></c:out>
										</c:forEach>
									</c:if>
								</p>

								<p style="white-space: pre-wrap;">가입인사 : <br>${introduce }</p>
						
							</div>
						</div>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	
<script>
function f_display() {
	let select = document.querySelector("#selectBox");
	let val = select.options[select.selectedIndex].value;
	
	if (val == "s") {
		document.querySelector("#jstl").style.display = "none";
		document.querySelector("#script").style.display = "block";
	} else if (val == "j") {
		document.querySelector("#script").style.display = "none";
		document.querySelector("#jstl").style.display = "block";
	} else if (val == 0) {
		document.querySelector("#jstl").style.display = "none";
		document.querySelector("#script").style.display = "none";
	}
}

</script>
	
</body>
</html>