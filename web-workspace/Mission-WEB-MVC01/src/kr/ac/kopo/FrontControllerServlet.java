package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	web.xml 내에 <init-param>에 properties 경로만 잡아주면, FrontContollerServlet과 HandlerMapping을 전혀 손대지 않고도 컨트롤러를 추가할 수 있다.
 */


public class FrontControllerServlet extends HttpServlet {

	
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException { 
		/*
			서블릿이 여러개일 수 있다. 각각의 서블릿의 설정을 해주기 위한 파라미터가 ServletConfig
			bean.properties과 같은 properties 파일이 여러개일 수 있으니, config에 정보를 담아줄 수 있다.
			즉, 특정 properties 파일을 사용하기 위해 별도의 설정이 필요하다. 
			
			그 설정 값은, web.xml 내에 있는 <init-param>내에 작성한다.
			
			파라미터 ServletConfig : web.xml에 있는  <init-param>에 대한 정보를 알고 있음
		*/
		
		// 해당하는 bean.properties 경로를 문자열로 받기
		String propLoc = config.getInitParameter("propLocation"); //<init-param> 내에 있는 param-name을 써주면, param-value가 나온다.
		//System.out.println(propLoc);
		
		mappings = new HandlerMapping(propLoc); // bean.properties 경로를 넘겨서 mapping 객체를 받아온다.
		/*
			service 메소드는, 요청이 들어올 때마다 실행된다. 
			수많은 요청이 들어오는 웹사이트라면 HandlerMapping 객체가 계속해서 생겨날 것이다.
			
			객체가 불필요하게 계속해서 생성되니까 쓸데없는 부하가 생긴다. 한 번만 생성되면 된다.
			서블릿의 라이프사이클을 보면, init은 서블릿이 맨 처음 호출될 때 딱 한 번만 실행되기 때문에 HandlerMapping 객체를 생성하기에 적합하다.
		*/
		
		/*
		 	[서블릿의 라이프사이클]
		  	init 	: 서블릿이 맨 처음 호출될 때 딱 한번 실행 됨
		  	service : 요청이 들어올 때마다 실행
		  	destroy : 종료~

		 */
	}

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
