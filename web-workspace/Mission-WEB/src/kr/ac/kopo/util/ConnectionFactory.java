package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	public Connection getConnetion() {
		
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";
			String user ="DA09";
			String password ="DA09";
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	
	public Connection getConnection(String url, String user, String password) {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void main(String[] args) {
		//Connection conn = new ConnectionFactory().getConnetion();
		
		String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";
		String user ="DA09";
		String password ="DA09";
		Connection conn = new ConnectionFactory().getConnection(url, user, password);
		
		System.out.println(conn);
	}
}
