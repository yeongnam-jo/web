package kr.ac.kopo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.ControllerEventListener;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;

public class ListController implements Controller {
	public String handleRequest(HttpServletRequest request, HttpServletResponse response)
								throws Exception {
		
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectBoard();
		
		// jsp도 이러한 값을 사용하기 위해 request 공유영역에 등록한다.
		request.setAttribute("list", list);
		
		//return "/Mission-WEB-MVC01/board/list.jsp"; // forward 시킬 jsp 경로
		// forward, include, xml에서의 루트는 localhost:9999/Mission-WEB-MVC01(contextPath) 까지이다.
		return "/board/list.jsp"; // forward 시킬 jsp 경로
	}
}
