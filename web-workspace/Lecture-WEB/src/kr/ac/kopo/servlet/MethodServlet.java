package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http:/localhost:9999/Lecture-WEB/method

public class MethodServlet extends HttpServlet {

	
	//doGet 메소드는 get 방식만 사용 가능하다.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String method = request.getMethod();
		System.out.println("요청 메소드 : " + method);
		
		String uri = request.getRequestURI(); // URI: http 빼고. vs URL : http 포함
		System.out.println("요청 URI : " + uri); // 어느쪽으로 요청했는지 알 수 있다.
		
		StringBuffer url = request.getRequestURL(); // String을 + 연산으로 붙이면 느리다. 그래서, StringBuffer를 활용해 (append) 문자열 합치는 속도를 빠르게 한다. 
		System.out.println("요청 URL : " + url);
		
		String id = request.getParameter("id"); // getParameter: name = value 로 날라가는 형태에서, name이라는 속성명을 통해 입력된 값을 뽑아내는 메소드.
		System.out.println("id : " + id);
		
		// 지금 이렇게 출력 되는 것은 서버에 찍히는 것이다.
		// 이런 정보를 다시 client에 뿌려주려면 어떻게 할까? 이제 response 객체를 활용하면 된다.
		response.setContentType("text/html; charset = utf-8"); // response 할 때, 그 내용의 타입을 지정해줘야한다!
		//data를 주고 받을 떄는, stream 통로가 필요합니다. 
		//서버가 가지고 있는 정보를 보내야 하기 때문에, outputstream을 해야지요. 
		PrintWriter out = response.getWriter(); // 지금까지는, client 화면에 아무런 소스가 전달되지 않은 상태다.
		
		//out.println("~") 내용을 작성하는 순간, client에 소스가 전달된다.
		out.println("<html>");
		out.println("    <head>");
		out.println("        <title>메소드 호출결과</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("===================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println("===================================<br>");
		out.println("파라미터(id) : " + id + "<br>" );
		out.println("요청방식 : " + method + "<br>" );
		out.println("URI : " + uri + "<br>" );
		out.println("URL : " + url + "<br>" );
		out.println("===================================<br>");
		out.println("    </body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		// 서블릿에서 왜 화면구현을 안 하는지 알아보았다. 오류나는 것도 빨리 못잡는다.
		// 서블릿에서는 요청에 관한 것만 쓰는 편이다.
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		//post 방식을 사용하면, body에 담겨오는 내용부의 인코딩을 설정하는 것이 필요하다.
		request.setCharacterEncoding("utf-8"); 
		// 무조건 이렇게 인코딩을 명시적으로 적어줘야한다. body의 내용이 바이트 스트림으로 날라오기 때문에 그렇다. 이건 약속이다!!! 
		
		String method = request.getMethod();
		System.out.println("요청 메소드 : " + method);
		
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri); 
		
		StringBuffer url = request.getRequestURL();
		
		String id = request.getParameter("id"); 
		System.out.println("id : " + id);
		
		response.setContentType("text/html; charset = utf-8"); 
		PrintWriter out = response.getWriter(); 
		
		out.println("<html>");
		out.println("    <head>");
		out.println("        <title>메소드 호출결과</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("===================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println("===================================<br>");
		out.println("파라미터(id) : " + id + "<br>" );
		out.println("요청방식 : " + method + "<br>" );
		out.println("URI : " + uri + "<br>" );
		out.println("URL : " + url + "<br>" );
		out.println("===================================<br>");
		out.println("    </body>");
		out.println("</html>");
		
		out.flush();
		out.close();
	
		
	}
	
	
	
	
	
	
	/*
	 * servie 메소드는 get, post 방식 둘 다 사용 가능하다. 
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String method = request.getMethod(); // 무슨 방식으로 보냈는지 알려줌
		System.out.println("요청방식 : " + method);
	
	}
	*/
	

	
}
