package kr.ac.kopo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// POST 방식으로 reqeust가 날라왔기 때문에, 인코딩을 반드시 해줘야 한다.
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwrod = request.getParameter("password");
		
		MemberVO loginVO = new MemberVO();
		loginVO.setId(id);
		loginVO.setPassword(passwrod);
				
		MemberDAO dao = new MemberDAO();
		MemberVO userVO = dao.login(loginVO);
		
		String msg ="";
		String url ="";
		
		if(userVO == null) {
			// 로그인 실패
			msg = "로그인에 실패했습니다. \\n로그인 페이지로 이동합니다.";
			url = request.getContextPath() + "/login.do"; //forward, include, xml 경로만 프로젝트 하위 경로를 써준다. 
			// http://localhost:9999/Mission-WEB-MVC01/login.do
		} else {
			// 로그인 성공
			msg = "로그인 성공";
			url = request.getContextPath(); // http://localhost:9999/Mission-WEB-MVC01 ==> index.jsp 파일로 간다. welcom-file-list에 의해서.
			
			/*
				session.setAttribute("userVO", userVO); 
				=> 서블릿이 아니기 때문에, 내장객체인 session에 바로 접근하지 못한다. 그래서 session. 하면 빨간 줄이 뜬다.
				=> 따라서 세션 객체를 먼저 얻어온 뒤에 등록해야 한다.
			*/
			
			// 1. 세션 객체를 얻어온다.
			HttpSession session = request.getSession();
			
			// 2. 세션에 userVO라는 Attribute를 등록한다.
			session.setAttribute("userVO", userVO); 
			
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/login/loginProcess.jsp";
	}

}
