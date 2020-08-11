package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.framework.annotation.RequestMapping;

/*
 	/board/list.do  : 전체 게시글
 	 *             new BoardController().list()
 	/board/write.do : 게시글 등록폼
 	 			   new BoardController().write()
 */

public class BoardController {

	@RequestMapping("/board/list.do")
	public String list(HttpServletRequest request, 
					HttpServletResponse reponse) throws Exception {
		System.out.println("BoardController list() 호출...");
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAllBoard();
		request.setAttribute("boardList", list);
		
		return "/jsp/board/list.jsp";
	}
	
	@RequestMapping("/board/write.do")
	public String write(HttpServletRequest request, 
					HttpServletResponse reponse) throws Exception {
		System.out.println("BoardController write() 호출...");
		return "";
	}
	
	public void protectedMethod() {
		
	}
	
	public void privateMethod() {
		
	}
}







