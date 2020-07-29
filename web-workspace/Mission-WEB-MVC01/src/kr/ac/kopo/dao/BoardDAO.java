package kr.ac.kopo.dao;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.vo.BoardVO;

public class BoardDAO {

	public List<BoardVO> selectBoard(){
		
		List<BoardVO> list = new ArrayList<>();
		
		list.add(new BoardVO("aaa", "bbb"));
		list.add(new BoardVO("ccc", "ddd"));
		
		
		return list;
	}
	
}
