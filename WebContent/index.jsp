<%@page import="kr.or.ddit.vo.IndexVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

	<%
		// IndexRepository 싱글톤 객체를 불러온다.
		IndexRepository dao = IndexRepository.getInstance();
		// Index 페이지에서 사용할 목록 데이터를 가져온다.
		List<IndexVO> indexList = dao.getIndexList();
	%>

	<%@ include file="/pageModule/header.jsp" %>

	<section class="hero-area overlay">
		<div class="container">
            <div class="row">
				<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="hero-text text-center">
						<div class="">
                            <h2 class="wow fadeInUp" data-wow-delay=".3s">대덕인재개발원 JSP</h2>
							<p class="wow fadeInUp" data-wow-delay=".5s">ch01 - ch18장까지 공부하면서 JSP에 대해서 자세하게 알아봅시다</p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>
	
    <!-- Start Items Grid Area -->
    <section class="items-grid section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">INDEX</h2>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row">
            
	            	<%
	            		// 각 챕터별 탭터, 챕터명, 이동 URL, 사용 Source 목록들을 출력하기 위해서 목록 수만큼 반복문 실행
	            		for(int i=0; i<indexList.size(); i++) {
	            			IndexVO index = indexList.get(i);
	            	%>
	            
					<!-- 아래 div 영역을 각 챕터의 영역으로 사용 -->
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".4s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail">
                                	<img src="${pageContext.request.contextPath}/assets/images/items-grid/img5.jpg" alt="#">
                                </a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)">
                                        	<img src="${pageContext.request.contextPath}/assets/images/items-grid/author-5.jpg" alt="#">
                                            <span>DDIT</span></a>
                                    </div>
                                </div>
                                <p class="item-position">
                                	<i class="lni lni-bolt"></i><%=index.getChapter() %>
                                </p>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag"><%=index.getChapter() %></a>
                                    <h3 class="title">
                                        <a href=""><%=index.getTitle() %></a>
                                    </h3>
                                    
                                    <%
	            	            		for(int j=0; j<index.getSourceList().size(); j++) {
	            	            			String sourcePage = index.getSourceList().get(j);
                                    %>
                                    	<p class="update-time"><a href="<%=request.getContextPath()%>/<%=index.getChapter().toLowerCase() %>/<%=sourcePage %>"><%=sourcePage %></a></p>
                                    <%
	            	            		}
                                    %>
                                                                        
                                </div>
                                <div class="bottom-content">
                                    <button class="btn btn-primary"
                                    	onclick="javascript:location.href='<%=index.getChapterMoveUrl() %>'">더보기</button>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
	                <%
	            		}
	            	%>
					<!-- 아래 div 영역을 각 챕터의 영역으로 사용 End -->
                </div>
            </div>
        </div>
    </section>


	<%@ include file="/pageModule/footer.jsp" %>
	
	<%@ include file="/pageModule/footerPart.jsp" %>

</body>

</html>