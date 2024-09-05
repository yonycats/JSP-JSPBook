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
							// Commons-Fileupload 를 이용하여 파일을 업로드하려면 먼저 Commons-Fileupload 패키지에 포함되어
							// 있는 DiskFileUpload 객체를 생성합니다. 생성됨 객체를 통해 DiskFileUpload 클래스가 제공하는
							// 메소드를 사용하여 웹 브라우저가 전송한 Multipart/form-data 유형의 요청 파라미터를 가져온다.
							// 그리고 FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지 파일인지 분석 및 처리하여
							// 파일을 업로드한다.
						
							// 폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성함
							String fileuploadPath = "C:/upload";
							
							File tempFile = new File(fileuploadPath);
						
							if (!tempFile.exists()) { // C드라이브 내, upload 폴더가 존재하지 않을 때
								tempFile.mkdirs(); // 해당 위치에 폴더를 생성
							}
							
							// Commons-Fileupload 를 이용하여 파일을 업로드 하려면 먼저 Commons-Fileupload에서
							// 제공하는 DiskFileUpload를 선언한다.
							DiskFileUpload upload = new DiskFileUpload();
							
							// 생성된 객체를 통해 DiskFileUpload 클래스가 제공하는 메소드를 사용하려 웹 브라우저가 잔송한 
							// 요청 파라미터를 가져옴
							// 폼 페이지에서 전송된 요청 파라미터를 전달받고록 DiskFileUpload 객체 타입의 parseRequest()
							// 메소드를 작성
							List items = upload.parseRequest(request);
							
							// 폼 페이지에서 전송된 요청 파라미너를 Iterator 클래스로 변환
							Iterator params = items.iterator();
							
							// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator rorcp xkdlqdml
							// hasNext() 메소드를 작성
							while (params.hasNext()) {
								FileItem fileItem = (FileItem) params.next();
								// FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지 파일인지 분석 및 처리하여
								// 파일을 업로드 할 준비를 함
								if (!fileItem.isFormField()) { // 일반 데이터가 아닌 파일 데이터라면
									String fileName = fileItem.getName(); // 파일명
									%>
										<p><%=fileName %>이 저장되었습니다!</p>
									<%
									File file = new File(fileuploadPath + "/" + fileName);
									fileItem.write(file); // 파일 복사
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