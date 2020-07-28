package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamMethodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String hobby = request.getParameter("hobby"); // name이 hobby인 것의 첫번째 것을 가져온다.
		
		System.out.println("name : " + name);
		System.out.println("hobby: " + hobby); // name 이라는 속성을 여러개가 사용 중이다. 
		// 따라서, 유일하게 구분해주던 value 속성을 통해 값을 가져와보자.
		System.out.println("===================");
		
		System.out.println("name : " + name);
		System.out.println("hobby: ");
		
		
		String[] hobbies = request.getParameterValues("hobby");
		//System.out.println(hobbies);
		
		for(int i = 0; i < hobbies.length; i++) { 
			System.out.print(hobbies[i] + " "); 
		}
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("    <head>");
		out.println("        <title>메소드 호출결과</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("===================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println("===================================<br>");
		
		for(int i = 0; i < hobbies.length; i++) { 
			out.print(hobbies[i] + " "); 
		}
		
		out.println("===================================<br>");
		out.println("    </body>");
		out.println("</html>");
		
	}
	
		
	
}
