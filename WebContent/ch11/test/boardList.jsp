<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">ch11_test</h1>
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
					<!-- 
						# 게시판 목록 페이지를 작성해주세요.
						
						<데이터가 존재하지 않을 때>
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
						
						번호				제목						작성자		작성일			조회수
						─────────────────────────────────────────────────────────────────────────────
											조회하실 게시글이 존재하지 않습니다.
						─────────────────────────────────────────────────────────────────────────────						
						[ 게시글 등록하기  ]
						
						<데이터가 존재할 때>
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
						
						번호				제목						작성자		작성일			조회수
						─────────────────────────────────────────────────────────────────────────────
						10		게시판 제목입니다......! 1			허나훔		2022-12-12		1245
						9		게시판 제목입니다......! 2			송서영		2022-12-12		1245
						8		게시판 제목입니다......! 3			채진영		2022-12-12		1245
						7		게시판 제목입니다......! 4			배영호		2022-12-12		1245
						6		게시판 제목입니다......! 5			조은혁		2022-12-12		1245
						5		게시판 제목입니다......! 6			조현수		2022-12-12		1245
							.....
						─────────────────────────────────────────────────────────────────────────────
						[ 게시글 등록하기  ]
						
						1. 게시판 목록을 출력해주세요.
							> JSTL을 활용해주세요.
							> 초기 화면에서는 데이터가 없으므로 '조회하실 게시글이 존재하지 않습니다.'를 출력해주세요.
							> 데이터가 있는 경우엔 번호, 제목, 작성자, 작성일, 조회수를 맞춰서 데이터를 출력해주세요.
									
						2. 시큐리티 적용
							> 게시판 등록 페이지를 요청 시, 시큐리티 인증을 진행해주세요.
								- 시큐리티 인증방식 : FORM 
							> 등록 페이지는 역할명 admin만 접근 가능토록 해주세요.
								- id : admin
								- pw : a1234
							> 로그인 인증 시, loginSecurity.jsp로 이동하여 인증을 진행 할 수 있도록 해주세요.
							> 로그인 인증 실패 시, loginFailed.jsp로 이동할 수 있도록 해주세요.
							> 로그인 권한이 다를 때, errorPage.jsp로 이동할 수 있도록 해주세요. 
								  
						3. 게시글 클릭 시, 해당 게시글 상세보기 페이지로 이동합니다.
							> 상세보기 페이지로 이동할 때, 조회수가 상승합니다.
							
						4. 게시글 등록하기 클릭 시, 게시글 등록 페이지로 이동합니다.
						
						5. 인증된 회원 admin으로 로그인 시, [로그아웃] 버튼이 메뉴박스에 표시되고
						인증되지 않은(로그인 전) 상태인경우 [로그아웃] 버튼이 나타나지 않도록 설정해주세요
						
						<권한 인증 후>
						메뉴박스
						[게시판][자료실][로그아웃]
						─────────────────────────────────────────────────────────────────────────────
						
						<권한 인증 전>
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
					 -->
					 
						 <%
						 	BoardRepository dao = BoardRepository.getInstance();
						 	List<BoardVO> bvList = dao.selectBoardList() == null ? null : dao.selectBoardList();
						 	
						 	boolean role = request.isUserInRole("admin");
						 %>
						 <c:set value="<%=bvList %>" var="bvList"/>
						 <c:set value="<%=role %>" var="role" />
						 
						 	<div><h4><strong>메뉴 박스</strong></h4>
						 	</div>
						 	
							<hr>
							<div>
								<input class="btn btn-primary" type="button" value="게시판" onclick="location.href='<%=request.getContextPath() %>/ch11/test/boardList.jsp'">
								<input class="btn btn-danger" type="button" value="자료실" onclick="location.href='<%=request.getContextPath() %>/ch11/test/dropbox.jsp'">
								
								<c:if test="${role }">
									<input class="btn btn-warning" type="button" value="로그아웃" onclick="location.href='<%=request.getContextPath() %>/ch11/test/logout.jsp'">
								</c:if>
							</div>						
						 	<hr>
						 	
					 		<table class="table table-bordered">
					 			<tr>
						 			<th width="8%">번호</th>
						 			<th width="58%">제목</th>
						 			<th width="12%">작성자</th>
						 			<th width="14%">작성일</th>
						 			<th width="8%">조회수</th>					 		
					 			</tr>
					 			
				 				<c:if test="${empty bvList }">
						 			<tr>
						 				<td colspan="5">
						 					<c:out value="조회하실 게시글이 존재하지 않습니다." />
						 				</td>
						 			</tr>
				 				</c:if>
				 				<c:if test="${not empty bvList }">
						 			<c:forEach items="${bvList }" var="bv" varStatus="stat">
				 						<tr>
											<td>
												<c:out value="${bv.no }" />
											</td>		 						
											<td>
												<a href="<%=request.getContextPath() %>/ch11/test/boardView.jsp?no=${bv.no }"><c:out value="${bv.title }" /></a>
											</td>		 						
											<td>
												<c:out value="${bv.writer }" />
											</td>		 						
											<td>
												<c:out value="${bv.regDate }" />
											</td>		 						
											<td>
												<c:out value="${bv.hit }" />
											</td>		 						
				 						</tr>
						 			</c:forEach>
				 				</c:if>
					 		</table>
						 
					 		<div>
								<input class="btn btn-primary" type="button" value="등록" onclick="location.href='${pageContext.request.contextPath }/ch11/test/boardForm.jsp'">
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