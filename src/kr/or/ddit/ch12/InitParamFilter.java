package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {

	private FilterConfig filterConfig = null;
	
	// FilterConfig는 필터가 초기화 되는 시점에 호출되는 init() 메서드의 매개변수로 전달되는 객체
	// FilterConfig 객체는 web.xml에서 <init-param> 태그를 통해 작성해둔 설정값 정보들과 ServletContext에 대한 참조를 가지고 있다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화!");
		
		System.out.println(filterConfig.getInitParameter("param1"));
		System.out.println(filterConfig.getInitParameter("param2"));
		
		this.filterConfig = filterConfig;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행!");
		
		request.setCharacterEncoding("UTF-8");
		
		// Filter02 시나리오
		// 입력받은 아이디와 비밀번호가 Filter에 맵핑된 아이디, 비밀번호와 일치한 경우
		// > 로그인 성공했습니다. 메시지를 출력
		// 일치하지 않는 경우
		// > 로그인 실패했습니다. [Filter02 이동]
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// Filter02에 맵핑된 아이디와 비밀번호 파리미터
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String msg = "";
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		if (id.equals(param1) && pw.equals(param2)) {
			msg = "로그인 성공했습니다!";
			request.setAttribute("msg", msg);
		} else {
			msg = "로그인 실패했습니다!";
			msg += "<a href='filter02.jsp'>Filter02 이동</a>";
			writer.println(msg);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter02 해제!");
	}

}
