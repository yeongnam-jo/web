package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:9999/Lecture-WEB/servlet/table?row=3&col=3
/*
 		-------------------------------------
 		|	(0, 0)	|	(0, 1) 	| 	(0, 2) 	|
 		-------------------------------------
 		|	(1, 0)	|	(1, 1) 	| 	(1, 2) 	|
 		-------------------------------------
 		|	(2, 0)	|	(2, 1) 	| 	(2, 2) 	|
 		-------------------------------------	
 */
// http://localhost:9999/Lecture-WEB/servlet/table  --> 5 X 5 테이블 응답
// http://localhost:9999/Lecture-WEB/servlet/tableExam  --> 5 X 5 테이블 응답

// web.xml을 대체하는 기술이다. 이미 있는 매핑된 정보를 어노테이션에 쓰면 중복 에러가 난다.
@WebServlet(urlPatterns = {"/tableExam", "/table"})
public class TableServletExam extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String strRow = request.getParameter("row");
		String strCol = request.getParameter("col");
		
		int row = 5, col = 5;
		if(strRow != null && !strRow.equals(""))
			row = Integer.parseInt(strRow);
		if(strCol != null && !strCol.equals(""))
			col = Integer.parseInt(strCol);
		
		// 응답
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("  <title>테이블 생성 연습</title>");
		sb.append(" <style>");
		sb.append("    table { ");
		sb.append("       background-color : yellow; ");
		sb.append("    } ");
		sb.append(" </style>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("  <table border='1'>");
		for(int i = 0; i < row; i++) {
			sb.append("<tr>");
			for(int j = 0; j < col; j++) {
				sb.append("<td>");
				sb.append("(" + i + ", " + j + ")");
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("  </table>");
		sb.append("</body>");
		sb.append("</html>");
		
		out.println(sb.toString());
		out.flush();
		out.close();
	}

}

