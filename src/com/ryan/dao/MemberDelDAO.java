package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDelDAO {
	public static String MemberDel(String num) {

		Connection conn = null;
		PreparedStatement stmt = null;
		String result = null;
		
		
		
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			
			String sql = "delete from member where id = ?";
			
			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setString(1, num);
			
			
		
			
			stmt.executeUpdate();
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러 " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
