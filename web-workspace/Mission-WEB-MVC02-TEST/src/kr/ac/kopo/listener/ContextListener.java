package kr.ac.kopo.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.member.dao.MemberDAO;

@WebListener
public class ContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("리스너 종료");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("리스너 시작");
		
		ServletContext sc = event.getServletContext(); 
		// 서블릿끼리 값을 공유하기 위한 영역이 SevletContext. request 영역이 아니다.
		// 서버가 실행되고 있는 동안 계속 살아있다.
		// request 영역에서 ServletContext의 값을 가져올 수 있다. 
		
		sc.setAttribute("boardDAO", new BoardDAO()); 
		sc.setAttribute("memberDAO", new MemberDAO());
		
	}
	
	
}
