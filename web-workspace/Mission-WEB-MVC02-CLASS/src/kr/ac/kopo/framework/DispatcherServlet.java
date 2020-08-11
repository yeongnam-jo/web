package kr.ac.kopo.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
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
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				@WebInitParam(name = "controllers", 
							  value = "kr.ac.kopo.board.controller.BoardController"
							  		+ "|kr.ac.kopo.member.controller.MemberController")
		})
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HandlerMapping mappings;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		String ctrlNames = config.getInitParameter("controllers");
//		System.out.println(ctrlNames);
		try {
			mappings = new HandlerMapping(ctrlNames);
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		uri = uri.substring(request.getContextPath().length());
		System.out.println("uri : " + uri);
		
//		System.out.println(mappings.getCtrlAndMethod("/board/list.do"));
//		System.out.println(mappings.getCtrlAndMethod("/login.do"));
		
		CtrlAndMethod cam = mappings.getCtrlAndMethod(uri);
		String view = "";
		try {
			if(cam == null) {
				throw new Exception("요청 URL은 존재하지 않습니다");
			}
			
			Object target = cam.getTarget();
			Method method = cam.getMethod();
			
			view = (String)method.invoke(target, request, response);
						
		} catch(Exception e) {
			response.setContentType("html/text; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(e.getMessage());
			// 추후 에러메세지 화면 따로 구성....
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}







