<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page errorPage="exceptionBoard_error.jsp" %>

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
						1. 게시글 수정을 처리해주세요.
							> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
							
						2. 게시글 수정 시, 등록과 같은 옵션 정보를 처리해주세요.
							> 등록과  옵션 정보 동일
					 -->
					 
					 <%
					 	request.setCharacterEncoding("UTF-8");
					 	BoardRepository dao = BoardRepository.getInstance();
					 
					 	String realFolder = request.getServletContext().getRealPath("/resources/images");
					 	String encType = "UTF-8";
					 	int maxSize = 2 * 1024 * 1024;
					 
						File file = new File(realFolder);
						if (!file.exists()) { // 폴더 경로가 존재하지 않다면
							file.mkdirs();	  // 폴더 생성
						}
					 
						DiskFileUpload upload = new DiskFileUpload();
						upload.setSizeMax(2 * 1024 * 1024);
						upload.setSizeThreshold(2 * 1024 * 1024);
						upload.setRepositoryPath(realFolder);
					 
						// request 객체를 분석하여 클라이언트가 서버로 전송한 파일과 기타 폼 데이터를 추출
						List items = upload.parseRequest(request);
						Iterator params = items.iterator();
						
						// 일반 데이터와 파일 데이터를 받을 때 사용하는 방법
						int no = 0;
						String title = "";
						String content = "";
						String writer = request.getRemoteUser();
						String regDate = dao.getCurrentTime();
						
						String contentType = "";
						long fileSize = 0;
						String fileName = "";

					 	// params이 비어있지 않다면
						while (params.hasNext()) {
							// item에 개별 객체를 담음
							FileItem item = (FileItem) params.next();
							
							if (item.isFormField()) { // 일반 데이터일 때
								// getFieldName -> form의 name 속성 이름
								String fieldName = item.getFieldName();
								
								if (fieldName.equals("no")) {
									no = Integer.valueOf( item.getString(encType) );
								} else if (fieldName.equals("title")) {
									title = item.getString(encType);
								} else if (fieldName.equals("content")) {
									content = item.getString(encType);
								}
							} else { // 파일일 때
								fileName = item.getName(); // 파일 이름 가져오기
								
								if ( !(item.getName().equals("")) ) {								
									File saveFile = new File(realFolder + "/" + fileName);
									item.write(saveFile); // 파일을 복사해서 저장함
									contentType = item.getContentType(); // 파일의 컨텐츠 타입 가져오기
									fileSize = item.getSize(); // 파일의 크기 가져오기
								}
							}		
						}
					 	
					 	BoardVO bv = dao.getBoardById(no);
					 	BoardFileVO bfv = bv.getFileVO();
					 	
					 	if (fileName.equals("")) {
					 	} else {
						 	bfv.setContentType(contentType);
						 	bfv.setFileSize(fileSize);
						 	bfv.setFileName(fileName);

						 	bv.setFileVO(bfv);
					 	}
					 	
					 	bv.setTitle(title);
					 	bv.setContent(content);
					 	bv.setRegDate(regDate);
					 	
					 	response.sendRedirect("boardView.jsp?no=" + no);
					 
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