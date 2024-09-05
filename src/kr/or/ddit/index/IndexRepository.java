package kr.or.ddit.index;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.IndexVO;

public class IndexRepository {
	private List<IndexVO> indexList = new ArrayList<IndexVO>();
	
	// 싱글톤
	private static IndexRepository instance = null;
	public static IndexRepository getInstance() {
		if (instance == null) {
			instance = new IndexRepository();
		}
		return instance;
	}
	
	// InMemory 내, 챕터, 제목, 챕터별 URL, 챕터별 소스 페이지 정보를 담기 위한 준비
	private IndexRepository() {
		// 챕터 설정
		String[] chapters = {
				"CH01", "CH02", "CH03", "CH04", "CH05", "CH06", "CH07", 
				"CH08", "CH10", "CH11", "CH12", "CH13", "CH14", "CH17"
		};
		
		// 제목 설정
		String[] titles = {
				"CH01. JSP 개요", "CH02. 스크립트 태그", "CH03. 디렉티브 태그", "CH04. 액션 태그", 
				"CH05. 내장 객체", "CH06. 폼 태그", "CH07. 파일 업로드", "CH08. 유효성 검사", 
				"CH10. 시큐리티", "CH11. 예외처리", "CH12. 필터", "CH13. 세션", "CH14. 쿠키",
				"CH17. 태그 라이브러리" 
		};
		
		// 챕터별 URL 설정
		String[] chapterMoveUrl = {
				"/welcome.jsp", "/ch02/scriptlet01.jsp", "/ch03/page_import.jsp", 
				"/ch04/ch04Info.jsp", "/ch05/request01.jsp", "", 
				"/ch06/form01.jsp", "", "", 
				"", "", "",
				"", ""
		};
		
		// 각 챕터별 소스페이지 설정
		String[][] sourceArr = {
				{
					"welcome.jsp"
				}, 	// ch01
				{
					"declaration01.jsp", "declaration02.jsp", "declaration03.jsp", 
					"expression01.jsp", "expression02.jsp", 
					"scriptlet01.jsp", "scriptlet02.jsp",
					"ch02_test_mine.jsp", "ch02_test_jq.jsp", "ch02_test_sem.jsp"
				}, 	// ch02
				{
					"page_buffer.jsp", "page_import.jsp", 
					"page_errorPage.jsp", "page_errorPage_error.jsp", "page_isErrorPage.jsp", "page_isErrorPage_error.jsp", 
					"include01.jsp", "include01_header.jsp", "include02.jsp", "include02_header.jsp", "include02_footer.jsp", 
					"taglib.jsp", 
					"ch03_test_if.jsp", "ch03_test_when.jsp"
				}, 	// ch03
				{
					"ch04Info.jsp"
				}, 	// ch04
				{
					"request01.jsp", "request01_process.jsp", "request02.jsp", "request03.jsp",
					"response01_process.jsp", "response01_success.jsp", "response01_failed.jsp",
					"response01.jsp", "response02.jsp", "response03.jsp", 
					"out.jsp", "ch05_test.jsp", "ch05_test_process.jsp"
				}, 	// ch05
				{
					"form01.jsp", "form02.jsp", "form03.jsp", "form03_process.jsp",
					"form04.jsp", "form04_process.jsp", "form05.jsp", "form05_process.jsp",
					"ch06_test.jsp", "ch06_test_process.jsp"
				}, 	// ch06
				{
					"fileupload01.jsp", "fileupload01_process.jsp", "fileupload02.jsp", "fileupload02_process.jsp",
					"ch07_test_signin.jsp", "ch07_test_signin_process.jsp", "ch07_test_signup.jsp", "ch07_test_signup_process.jsp",
					"ch07_test_memberList.jsp", "ch07_test_memberDetail.jsp"
				}, 	// ch07
				{
					"validation.jsp", "validation01.jsp", 
					"validation02.jsp", "validation02_process.jsp", 
					"validation03.jsp", "validation03_process.jsp",
					"ch08_test_exam.jsp"
				}, 	// ch08
				{
					"security01.jsp", "security02.jsp", "login.jsp", "login_failed.jsp",
					"ch10_test.jsp", "ch10_test_user.jsp", "ch10_test_process.jsp", "ch10_test_logout.jsp",
					"ch10_test_failed.jsp", "ch10_test_common.jsp", "ch10_test_authForm.jsp", "ch10_test_admin.jsp"
				}, 	// ch10
				{
					"boardList.jsp", "boardView.jsp", "boardForm.jsp", "boardInsert.jsp", 
					"boardUpdateForm.jsp", "boardUpdate.jsp", "boardRemove.jsp", "dropbox.jsp",
					"errorPage.jsp", "exceptionBoard_error.jsp",
					"loginFailed.jsp", "loginSecurity.jsp", "logout.jsp",
					"-------------------------------------", 
					"errorCode.jsp", "errorCode_error.jsp", "errorCode_process.jsp", 
					"errorPage.jsp", "errorPage_error.jsp", 
					"exception.jsp", "exception_process.jsp", "exception_error.jsp",
					"exceptionType.jsp", "exceptionType_process.jsp", "exceptionType_error.jsp",
					"isErrorPage.jsp", "isErrorPage_error.jsp",
					"tryCatch.jsp", "tryCatch_process.jsp", "tryCatch_error.jsp",
					"login.jsp"
				}, 	// ch11
				{
					"filter01.jsp", "filter01_process.jsp", "filter02.jsp", "filter02_process.jsp",
					"ch12_test.jsp", "ch12_test_loginSecurity.jsp", 
					"ch12_test_loginFailed.jsp", "ch12_test_loginFailRole.jsp"
				}, 	// ch12
				{
					"session01_process.jsp", 
					"session01.jsp", "session02.jsp", "session03.jsp",
					"session04.jsp", "session05.jsp", "session06.jsp", 
					"session07.jsp", "session08.jsp",
					"ch13_test.jsp", "ch13_test_exit.jsp"
				}, 	// ch13
				{
					"cookie01.jsp", "cookie01_process.jsp", "cookie02.jsp", "cookie03.jsp",
					"ch14_test.jsp", "ch14_test_process.jsp", "ch14_test_loginSuccess.jsp", "ch14_test_loginFailed.jsp"
				}, 	// ch14
				{
					"", "", "", "",
					"", "", "", "",
					"", "", "", ""
				} 	// ch17
		};
		
		// 정보를 담은 List 설정
		for(int i=0; i<chapters.length; i++) {
			IndexVO indexVO = new IndexVO();
			indexVO.setChapter(chapters[i]);
			indexVO.setTitle(titles[i]);
			indexVO.setChapterMoveUrl(chapterMoveUrl[i]);
			
			List<String> sourceList = new ArrayList<String>();
			
			for (int j=0; j<sourceArr[i].length; j++) {
				sourceList.add(sourceArr[i][j]);
			}
			indexVO.setSourceList(sourceList);
			indexList.add(indexVO);
		}
	}
	
	
	// 챕터 데이터 전체 가져오기
	public List<IndexVO> getIndexList() {
		return indexList;
	}
}
