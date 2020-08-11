package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.annotaion.RequestMapping;

/*

 	
 	/board/list.do	: 전체 게시글 조회
 	 	new BoardController().list()
 	
 	/board/write.do	: 게시글 등록폼
 		new BoardControoler().write()
 		
 */
public class BoardController {
	
	@RequestMapping("/board/list.do") //value만 있을 때는 생략 가능하다. 
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("BoardController list() 호출...");
		return "/jsp/board/list.jsp";
	}
	
	@RequestMapping(value="/board/write.do")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		System.out.println("BoardController write() 호출...");
		return "";
	}

}
