<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	border-collapse: collapse;
}
table td{
	border: 1px solid black;
}

.gugudan {
	display: none;
}

/* #가로 tr:nth-of-type(2n){ */
/* #가로 tr:nth-child(even){ */
#가로 tr:nth-child(2n){
	color : red;
}

/* #세로 td:nth-of-type(2n){ */
/* #세로 td:nth-child(even){ */
#세로 td:nth-child(2n){
	color : red;
}
</style>

</head>
<body>
	<!-- 
		[문제] 구구단 1-9단까지 출력해주세요.
		[옵션]
			- 짝수 단인 경우에는 빨간색으로 출력해주세요.
			- 출력 기준을 2가지 (가로로 출력, 세로로 출력)을 가진 selectbox를 제공하고 제공된 출력에 따라 결과를 출력해주세요.
				> 스크립트를 활용해주세요.
				> 구구단 알고리즘은 스크립트가 아닌 스크립틀릿 안에서만 진행해주세요.
				> 가로로 출력 /세로로 출력을 선택할 시, 해당 출력 방식에 따른 출력 결과가 나타날 수 있도록 해주세요.
				
			- 스크립트는 자바스크립트/제이쿼리 본인이 편한 방식으로 진행~
	 -->
 <select id="selectBox" onchange="gugudan()">
 	<option value="0">- 출력선택 -</option>
 	<option value="가로">가로로 출력</option>
 	<option value="세로">세로로 출력</option>
 </select>
 

<table id="가로" class="gugudan">
 <%
	 	for (int i=1; i<=9; i++) {
	 		out.print("<tr>");
 		for (int j=1; j<=9; j++) {	 
 			out.print("<td>" + i + "x" + j + "=" + (j*i) + "</td>");
 		}
 		out.print("</tr>");
 	}
 %>
</table>

<table id="세로" class="gugudan">
 <%
	 	for (int i=1; i<=9; i++) {
	 		out.print("<tr>");
 		for (int j=1; j<=9; j++) {	 
 			out.print("<td>" + j + "x" + i + "=" + (j*i) + "</td>");
 		}
 		out.print("</tr>");
 	}
 %>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 자바 스크립트로 해보기 -->
<script>
function gugudan() {
	let select = document.querySelector("#selectBox");
	let val = select.options[select.selectedIndex].value;
	
	console.log("바닐라 >> ", val);
	
	if (val == "가로") {
// 		console.log("가로임");
		document.querySelector("#세로").style.display = "none";
		document.querySelector("#가로").style.display = "block";
	} else if (val == "세로") {
// 		console.log("세로임");
		document.querySelector("#가로").style.display = "none";
		document.querySelector("#세로").style.display = "block";
	} else if (val == 0) {
// 		console.log("세로임");
		document.querySelector("#가로").style.display = "none";
		document.querySelector("#세로").style.display = "none";
	}
}



/* 제이쿼리로 해보기 */
/* $('#selectBox').change(function() {
	let val = $(this).val();
//	console.log("제이쿼리 >> ", val);
	
	if (val == "가로") {
		$('#세로').hide();
		$('#가로').show();
	} else if (val == "세로") {
		$('#가로').hide();
		$('#세로').show();
	} else if (val == 0) {
		$('#가로').hide();
		$('#세로').hide();
	}
	
}); */

</script>

 
</body>
</html>