<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!-- page의 buffer 속성 -->
<!-- 
	buffer 속성은 현재 JSP 페이지의 출력 버퍼 크기를 설정하는데 사용합니다.
	해당 속성은 none과 buffer size로 설정할 수 있는데, none으로 설정하면 출력 버퍼를 채우지 않고
	웹 브라우저로 직접 보내게 됩니다. 버퍼 크기를 설정하게 되면 출력 버처에 먼저 기록한 후 웹 브라우저로 보냅니다.
	이 때 기본 버퍼 크기는 서브이 고유한 값이지만 일반적으로는 8kb입니다.
 -->
<%@ page buffer="16kb" info="데이트 클래스를 이용한 날짜 출력하기" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 현재 날짜를 출력하도록 표현문 태그를 작성 -->
	<p>Today's <%=new Date() %></p>

</body>
</html>