package kr.ac.kopo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteController implements Controller {
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/board/write.jsp";
	}
	
}
