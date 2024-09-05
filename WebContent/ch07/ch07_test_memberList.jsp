<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
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

    <section class="section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
                    <!-- 
                    	1. 회원 목록 페이지를 작성해주세요.
                    	
                    	[ 등록 ]
                    	______________________________
                    	이미지	     회원정보			버튼
                    	______________________________
                    	[ 이	]     아이디 : a001      [상세]
                    	[ 미 ]     이름 : 홍길동
                    	[ 지 ]     
                    	[ 란 ]     
                    	______________________________
                    	[ 이	]     아이디 : a002      [상세]
                    	[ 미 ]     이름 : 홍길순
                    	[ 지 ]     
                    	[ 란 ]     
                    	______________________________
                    	... 
                     -->
							<div class="container">
			                     	<h1>회원목록</h1>
			                     	<hr>
			                     	<div>
			                 	 		<input class="btn btn-primary" type="button" value="회원등록" onclick="location.href='<%=request.getContextPath() %>/ch07/ch07_test_signup.jsp'">
			                 	 	</div><br>
	                     
				                     <%
				                     	MemberVO mv = (MemberVO) request.getSession().getAttribute("mv");
				                     
										MemberDAO dao = MemberDAO.getInstance();
										List<MemberVO> memberList = dao.getMemberList();
									%>
									
									<div class="row">
									<%
										for (int i=0; i<memberList.size(); i++) {
											MemberVO person = memberList.get(i);
											String msg = "";
											
											if (person.getMem_id().equals(mv.getMem_id())) {
												msg = "[본인]&nbsp;";
											}
									%>
											<div class="col-md-3 pt-40" align="center">
													<div class="card">
													
														<div class="card-header">
															<div class="card-title">
																<span style="color: red"><%=msg %> </span><%=person.getMem_name() %>님의 정보
															</div>
														</div>
														
														<div class="card-body">
															<img alt="프로필 사진" src="${pageContext.request.contextPath }/resources/images/<%=person.getFilename()%>" />
													        <p>아이디 : <%=person.getMem_id() %></p>
													        <p>이름 : <%=person.getMem_name() %></p>
														</div>
														
														<div class="card-footer">
															<c:if test="<%=person.getMem_id().equals(mv.getMem_id()) %>">
																<input type="button" value="상세정보" 
																	onclick="location.href='<%=request.getContextPath() %>/ch07/ch07_test_memberDetail.jsp'">
															</c:if>
														</div>
													
													</div>
											</div>
											<%
												}
											%>
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