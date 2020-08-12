package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.ModelAndView;
import kr.ac.kopo.framework.annotaion.RequestMapping;

/*

 	
 	/board/list.do	: 전체 게시글 조회
 	 	new BoardController().list()
 	
 	/board/write.do	: 게시글 등록폼
 		new BoardControoler().write()
 		
 */
public class BoardController {
	
	@RequestMapping("/board/list.do") //value만 있을 때는 생략 가능하다. 
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception{
	//public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("BoardController list() 호출...");
		
		
		//BoardDAO dao = new BoardDAO();
		ServletContext sc= request.getServletContext();
		BoardDAO dao = (BoardDAO) sc.getAttribute("boardDAO");
		List<BoardVO> list = dao.selectAllBoard();
		
		ModelAndView mav = new ModelAndView();
		mav.setView("/jsp/board/list.jsp"); //forward 시킬 주소
		mav.addAttribute("boardList", list); // 공유역역에 등록시킬 변수(?)
		
		//request.setAttribute("boardList", list);
		
		//return "/jsp/board/list.jsp";
		return mav; 
		// Dispatcher한테 공유영역 등록하는 기능, forward 시킬 주소등을 mav 객체에 담아서 다 날린다.
		
		
	}
	
	@RequestMapping(value="/board/write.do")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("BoardController write() 호출...");
		return "";
	}

}
