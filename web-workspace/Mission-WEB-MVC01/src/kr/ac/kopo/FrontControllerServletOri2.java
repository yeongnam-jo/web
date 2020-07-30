package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServletOri2 extends HttpServlet {

	// GET, POST 두 방식을 모두 받기 위해서 service 메소드를 사용해야 한다.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request.getContextPath() ==> /Mission-WEB-MVC01
		// request.getRequestURI() ==> /Mission-WEB-MVC01/list.do
		
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		
		uri = uri.substring(context.length());
		System.out.println("요청 URI : " + uri);
		
		try {
			
			//HandlerMapping mappings = new HandlerMapping(); 
			
			// service 메소드는, 요청이 들어올 때마다 실행된다. 
			// 수많은 요청이 들어오는 웹사이트라면 HandlerMapping 객체가 계속해서 생겨날 것이다.
			// 한 번만 생성되면 된다. 불필요하게 계속해서 생성되니까 쓸데없는 부하가 생긴다.
			// 서블릿의 라이프사이클을 보면, init은 서블릿이 맨 처음 호출될 때 딱 한 번만 실행되기 때문에 HandlerMapping 객체를 생성하기에 적합하다.
			
			/*
			 	[서블릿의 라이프사이클]
			  	init 	: 서블릿이 맨 처음 호출될 때 딱 한번 실행 됨
			  	service : 요청이 들어올 때마다 실행
			  	destroy : 종료~

			 */
			
			Controller control = mappings.getController(uri);
			
			if(control != null) {
				String callPage = control.handleRequest(request, response);
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			//throw new ServletException(e);
		}
	}
}
