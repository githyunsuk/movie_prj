package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// 모든 요청과 응답의 한글 처리를 위해 필터를 추가해서 UTF-8설정 => web.xml에 등록해야 
public class EncodingFilter implements Filter {

	public void init(FilterConfig filterConfig) {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//한글 처리: 요청과 응답에 UTF-8 설정하기
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//다음 필터 or 서블릿을 호출
		chain.doFilter(request, response);
	}
	
	public void destroy() {}
}
