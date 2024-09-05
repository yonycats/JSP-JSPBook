<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<body>
	<div class="row">
		<div class="container">
		<!-- 
			[문제] 구구단 1-9단까지 출력해주세요.
			[옵션] 
				- 짝수 단인 경우에는 빨간색으로 출력해주세요.
				- 출력 기준을 2가지(가로로출력, 세로로출력)를 가진 selectbox를 제공하고 제공된 출력에 따라 결과를 출력해주세요.
					> 스크립트를 활용해주세요.
					> 구구단 알고리즘은 스크립트가 아닌 스크립틀릿안에서만 진행해주세요.
					> 가로로출력/ 세로로출력을 선택할 시, 해당 출력 방식에 따른 출력 결과가 나타날 수 있도록 해주세요.
					
				- 스크립트는 자바스크립트/제이쿼리 본인이 편한 방식으로 진행!
		 -->
		 <select id="orderSelect" class="form-control">
		 	<option value="">-출력선택-</option>
		 	<option value="1">가로로출력</option>
		 	<option value="2">세로로출력</option>
		 </select>
		 <div id="t1">
		 	<br/>
		 	<%
		 		String color = "";
		 		out.println("<table class='table table-bordered' width='100%'>");
		 		for(int i = 1; i < 10; i++){
		 			out.println("<tr aligh='center'>");
			 		for(int j = 1; j < 10; j++){
			 			if(i % 2 == 0){	
			 				color = "red";
			 			}else{
			 				color = "black";
			 			}
			 			out.println("<td><font color='"+color+"'>" + i + " x " + j + " = " + (i*j) + "</font></td>");
			 		}
			 		out.println("</tr>");
		 		}
		 		out.println("</table>");
		 	%>
		 </div>
		 <br/>
		 <div id="t2">
		 	<br/>
		 	<%
		 		out.println("<table class='table table-bordered' width='100%'>");
		 		for(int i = 1; i < 10; i++){
		 			out.println("<tr aligh='center'>");
			 		for(int j = 1; j < 10; j++){
			 			if(j % 2 == 0){	
			 				color = "red";
			 			}else{
			 				color = "black";
			 			}
			 			out.println("<td><font color='"+color+"'>" + j + " x " + i + " = " + (i*j) + "</font></td>");
			 		}
			 		out.println("</tr>");
		 		}
		 		out.println("</table>");
		 	%>
		 </div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	var orderSelect = $("#orderSelect");
	
	$("#t1").hide();
	$("#t2").hide();
	
	orderSelect.on("change", function(){
		var value = $(this).val();
		
// 		$("#t1").css("transform", "scale(1)");
// 		$("#t2").css("transform", "scale(1)");
		
		if(value == "1"){	// 가로
			$("#t1").show();
// 			$("#t1").css("transform", "scale(1.05)").css("transition", ".8s");
			$("#t2").hide();
		}else{	// 세로
			$("#t2").show();
// 			$("#t2").css("transform", "scale(1.05)").css("transition", ".8s");
			$("#t1").hide();
		}
	});
});
</script>
</html>
