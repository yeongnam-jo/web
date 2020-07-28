package kr.ac.kopo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * Database t_board와 관련된 게시판 등록, 수정, 삭제, 조회 기능클래스
 * 
 * @author DA
 *
 */
public class BoardDAO {

	private String url = "jdbc:oracle:thin:@172.16.88.120:1521:dink";
	private String user = "DA09";
	private String password = "DA09";

	/**
	 * 게시물 번호에 해당 게시물 조회 서비스
	 * 
	 * @param no 조회할 번호
	 * @return 해당게시물
	 */
	public BoardVO selectByNo(int no) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;

		try {
			conn = new ConnectionFactory().getConnection(url, user, password);

			/* 별도로 메소드 설정함 incrementViewCnt
			 * 
			 * // 조회수 설정 StringBuilder sb = new StringBuilder();
			 * sb.append("UPDATE T_BOARD SET VIEW_CNT = VIEW_CNT + 1 WHERE NO = ? "); pstmt
			 * = conn.prepareStatement(sb.toString()); pstmt.setInt(1, no);
			 * pstmt.executeUpdate();
			 */

			// 조회
			StringBuilder sql = new StringBuilder();
			sql.append(" select no, title, writer, content, view_cnt ");
			sql.append("       , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append("  from t_board ");
			sql.append(" where no = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

				board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
//				board = new BoardVO();
//				board.setNo(boardNo);
//				board.setTitle(title);
//				board.setWriter(writer);
//				board.setContent(content);
//				board.setViewCnt(viewCnt);
//				board.setRegDate(regDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

		return board;
	}

	public List<BoardVO> selectAllBoard() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		List<BoardVO> list = new ArrayList<>();

		try {
			conn = new ConnectionFactory().getConnection(url, user, password);

			StringBuilder sql = new StringBuilder();
			/* 삽질 ㅠㅠ
			 * sql.append(" select no, title, writer, content, view_cnt ");
			 * sql.append("   , case "); 
			 * append("         when reg_date = to_char(select sysdate from dual, 'YYYY-MM-DD') then to_char(select sysdate from dual, 'HH24-MI') "
			 * ); sql.append("         else to_char(reg_date, 'yyyy-mm-dd') ");
			 * sql.append("     end as reg_date "); sql.append("  from t_board ");
			 * sql.append(" order by no desc ");
			 */
			
			
			
			
			sql.append(" select no, title, writer, content, view_cnt ");
			sql.append("       , case when to_char(sysdate, 'yyyy-mm-dd') = to_char(reg_date, 'yyyy-mm-dd') then to_char(reg_date, 'hh24:mi:ss') else to_char(reg_date, 'yyyy-mm-dd') end as reg_date ");
			sql.append("  from t_board "); sql.append(" order by no desc ");
			
			
			/*
			 * sql.append(" select no, title, writer, content, view_cnt ");
			 * sql.append("       , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			 * sql.append("  from t_board "); sql.append(" order by no desc ");
			 */
			 
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String regDate = rs.getString("reg_date");

				BoardVO board = new BoardVO(boardNo, title, writer, regDate);
				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}

		return list;
	}

	/*
	 * 새로운 게시물 등록
	 */

	public void insertBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		System.out.println(board.getNo());
		System.out.println(board.getTitle());
		System.out.println(board.getWriter());
		System.out.println(board.getContent());
		
		try {

			conn = new ConnectionFactory().getConnetion();
			StringBuilder sql = new StringBuilder();
			sql.append(" insert into t_board(no, title, writer, content) ");
			sql.append(" values(? , ?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, board.getNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());

			/*
			 * int loc = 1; pstmt.setInt(loc++, board.getNo()); pstmt.setString(loc++,
			 * board.getTitle()); pstmt.setString(loc++, board.getWriter());
			 * pstmt.setString(loc++, board.getContent());
			 */

			pstmt.executeUpdate(); // CRUD 할 때는 executeUpdate 문을 실행한다. 단순히 쿼리 날릴 때는 executeQuery 인듯

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
	}

	/**
	 * 게시판 수정 서비스
	 */
	public void updateBoard(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE T_BOARD SET TITLE = ?, CONTENT = ? WHERE NO = ? ");
				
		try(
				Connection conn = new ConnectionFactory().getConnetion();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			int loc = 1;
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getContent());
			pstmt.setInt(loc++, board.getNo());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 게시판 삭제 서비스
	 * 
	 * @param no 삭제할 게시물 번호
	 */
	public void deleteBoard(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnetion();
			StringBuilder sql = new StringBuilder();
			sql.append(" delete from t_board where no = ? ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, no);
			pstmt.executeUpdate(); // CRUD 할 때는 executeUpdate 문을 실행한다. 단순히 쿼리 날릴 때는 executeQuery 인듯

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
	}

	/**
	 * seq_t_board_no 생성하는 기능
	 */

	/**
	 * seq_t_board_no 생성하는 기능
	 */
	public int selectBoardNo() {
		
		String sql = "select seq_t_board_no.nextval from dual ";
		
		try(
			Connection conn = new ConnectionFactory().getConnetion();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
			
		} catch(Exception e) {
			
		}
		
		return 0;
	}
	
	/*
	 * public int selectBoardNo() {
	 * 
	 * 
	 * StringBuilder sql = new StringBuilder();
	 * sql.append(" SELECT SEQ_T_BOARD.NEXTVAL ");
	 * 
	 * 
	 * String sql = " SELECT SEQ_T_BOARD_NO.NEXTVAL FROM DUAL ";
	 * 
	 * try( Connection conn = new ConnectionFactory().getConnetion();
	 * PreparedStatement pstmt = conn.prepareStatement(sql); ){
	 * 
	 * ResultSet rs = pstmt.executeQuery(); rs.next(); return rs.getInt(1);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return 0; }
	 */
	
	
	/**
	 * 조회수 증가 서비스
	 */
	public void incrementViewCnt(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append("   set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnetion();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

	////////////////////////////////////////////////////////////////////////////////////////////////
	//////////// 첨부파일 CRUD ////////////
	////////////////////////////////////////////////////////////////////////////////////////////////

	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO T_BOARD_FILE( ");
		sql.append("      NO, BOARD_NO, FILE_ORI_NAME, FILE_SAVE_NAME, FILE_SIZE ");
		sql.append("                          ) ");
		sql.append(" VALUES(SEQ_T_BOARD_FILE_NO.NEXTVAL, ?, ?, ?, ?) ");

		try (

				Connection conn = new ConnectionFactory().getConnetion();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			int loc = 1;
			pstmt.setInt(loc++, fileVO.getBoardNo());
			pstmt.setString(loc++, fileVO.getFileOriName());
			pstmt.setString(loc++, fileVO.getFileSaveName());
			pstmt.setInt(loc++, fileVO.getFileSize());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public List<BoardFileVO> selectFileByNo(int boardNo){
		
		List<BoardFileVO> fileList = new ArrayList<BoardFileVO>();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT NO, FILE_ORI_NAME, FILE_SAVE_NAME, FILE_SIZE ");
		sql.append(" FROM T_BOARD_FILE ");
		sql.append(" WHERE BOARD_NO = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnetion();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
		){
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				fileList.add(fileVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileList;
	}

}
