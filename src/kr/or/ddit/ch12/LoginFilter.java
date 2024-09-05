package kr.or.ddit.ch12;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

public class LoginFilter implements Filter {
	
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("TestFilter 초기화!");
		this.filterConfig = filterConfig;
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("TestFilter 수행!");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 필터에서 init-param값 가져오기
		String role = filterConfig.getInitParameter("role");
		
		// Request에서 유저 정보 가져오기 (유저 아이디)
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String id = httpRequest.getRemoteUser() == null ? "" : httpRequest.getRemoteUser();
		System.out.println("id : " + id);
		
		String msg = "";
		
		// 권한도 admin이고, 아이디도 admin인 경우
		if (id.equals(role)) {
			msg = "현재 접속 중인 계정은 관리자(admin) 권한을 가지고 접근 중입니다..!";
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			System.out.println("if임");
		
		// 권한은 admin인데, 아이디는 admin이 아닌 경우
		} else if ( !(id.equals(role) )) {
			request.getRequestDispatcher("ch12_test_loginFailRole.jsp").forward(request, response);
			System.out.println("else임");

		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("TestFilter 해제!");
	}
}
