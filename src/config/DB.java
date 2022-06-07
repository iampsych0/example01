package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DB {

	public static Connection dbConn() {
		Connection conn = null;
			
		try {
			String dbDriver = "oracle.jdbc.driver.OracleDriver";
			String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbUsr = "example01";
			String dbPwd = "1234";
				
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbUrl, dbUsr, dbPwd);
			System.out.println("-- DB 접속 성공--");
				
		} catch (Exception e) {
			System.out.println("-- DB 접속 실패--");
		}
		return conn;
	}		
	
	public static void dbConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) { rs.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			if (pstmt != null) { pstmt.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		try {
			if (conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-- DB 접속 해제 --");
	}
}
