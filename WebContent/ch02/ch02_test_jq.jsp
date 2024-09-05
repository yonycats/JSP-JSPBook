<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		[문제] 구구단 1-9단 까지 출력해주세요.
		[옵션]
			- 짝수 단인 경우에는 빨간색으로 출력해주세요.
			- 출력 기준을 2가지(가로로 출력, 세로로출력)를 가진 selectbox를 제공하고 제공된 출력에 따라 결과를 출력
				> 스크립트를 활용
				> 구구단 알고리즘을 스크립트가 아닌 스크립틀릿 안에서만 진행
				> 가로로 출력 / 세로로 출력을 선택할 시 해당 출력방식에 따른 출력 결과가 나타나기
	 -->

	<select>
		<option>--선택--</option>
		<option value="1">가로로 출력</option>
		<option value="2">세로로 출력</option>
	</select>

	<table border="1" id="column" style="display: none;">

		<%for(int i = 1;i<=9;i++){ %>
		<tr>
			<%for(int j = 1;j<=9;j++){ %> 
			<td>
				<%=j+" x "+i+" = "+(i*j) %>
			</td>
			<%} %>
		</tr>
		<%} %>
		
	</table>

	<table border="1" id="row" style="display: none;">

		<%for(int i = 1;i<=9;i++){ %>
		<tr>
			<%for(int j = 1;j<=9;j++){ %> 
			<td>
				<%=i+" x "+j+" = "+(i*j) %>
			</td>
			<%} %>
		</tr>
		<%} %>
		
	</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$("select").change(function(){
    let val = $("select :selected").val();
    
    if(val == 1){
    	$("#column").hide();
    	$("#row").show();
    }
    if(val == 2){
    	$("#column").show();
    	$("#row").hide();
    }
  	$('#row tr:nth-child(even)').css({'color':'red'});
    $('#column td:nth-child(2n)').css({'color':'red'});
});
</script>
</body>
</html>