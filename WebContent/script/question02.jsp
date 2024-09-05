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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
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
                  <div class="table-responsive">
                     <caption>앞(SEM PC 자리)</caption>
                     <table id="table_con" class="table table-bordered" style="text-align:center; font-size:24px;">
                        <tr height="80px">
                           <td width="10%">강성연</td>
                           <td width="10%">김필거</td>
                           <td width="10%">김수연</td>
                           <td width="10%">이영준</td>
                           <td width="20%"></td>
                           <td width="10%">정현영</td>
                           <td width="10%">최동재</td>
                           <td width="10%">나성훈</td>
                           <td width="10%">황현준</td>
                        </tr>
                        <tr height="80px">
                           <td>이건우</td>
                           <td>이은재</td>
                           <td>김연희</td>
                           <td>김예지</td>
                           <td></td>
                           <td>김선영</td>
                           <td>권기혁</td>
                           <td>박범진</td>
                           <td>박민수</td>
                        </tr>
                        <tr height="80px">
                           <td>박병준</td>
                           <td>이현수</td>
                           <td>윤다빈</td>
                           <td>김민강</td>
                           <td></td>
                           <td>이동형</td>
                           <td>박현진</td>
                           <td>김용주</td>
                           <td>문형석</td>
                        </tr>
                        <tr height="80px">
                           <td></td>
                           <td>임효정</td>
                           <td>정문성</td>
                           <td>김은태</td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>
                     </table>
                  </div>
                  <p id="count"></p>
                  <h2 id="process"></h2>
                  <hr/><br/>
                  
                  <button type="button" class="btn btn-primary" id="clickBtn" onclick="f_print()">출력</button>
                  <div id="output"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <%@ include file="/pageModule/footer.jsp" %>

   <%@ include file="/pageModule/footerPart.jsp" %>
   
<script type="text/javascript">
let txt = "";
let txt1 = "님과 ";
let txt2 = "님을 변경합니다!";
let txt3 = "빈 공간은 선택할 수 없습니다!";

let name1 = "";
let name2 = "";
let td1;
let td2;

let mine = "김연희";

$(function(){
	$('td').on("click", function(){
		let name = $(this).text();
		
		if (name != "") {
			if (txt == "") {
				td1 = $(this); // 요소1 담기
				name1 = td1.text(); // 요소1의 이름 담기
				txt += name + txt1; // 문자열에 추가
				
				$('#process').html(txt);
				$(td1).css('background-color', 'yellow');
			} else {
				td2 = $(this); // 요소2 담기
				name2 = td2.text(); // 요소2의 이름 담기
				txt += name + txt2 // 문자열에 추가
				
				$('#process').html(txt);
				$(td1).css('background-color', '');
				
				$(td1).text(name2); 
                $(td2).text(name1);
				txt = "";
			}
		} else {
			$('#process').text(txt3);
		}
	});
});

function f_print() {
		
	if ( $('#output').html() == "" ) {
		$('#table_con').clone().appendTo('#output')
		
		let me = $('#output td:contains("' + mine + '")');
		me.css({'color':'blue', 'font-weight':'600', 'font-size':'30px'});
	} else {
		$('#output').html(''); // 기존 내용을 비움
        $('#table_con').clone().appendTo('#output'); // 새로운 내용을 추가
        
        let me = $('#output td:contains("' + mine + '")');
        me.css({'color':'blue', 'font-weight':'600', 'font-size':'30px'});
	}
}

</script>
   
</body>
</html>