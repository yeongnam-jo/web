package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String user ="test";
	private String password ="1111";
	

	public MemberVO login(MemberVO MemberVO) {
		
		MemberVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, type ");
		sql.append("  from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection(url, user, password);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, MemberVO.getId());
			pstmt.setString(2, MemberVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("id"));
				userVO.setType(rs.getString("type"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}










