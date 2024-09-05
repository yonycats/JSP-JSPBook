<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 태그 라이브러리 사용하기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	border-collapse: collapse;
}
table td {
	border: 1px solid black; 
	width: 90px;
	height: 30px;
    text-align: center;"
}
</style>

</head>
<body>

	<!-- 
		*** JSTL을 활용하여 아래 문제를 작성해주세요.
		1) 306반 학생 이름 모두를 Core 태그 set에 저장한 후, 전체를 출력해주세요.
		2) 학생 4명씩 끊어서 출력해주세요.
			이름 이름 이름 이름
			이름 이름 이름 이름
			이름 이름 이름 이름
			이름 이름 이름 이름
			.....
			
		3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요.
			> 이 때, 본인 글자를 출력 시 굵은 글씨이면서 녹색으로 출력해주세요.	
	 -->
	<%
		List<String> list = new ArrayList<String>();
		list.add("강성연");
		list.add("김필거");
		list.add("김수연");
		list.add("이영준");
		list.add("이건우");
		
		list.add("이은재");
		list.add("김연희");
		list.add("김예지");
		list.add("박병준");
		list.add("이현수");
		
		list.add("윤다빈");
		list.add("김민강");
		list.add("임효정");
		list.add("정문성");
		list.add("김은태");
		
		list.add("정현영");
		list.add("최동재");
		list.add("나성훈");
		list.add("황현준");
		list.add("김선영");
		
		list.add("권기혁");
		list.add("박범진");
		list.add("박민수");
		list.add("이동형");
		list.add("문형석");
		
		list.add("박현진");
		list.add("김용주");
	%>
	<c:set value="김연희" var="me" />
	<c:set value="<%=list %>" var="students" />
	
	<h3>306호 전체 인원(<%=list.size() %>명)</h3>
	
<div>
	<c:forEach items="${students }" var="student" varStatus="stat">
		<c:choose>
			<c:when test="${stat.first }">
				[${student }, 
			</c:when>
			
			<c:when test="${stat.last }">
				${student }]
			</c:when>
			
			<c:otherwise>
				${student },
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
	
	<br>
	
<table>
	<c:forEach items="${students }" var="student" varStatus="stat">
			<c:if test="${stat.count%4 == 1 }">
				<tr>
			</c:if>
			
			<c:choose>
				<c:when test="${student == me }">
					<td style="color: green"><b>본인</b></td>
				</c:when>
				<c:otherwise>
					<td>${student }</td>
				</c:otherwise>	
			</c:choose>
			
			<c:if test="${stat.last }">
				</tr>
			</c:if>

	</c:forEach>
</table>

</body>
</html>