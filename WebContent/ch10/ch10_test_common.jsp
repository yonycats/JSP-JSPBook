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
                        <h1 class="page-title">시큐리티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH10</li>
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
							결과
							권한명 : 통합
							인증방식 : FORM
							사용자명 : all
							사용자의 권한이 'user'과 일치합니까? : true
							사용자의 권한이 'adm'과 일치합니까? : true
							
							[처음으로]
							
							1. 위 결과 화면처럼 만들어주세요.
								> 인증이 완료된 이후, 인증된 사용자의 권한명/인증방식/사용자명/권한 일치 여부를 출력해주세요.
							2. 처음으로 버튼을 클릭 시, ch10_test_logout.jsp로 이동하여 처리해주세요.
						 -->
						 		<div class="row">
										<div class="col-md-3 pt-40" align="center">
												<div class="card" style="width: 500px;">
												
													<div class="card-header">
														<h3>결과</h3>
													</div>
													
													<div class="card-body">
														<table border="1" style="width: 400px; margin-top: 20px;" class="table table-bordered">
															<tr>
																<td>권한명</td>													
																<td>통합</td>													
															</tr>
															<tr>
																<td>인증방식</td>													
																<td><%=request.getAuthType() %></td>
															</tr>
															<tr>
																<td>사용자명</td>													
																<td><%=request.getRemoteUser() %></td>
															</tr>
															<tr>
																<td>사용자의 권한이 'user'와 일치합니까?</td>													
																<td><%=request.isUserInRole("user") %></td>												
															</tr>
															<tr>
																<td>사용자의 권한이 'adm'와 일치합니까?</td>													
																<td><%=request.isUserInRole("adm") %></td>												
															</tr>
														</table>
													</div>
														
													<div class="card-footer">
														<input class="btn btn-danger" type="button" value="처음으로" onclick="location.href='<%=request.getContextPath() %>/ch10/ch10_test_logout.jsp'">
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