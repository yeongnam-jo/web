package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */

//web.xml에서 설정했던 매핑 정보(*.do)를 annotation을 활용해서 쉽게만들 수 있다. 
//서블릿을 생성할 때 설정하면 아래의 형태가 나타남.
//Url mappings에 설정하면, 아래에 urlPatterns 내에 값이 들어간다.
//Initializetion parameters에 name과 value를 설정하면, 아래에 initParams 내에 값에 들어간다. 그런데 value는 문자열이므로, |로 구분하여 여러 컨트롤러를 붙인다.
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "controllers", 
							  value = "kr.ac.kopo.board.controller.BoardController"
							  		+ "|kr.ac.kopo.member.controller.MemberController")
		})

//서블릿 파일 생성 시, 어떤 메소드를 생성할건지 묻는다. init, service 메소드를 누르면 아래에 두 개의 메소드가 자동으로 생긴다.
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 핸들러매핑 역할을 할 객체를 만든다.
	private HandlerMapping mappings;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// web.xml 내의 설정값에 접근할 수 있는 변수가 config이다.
		// web.xml과 같은 역할을 하는 @WebServlet() 내에 있는 initParams에 접근할 수 있다.
		String ctrlNames = config.getInitParameter("controllers");
		System.out.println("ctrlNames : " + ctrlNames);
		try {
			mappings = new HandlerMapping(ctrlNames);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		uri = uri.substring(request.getContextPath().length());
		System.out.println("uri : " + uri);
		
		// System.out.println("mappings.getCtrlAndMethod(\"/board/list.do\") ==> " + mappings.getCtrlAndMethod("/board/list.do"));
		// System.out.println("mappings.getCtrlAndMethod(\"/login.do\") ==> " + mappings.getCtrlAndMethod("/login.do"));
	
		CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
		
		try {
			if(cam == null) {
				throw new Exception("요청 URL은 존재하지 않습니다.");
			}
			
			Object target = cam.getTarget();
			Method method = cam.getMethod();
			
			String view = (String) method.invoke(target, request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
			
		} catch(Exception e) {
			response.setContentType("text/plain; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());
			// 추후 에러메세지 화면 따로 구성.
		}
		
	}

}
