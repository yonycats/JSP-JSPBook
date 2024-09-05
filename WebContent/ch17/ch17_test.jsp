<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                        <li><a href="/">JSTL</a></li>
                        <li>CH17</li>
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
								int studentsCount = 0;	
							
								ArrayList<String> students = new ArrayList<String>();
								students.add("강성연");
								students.add("김필거");
								students.add("김수연");
								students.add("이영준");
								students.add("이건우");
								students.add("이은재");
								students.add("김연희");
								students.add("김예지");
								students.add("박병준");
								students.add("이현수");
								students.add("윤다빈");
								students.add("김민강");
								students.add("임효정");
								students.add("정문성");
								students.add("김은태");
								students.add("정현영");
								students.add("최동재");
								students.add("나성훈");
								students.add("황현준");
								students.add("김선영");
								students.add("권기혁");
								students.add("박범진");
								students.add("박민수");
								students.add("이동형");
								students.add("문형석");
								students.add("박현진");
								students.add("김용주");
								
								Map<String, Integer> firstNames = new HashMap<String, Integer>();
								
							    for (String student : students) {
							        String first = student.substring(0, 1); // 첫 글자(성)를 추출
							        
							        if (firstNames.containsKey(first)) {
							            firstNames.put(first, firstNames.get(first)+1);
							        } else {
							            firstNames.put(first, 1);
							        }
							    }
							    
						        for (String key : firstNames.keySet()) {
						            Integer value = firstNames.get(key);
						            studentsCount += value;
						        }
							%>
							<c:set value="<%=students %>" var="students"/>
							<c:set value="<%=firstNames %>" var="firstNames"/>
							<c:set value="<%=studentsCount %>" var="count"/>
							
							<h3 style="font-weight: 900;"><c:out value="최종집계결과!!"/></h3>
							
							<table class="table table-bordered">
								<tr>
									<c:forEach items="${firstNames }" var="firstName">
										<td>${firstName.key }</td>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach items="${firstNames }" var="firstName">
										<td>${firstName.value }</td>
									</c:forEach>
								</tr>
							</table>
							
							<hr>
							<h4><c:out value="< 전체 학생 >"/></h4>
							<c:forEach items="${students }" var="student">
								<c:out value="${student }"/>
							</c:forEach>
							<hr>
							
							<h4><c:out value="전체 학생 수 : ${count }명"/></h4>
							<c:forEach items="${firstNames }" var="firstName">
								<span style="color: red; font-weight: 900;"><c:out value="'${firstName.key }'씨 "/></span>
								<c:out value="성을 가진 사람 수 : "/>
								<c:out value="${firstName.value }명"/><br>
							</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>