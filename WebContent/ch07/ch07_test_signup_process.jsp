<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
                    	<!--
							1. 회원가입 처리를 진행해주세요.
								- 회원가입 시, 등록에 필요한 항목 모두를 이용해 가입을 진행해주세요.
								- 프로필 이미지가 있기 때문에 파일 처리도 함께 해주세요.
								- 가입 완료 후, 로그인 페이지로 이동해주세요.
						-->
						
						<%
							request.setCharacterEncoding("UTF-8");
						
							// 파일 업로드 하기
							String realFolder = request.getServletContext().getRealPath("/resources/images");
							String encType = "UTF-8"; // 인코딩 타입
							int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일 크기 (5MB)
	
							File file = new File(realFolder);
								if (!file.exists()) { // 폴더 경로가 존재하지 않다면
									file.mkdirs();	  // 폴더 생성
							}
						
							DiskFileUpload upload = new DiskFileUpload();
							upload.setSizeMax(4 * 1024 * 1024);
							upload.setSizeThreshold(4 * 1024 * 1024);
							upload.setRepositoryPath(realFolder);
						
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							// 일반 데이터와 파일 데이터를 받을 때 사용하는 방법
							String id = "";
							String pass = "";
							String name = "";
							String gender = "";
							String profile = "";
							
							while (params.hasNext()) {
								FileItem item = (FileItem) params.next();
								
								if (item.isFormField()) { // 일반 데이터일 때
									String fieldName = item.getFieldName();
									
									if (fieldName.equals("id")) {
										id = item.getString(encType);
									} else if (fieldName.equals("pass")) {
										pass = item.getString(encType);
									} else if (fieldName.equals("name")) {
										name = item.getString(encType);
									} else if (fieldName.equals("gender")) {
										gender = item.getString(encType);
									} 
								} else { // 파일일 때
									profile = item.getName(); // 파일명
									File saveFile = new File(realFolder + "/" + profile);
									// .write() : 사용자가 업로드한 파일을 지정된 경로에 저장, FileItem 클래스 내장함수, 
									// 파리미터는 File 객체를 넣어야 한다.
									item.write(saveFile); // 파일 복사
								}		
								
							}
							
							MemberDAO dao = MemberDAO.getInstance();
							MemberVO newMember = new MemberVO();
							
							newMember.setMem_id(id);
							newMember.setMem_pw(pass);
							newMember.setMem_name(name);
							newMember.setMem_sex(gender);
							newMember.setFilename(profile);
							
							dao.insertMember(newMember);
						
							response.sendRedirect("ch07_test_signin.jsp");
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