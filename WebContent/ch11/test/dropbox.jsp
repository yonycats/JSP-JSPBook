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
	
<style>
img {
	width: 60%;
	height: 80%;
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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
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
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.

						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────						
						
						자료실
						┌───────────┐	┌───────────┐
						│	파일명		│	│	파일명		│
						├───────────┤	├───────────┤
						│	이미지		│	│	이미지		│
						├───────────┤	├───────────┤
						│ 	다운로드	│	│ 	다운로드	│
						└───────────┘	└───────────┘	...
						[목록]
						
						1. 게시판에서 등록했던 게시글에 포함된 모든 파일들을 자료실에서 목록으로 출력해주세요.
						2. 파일 출력
							> 업로드 된 파일이 이미지 파일인경우, 이미지 썸네일을 [이미지]에 출력해주세요.
							> 이미지 파일이 아닌 일반 파일일경우, 해당 파일의 확장자에 맞는 아이콘으로 [이미지]에 출력해주세요.
						3. 다운로드를 클릭 하면 다운로드가 가능하게 해주세요. 
					 -->
						 <%
						 	BoardRepository dao = BoardRepository.getInstance();
						 	List<BoardVO> bvList = dao.selectBoardList();

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
					 	
					 	<div><h3><strong>자료실</strong></h3>
					 	</div>
					 	
						<hr>
						
						<div class="row">
						 	<c:if test="${empty bvList }">
						 		<div style="margin-left: 10px;">조회 가능한 자료가 없습니다.</div>
						 	</c:if>
						 	<c:if test="${not empty bvList }">
								 <c:forEach items="${bvList }" var="bv">
									    <c:set value="${bv.fileVO }" var="fv"/>
									 	<c:if test="${not empty fv.fileName }">
											 <div class="col-md-2" align="center" style="margin-bottom: 40px;">	
													 <div class="card">
							                            <div class="card-header">
															<c:out value="${fv.fileName }"/>
							                            </div>
							                            
							                            <div class="card-body">
							                            	<c:choose>
																<c:when test="${fv.contentType.startsWith('image/jpeg')}">
																	<img src="${pageContext.request.contextPath }/resources/images/${fv.fileName }">
																</c:when>
																<c:when test="${fv.contentType.startsWith('image/jpg')}">
																	<img src="${pageContext.request.contextPath }/resources/images/${fv.fileName }">
																</c:when>
																<c:when test="${fv.contentType.startsWith('image/png')}">
																	<img src="${pageContext.request.contextPath }/resources/images/${fv.fileName }">
																</c:when>
																<c:when test="${fv.contentType.startsWith('video')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/avi.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/msword')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/doc.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('image/gif')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/gif.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('audio')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/mp3.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/pdf')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/pdf.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/vnd.openxmlformats-officedocument.presentationml.presentation')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/ppt.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/vnd.ms-powerpoint')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/ppt.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('image/vnd.adobe.photoshop')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/psd.jpg">
																</c:when> 
																<c:when test="${fv.contentType.startsWith('text/plain')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/txt.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/xls.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/vnd.ms-excel')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/xls.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/zip')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/zip.jpg">
																</c:when>
																<c:when test="${fv.contentType.startsWith('application/x-zip-compressed')}">
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/zip.jpg">
																</c:when>
																<c:otherwise>
																	<img src="${pageContext.request.contextPath }/assets/fileIcon/etc.jpg">															
																</c:otherwise>
							                            	</c:choose>
							                            </div>
							                            
							                            <div class="card-footer">
															<a href="${pageContext.request.contextPath }/resources/images/${fv.fileName }" download="${fv.fileName }">Download</a>
							                            </div>
							                         </div>
								 	 		</div>
							         	</c:if>
								 </c:forEach>
						 	</c:if>					 	
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