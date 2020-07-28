package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Info extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//post 방식을 사용하면, body에 담겨오는 내용부의 인코딩을 설정하는 것이 필요하다.
		request.setCharacterEncoding("utf-8"); 
		
		response.setContentType("text/html; charset = utf-8"); 
		PrintWriter out = response.getWriter(); 
		
		out.println("<html>");
		out.println("    <head>");
		out.println("        <title>메소드 호출결과</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("        <h1>개인 정보 출력</h1>");
		out.println("        이름 : " + request.getParameter("name") + "<br>");	
		out.println("        아이디 : " + request.getParameter("id") + "<br>");	
		out.println("        암호 : " + request.getParameter("pwd") + "<br>");	
		if(request.getParameterValues("sex")[0].equals("m")) {
			out.println("성별 : 남<br>");
		} else {
			out.println("성별 : 여<br>");
		}
		
		String[] mail = request.getParameterValues("mail");
		out.println("공지메일 : " + ((Arrays.asList(mail).contains("noticeMail"))?"받음":"받지않음")+ "<br>");
		out.println("광고메일 : " + ((Arrays.asList(mail).contains("adMail"))?"받음":"받지않음") + "<br>");
		out.println("배송 확인 메일 : " + ((Arrays.asList(mail).contains("deliveryMail"))?"받음":"받지않음") + "<br>");
		out.println("        직업 : " + request.getParameter("job") + "<br>");	
		out.println("    </body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
		
	}
	

}
