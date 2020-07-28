package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("마 반갑다.");
		response.setContentType("text/html; charset = utf-8 "); 
		
		
		PrintWriter out  = response.getWriter();
		out.println("<h1> 반갑습니다 hello servlet ajax @!#!@#!@#!@#! </h1>");
		out.close();
		
	}

}
