package kr.ac.kopo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

public class MemberDAO {
	
	private String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";
	private String user ="DA09";
	private String password ="DA09";
	
	public List<MemberVO> selectAllMember() {
		
		Connection 			conn = null;
		PreparedStatement 	pstmt = null;
		List<MemberVO> 		list = new ArrayList<>();
		
		try {
			
			conn = new ConnectionFactory().getConnection(url, user, password);
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, ");
			sql.append(" POST, BASIC_ADDR, DETAIL_ADDR, TYPE, TO_CHAR(REG_DATE, 'YYYY-MM-DD') AS REG_DATE FROM T_MEMBER ORDER BY REG_DATE ");
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String password = rs.getString("PASSWORD");
				String email = rs.getString("EMAIL_ID");
				String domain = rs.getString("EMAIL_DOMAIN");
				String tel1 = rs.getString("TEL1");
				String tel2 = rs.getString("TEL2");
				String tel3 = rs.getString("TEL3");
				String post = rs.getString("POST");
				String addr1 = rs.getString("BASIC_ADDR");
				String addr2 = rs.getString("DETAIL_ADDR");
				String type = rs.getString("TYPE");
				String reg_date = rs.getString("REG_DATE");
				
				MemberVO member = new MemberVO(name, id, password, email, domain, tel1, tel2, tel3, post, addr1, addr2, type, reg_date);
				list.add(member);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		
		return list;
	}
	
	public MemberVO selectMemberById(String id) {
		Connection 			conn = null;
		PreparedStatement 	pstmt = null;
		MemberVO			memberVO = new MemberVO();
		
		try {
			conn = new ConnectionFactory().getConnection(url, user, password);
			
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, ");
			sql.append(" POST, BASIC_ADDR, DETAIL_ADDR FROM T_MEMBER WHERE ID = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberVO.setId(rs.getString("ID"));
				memberVO.setPassword(rs.getString("PASSWORD"));
				memberVO.setName(rs.getString("NAME"));
				memberVO.setEmail( rs.getString("EMAIL_ID") );
				memberVO.setDomain(rs.getString("EMAIL_DOMAIN"));
				memberVO.setTel1(rs.getString("TEL1"));
				memberVO.setTel2(rs.getString("TEL2"));
				memberVO.setTel3(rs.getString("TEL3"));
				memberVO.setPost(rs.getString("POST"));
				memberVO.setAddr1(rs.getString("BASIC_ADDR"));
				memberVO.setAddr2(rs.getString("DETAIL_ADDR"));
				
				return memberVO;
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(conn, pstmt);
		}
		
		return null;
	}
	
	
	public void join(String id, String name, String password, String email, String domain, String tel1, String tel2, String tel3, String post, String addr1, String addr2) {
		Connection 			conn = null;
		PreparedStatement 	pstmt = null;
		
		try {
			
			conn = new ConnectionFactory().getConnetion();
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, REG_DATE) ");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'U', sysdate) ");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setString(5, domain);
			pstmt.setString(6, tel1);
			pstmt.setString(7, tel2);
			pstmt.setString(8, tel3);
			pstmt.setString(9, post);
			pstmt.setString(10, addr1);
			pstmt.setString(11, addr2);
			
			pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(conn, pstmt);
		}
		
		
	}
	
	public MemberVO login(MemberVO loginVO) {
		MemberVO userVO = null;
		StringBuilder sql = new StringBuilder();
		// StringBuilder는 autoclosable 상속받지 않아서 try 문 안에 넣을 수 없다.
		sql.append(" select id, type from t_member where id = ? and password = ? ");
		
		
		// 1.7try 문은 finally 해서 객체를 종료하지 않아도 된다.
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			// Connection은 autoclosable 상속받는다
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
		) {
			
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setType(rs.getString("type"));
				
				return userVO;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void leave(String id) {
		StringBuilder sql = new StringBuilder();
		// StringBuilder는 autoclosable 상속받지 않아서 try 문 안에 넣을 수 없다.
		sql.append(" DELETE FROM T_MEMBER WHERE ID = ? ");
		
		// 1.7try 문은 finally 해서 객체를 종료하지 않아도 된다.
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			// Connection은 autoclosable 상속받는다
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
		) {
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void changePassword(String id, String passwordRe) {
		
		StringBuilder sql = new StringBuilder();
		// StringBuilder는 autoclosable 상속받지 않아서 try 문 안에 넣을 수 없다.
		sql.append(" UPDATE T_MEMBER SET PASSWORD = ? WHERE ID = ? ");
		
		// 1.7try 문은 finally 해서 객체를 종료하지 않아도 된다.
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			// Connection은 autoclosable 상속받는다
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
		) {
			int loc = 1;
			pstmt.setString(loc++, passwordRe);
			pstmt.setString(loc++, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void modifyUser(String email, String domain, String tel1, String tel2, String tel3, String post, String addr1, String addr2, String id) {
		Connection 			conn = null;
		PreparedStatement 	pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnetion();
			StringBuilder sql = new StringBuilder();
			
			sql.append(" update t_member set email_id = ?, email_domain = ?, tel1 = ?, tel2 = ?, ");
			sql.append(" tel3 = ?, post = ?, basic_addr = ?, detail_addr = ? where id = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, email);
			pstmt.setString(2, domain);
			pstmt.setString(3, tel1);
			pstmt.setString(4, tel2);
			pstmt.setString(5, tel3);
			pstmt.setString(6, post);
			pstmt.setString(7, addr1);
			pstmt.setString(8, addr2);
			pstmt.setString(9, id);
			
			pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(conn, pstmt);
		}
		
	}
	
}
