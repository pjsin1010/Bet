package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ryan.dto.viewDTO;

public class BoardEditDAO {

	
	public static viewDTO BEdit(int num , String title, String board) {

		Connection conn = null;
		PreparedStatement stmt = null;
		
		
		
		viewDTO result = null;
		//System.out.println(ppointlimit);
		//System.out.println(ppoint);
//		DecimalFormat df = new DecimalFormat("00");
//		Calendar currentCalendar = Calendar.getInstance();
//		String last = df.format(currentCalendar.get(Calendar.DATE));
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			
			String sql = "Update board set title = ? , board = ? where num = ?";
			
			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, title);
			stmt.setString(2, board);
			stmt.setInt(3, num);
			result = new viewDTO();
			
		
			
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
