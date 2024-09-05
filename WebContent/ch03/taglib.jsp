<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 태그 라이브러리 사용하기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- *** -->
	<h3>변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core 태그 반복문을 작성</h3>
	<c:forEach var="k" begin="1" end="10" step="1">
		<c:out value="${k }"></c:out>
	</c:forEach>

	<h3>변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core 태그 반복문을 작성</h3>
	<p>조건 : 짝수일 때만 출력</p>
	<%-- <c:forEach var="변수" begin="시작값" end="마지막값" step="몇씩 건너뛸 것인지"> --%>
	<c:forEach var="k" begin="1" end="10" step="1">
		<%-- <c:if test="${if 조건식}"> --%>
		<c:if test="${k%2 == 0}">
			<c:out value="${k }"></c:out>
		</c:if>
	</c:forEach>



<!-- *** -->
	<h3>스크립틀릿과 표현문 / JSTL을 통해 str출력 (스크립틀릿으로 선언하기)</h3>
	<%
		String str = "스크립틀릿으로 선언한 개똥이";
	%>
	<%=str %>
	
	<h3>스크립틀릿과 표현문 / JSTL을 통해 str출력 (JSTL의 Core태그 out으로 선언하기)</h3>
	<c:set var="str" value="Core태그로 선언한 개똥이"/>
	<c:out value="${str }"/>
	
	

<!-- *** -->
	<h3>스크립틀릿과 표현문 / JSTL을 통해 Collection 출력 (스크립틀릿으로 선언)</h3>
	<%
		List<String> list = new ArrayList<String>();
		list.add("개똥이");
		list.add("김철수");
		list.add("메뚜기");
	%>
	<%=list %>

	<h3>스크립틀릿과 표현문 / JSTL을 통해 Collection 출력 (JSTL의 Core태그 forEach로 선언)</h3>
	<c:set value="<%=list %>" var="listItem"/>
	<c:forEach items="${listItem }" var="item" varStatus="stat">
		<c:out value="${item } ${stat.index } ${stat.count }"/><br>
		${item } - ${stat.index } - ${stat.count }
	</c:forEach>



<!-- *** -->
<%-- <c:when test=""></c:when> 의 when은 첫줄은 if, 두번째줄 부터는 else if가 된다. --%>
<%-- JAVA의 switch ~ case문으로 볼 수 있습니다.
<c:choose> switch, <c:when>은 case, <c:otherwise>는 default에 해당된다. --%>
	<c:set value="5000" var="money"/>
	<h3>내가 가진 돈은 ${money }원 입니다.</h3>
	<c:choose>
		<c:when test="${money <= 0 }">무일푼</c:when>
		<c:when test="${money >= 5000 and money <= 10000 }">커피 한잔의 여유 가능</c:when>
		<c:otherwise>밥 먹자!</c:otherwise>
	</c:choose>


</body>
</html>