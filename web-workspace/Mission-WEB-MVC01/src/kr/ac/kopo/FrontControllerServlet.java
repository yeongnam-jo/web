package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet {

	// GET, POST 두 방식을 모두 받기 위해서 service 메소드를 사용해야 한다.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// request.getContextPath() ==> /Mission-WEB-MVC01
		// request.getRequestURI() ==> /Mission-WEB-MVC01/list.do
		
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		
		uri = uri.substring(context.length());
		System.out.println("요청 URI : " + uri);
		
		/*
		 * switch(uri) { case "/Mission-WEB-MVC01/list.do" :
		 * System.out.println("목록 처리"); break; case "/Mission-WEB-MVC01/write.do" :
		 * System.out.println("글등록 처리"); break; }
		 */
		
		String callPage = null;
		
		try {
			switch(uri) {
			case "/list.do" :
				//System.out.println("목록 처리");
				
				ListController list = new ListController();
				callPage = list.handleRequest(request, response); 
				// 빨간줄 뜨는 이유 : :ListController에서 Exception이 날라오기 때문임. 
				// 그러나, 현재 service 메소드는 ServletException, IOException 밖에 처리하지 못함.
				// 따라서 현재 switch를 별도로 try_catch로 예외처리 해야 함.
				break;
				
			case "/write.do" : 
				//System.out.println("글등록 처리");
				WriteController write = new WriteController();
				callPage = write.handleRequest(request, response);
				break;
			}
			
			if(callPage != null) {
				// forward 시키기 위해 필요한 RequestDispatcher 객체  / jsp forward는 <jsp:forward page="user.jsp"/> 형태로 썼다. (액션 방법)
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				// forward 실행
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			//throw new ServletException(e);
		}
	}
}
