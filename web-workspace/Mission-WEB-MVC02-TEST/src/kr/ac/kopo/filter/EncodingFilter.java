package kr.ac.kopo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns = "*", 
initParams = {@WebInitParam(name="encoding", value="utf-8")})
public class EncodingFilter implements Filter{
	private FilterConfig config;
	
	@Override
	public void destroy() {
		System.out.println("filter 소멸");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("filter 작업 수행 중");		
		// 어떤 url로 들어오던지간에 우선 filter를 거치게된다. (web.xml에 관련 정보를 설정함)
		// 무조건 여기서 인코딩을 해주면, 각 컨트롤러에서 인코딩 하는 작업을 생략할 수 있다.
		//request.setCharacterEncoding("utf-8");
		// 더 이전에 해보자. web.xml 내에 encoding 정보를 설정할 수 있다. init-param에 encoding이라는 name을 주고 utf-8이라는 값을 줌.
		// 또 다르게 Annotaion으로 해보자. class 맨 위에 설정할 수 있다. web.xml 건들이지 않고도!
		// 이제는 web.xml에 관련 정보를 주석처리해도 됨.
		
		String encoding = config.getInitParameter("encoding"); 
		request.setCharacterEncoding(encoding);
				
		// 이제 원래 url로 보내주려면, chain.doFilter()메소드를 쓴다.
		// 그러면 DispatcherServlet으로 간다.
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("filter 생성");
		config = filterConfig;
	}

}
