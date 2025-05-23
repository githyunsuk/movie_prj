package filter;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        // 요청 파라미터의 한글 깨짐 방지 (POST 방식)
        req.setCharacterEncoding("UTF-8");
        //res.setCharacterEncoding("UTF-8"); // 이미 JSP에서 <%%>로 설정중, 얘 있으면 css가  html/text로 읽혀서 적용안됨 

        // 필터 체인 계속 진행
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {}
}
