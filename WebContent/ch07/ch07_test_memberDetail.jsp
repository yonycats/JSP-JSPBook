<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
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
.card {
	width: 250px;
	
}
.card-header {
	height: 35px;
}
.card-title {
	line-height: 25px;
}
.content {
	height: 320px;
}
img {
	width: 200px;
	height: 200px;
    border-radius: 20px;
    margin-top: 10px;
    margin-bottom: 15px;
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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
						<!-- 내용을 입력해주세요 -->
						<!--
							회원 상세보기
							-----------------------------
							목록
							-----------------------------
							
							[ 프로필 이미지 ]
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							성별 : 남자
						-->
					<div class="container">
	                     
		                     	<h1 >회원 상세보기</h1>
		                     	<hr>
		                     	<div>
		                 	 		<input class="btn btn-primary" type="button" value="목록" onclick="location.href='<%=request.getContextPath() %>/ch07/ch07_test_memberList.jsp'">
		                 	 	</div><br>
                     
			                     <%
			                     
									MemberDAO dao = MemberDAO.getInstance();
			                     	MemberVO mv = (MemberVO) request.getSession().getAttribute("mv");
								%>
									<div class="row">
											<div class="col-md-3 pt-40" align="center">
													<div class="card">
													
														<div class="card-header">
															<div class="card-title">
																<span><%=mv.getMem_name() %>님의 정보</span>
															</div>
														</div>
														
														<div class="card-body">
															<p class="image">
																<img alt="" src="${pageContext.request.contextPath }/resources/images/<%=mv.getFilename()%>" style="width: 100%"/>
													        </p>
													        <p>아이디 : <%=mv.getMem_id() %></p>
													        <p>비밀번호 : <%=mv.getMem_pw() %></p>
													        <p>성별 : <%=mv.getMem_sex() %></p>
														</div>
														
														<div class="card-footer">
														</div>
													
													</div>
											</div>
									</div>
									
									
									
									
									
									
						</div>
						
						
						
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>