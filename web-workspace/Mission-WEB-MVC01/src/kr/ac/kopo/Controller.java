package kr.ac.kopo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 자바 인터페이스 : 추상 메소드의 모음
public interface Controller {

	// 추상메소드 : 구현부가 없는 메소드
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
