package kr.ac.kopo.member.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.framework.ModelAndView;
import kr.ac.kopo.framework.annotaion.RequestMapping;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberController {

	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest request, 
			HttpServletResponse reponse) throws Exception {
		System.out.println("MemberController login() 호출...");

		ModelAndView mav = new ModelAndView("/jsp/login/loginForm.jsp");
		
		return mav;
	}
	
	@RequestMapping("/loginProcess.do")
	public ModelAndView loginProcess(HttpServletRequest request, 
								HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVO memVO = new MemberVO(id, password);
		
		//MemberDAO dao = new MemberDAO();
		ServletContext sc = request.getServletContext();
		MemberDAO dao = (MemberDAO) sc.getAttribute("memberDAO");
		MemberVO userVO = dao.login(memVO);
		
		ModelAndView mav = new ModelAndView();
		if(userVO == null) {
			// 로그인 실패
			mav.setView("redirect:/login.do");
		} else {
			// 로그인 성공
			mav.setView("redirect:/");
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	
}

