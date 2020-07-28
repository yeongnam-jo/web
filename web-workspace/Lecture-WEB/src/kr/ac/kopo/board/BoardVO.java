package kr.ac.kopo.board;

/*
	자바빈즈 클래스 규칙
	
	1. package 존재
	2. class의 접근제한자 public
	3. 모든 멤버변수 private
	4. 디폴트 생성자가 선언되어 있어야 함. 
	5. getter/ setter 메소드가 선언 돼 있어야 함
 
 */

public class BoardVO {
	private int no;
	private String title;
	private int viewCnt;
	
	public BoardVO() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	

}
