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
                     <table class="table table-bordered table-hover" width="100%">
                        <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>작성일</th>
                           <th>조회수</th>
                        </tr>
                        <tr>
                           <td>10</td>
                           <td>네이버웍스 비정기 업데이트 소식</td>
                           <td>관리자</td>
                           <td>2022-11-16</td>
                           <td>1455</td>
                        </tr>
                        <tr>
                           <td>9</td>
                           <td>네이버웍스 일부 기능의 사양 변경 및 종료 안내</td>
                           <td>관리자</td>
                           <td>2022-11-15</td>
                           <td>234</td>
                        </tr>
                        <tr>
                           <td>8</td>
                           <td>[프로모션 공지] 네이버웍스 X 워크플레이스 결합 서비스 신규 가입 20%추가 할인(~12.31)</td>
                           <td>관리자</td>
                           <td>2022-11-14</td>
                           <td>23444</td>
                        </tr>
                        <tr>
                           <td>7</td>
                           <td>[중요] 네이버웍스 V3.5 정기 업데이트 소식</td>
                           <td>관리자</td>
                           <td>2022-11-13</td>
                           <td>12466</td>
                        </tr>
                        <tr>
                           <td>6</td>
                           <td>[프로모션 사전 공지] 네이버웍스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
                           <td>관리자</td>
                           <td>2022-11-12</td>
                           <td>111</td>
                        </tr>
                        <tr>
                           <td>5</td>
                           <td>드라이브 서비스 DB 업그레이드 작업 사전 안내</td>
                           <td>관리자</td>
                           <td>2022-11-11</td>
                           <td>2233</td>
                        </tr>
                     </table>
                  </div>
                  <hr/><br/>
                  <div class="col-md-12 stretch-card grid-margin">
                     <div class="card">
                        <div class="card-body">
                           <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="chk" value="Y"> 
                              <label class="form-check-label" for="chk">append 여부</label>
                           </div>
                              <h6>선택한 td안에 있는 글자를 아래 P태그에 출력해주세요!</h6>
                           <p id="output" class="text-info">출력란</p>
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
   
<script src="jquery-3.7.1.min.js"></script>
<script type="text/javascript">

let buttons = "<button class='btn btn-warning' id='udtBtn' onclick='fn_mod()'>수정</button>"; // 버튼 만들어주기
    buttons += "<button class='btn btn-warning' id='ok' onclick='fn_ok()'>확인</button>";
   buttons += "<button class='btn btn-danger' id='delBtn' onclick='fn_del()'>삭제</button>";
let button_flag = false;      // 버튼 존재여부 확인 false= 없다
let input_flag = false;         // 입력란 존재여부 확인 
let td;
    
window.onload = function(){
   
   let tds = document.querySelectorAll('td');      // 모든 td 가져오기
   for(let i=0; i<tds.length; i++){            // tds for문
      tds[i].addEventListener("click", function(){   // 클릭이벤트 부여
         td = tds[i];   // td안에 내가 클릭한 td요소를 담는다
         if(document.querySelector('#chk').checked){                  // checked 사용하여 체크여부 / true false
            document.querySelector('#output').innerHTML += ("<br/>"+tds[i].innerText);  // 뒤에 br태그 요소 읽기위해 HTML 사용
            document.querySelector('#udtBtn').style.display="none";      // 다 안보이게
            document.querySelector('#ok').style.display="none";         
            document.querySelector('#delBtn').style.display="none";
         } else {
            document.querySelector('#output').innerText = tds[i].innerText; // output에 td텍스트 값 넣어주기
            
            if(!button_flag){   // 버튼이 없으면                  
               button_flag = true;   // 버튼을 만들어라
               document.querySelector('.card-body').innerHTML += buttons; // 얘를(버튼3개)
            }
               document.querySelector('#udtBtn').style.display="inline";   // inline 가로로 정렬
               document.querySelector('#ok').style.display="none";         // 얘만 안보이게
               document.querySelector('#delBtn').style.display="inline";
         }
      })
   }
}

function fn_mod() {   // 수정하는 함수 생성
   document.querySelector('#udtBtn').style.display="none";   
   document.querySelector('#ok').style.display="inline";      
   if(!input_flag){
      input_flag = true;               
      document.querySelector('#output').innerHTML = `<input type="text" id="input_ok">`;   // 입력란 생성
   }
      input_flag = false;         // 입력란 flag 초기화 (수정하고난 후 다시 입력란이 안나타날때)
}

function fn_ok(){
   td.innerText = document.querySelector('#input_ok').value;            // 입력한 text값 input으로 가져온걸 td에 넣어줌
}

function fn_del(){   // 삭제함수
   td.innerText = "";      
}

</script>
</body>
</html>