<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
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
						<!-- 여기에 내용을 입력해주세요 -->
						
						<%
							String path = "C:/upload";
						
							File file = new File(path);
							
							if (!file.exists()) {
								file.mkdirs();
							}
							
							DiskFileUpload upload = new DiskFileUpload();
							// 업로드할 파일의 최대 크기 (byte)
							// 5* 1024 * 1024 -> 5MB
							upload.setSizeMax(5 * 1024 * 1024);
							
							// 메모리 상에 저장할 최대 크기 (byte)
							upload.setSizeThreshold(4 * 1024 * 1024);
							
							// 업로드 된 파일을 임시로 저장할 경로
							upload.setRepositoryPath(path);
							
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							int maxSize = 4 * 1024 * 1024; // 파일 업로드시 최대 사이즈 (4MB)
							
							while (params.hasNext()) {
								FileItem item = (FileItem) params.next();
								
								if (item.isFormField()) { // 폼 페이지에서 전송된 요청 파라미터가 일단 데이터라면
									String name = item.getFieldName(); // 파라미터의 이름
									String value = item.getString("UTF-8"); // 파라미터의 값
									out.print(name + "=" + value + "<br>");									
								} else { // 파일일 때
									String fileFieldName = item.getFieldName(); // 요청 파라미터의 이름
									String fileName = item.getName(); 			// 파일명
									String contentType = item.getContentType(); // 파일의 컨텐츠 유형
									long fileSize = item.getSize();				// 파일 크기
									
									File newFile = new File(path + "/" + fileName);
									
									// Max 사이즈보다 업로드한 파일 크기가 클 때
									if (maxSize < fileSize) {
										out.print("파일 크기를 초과하였습니다! <br>");
									} else {
										item.write(newFile); // 파일 복사
										out.print("---------------------------<br>");
										out.print("요청 파라미터의 이름 : " + fileFieldName + "<br>");
										out.print("저장 파일명 : " + fileName + "<br>");
										out.print("저장 컨텐츠 타입 : " + contentType + "<br>");
										out.print("파일 크기 : " + fileSize + "<br>");
										
									}
									
								}
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