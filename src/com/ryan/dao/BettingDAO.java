package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ryan.dto.BetDTO;

public class BettingDAO {
	
	// 배팅하기 (home)
	public static BetDTO bet(String id, String time,String home,String homeb,String draw,String awayb,String away,int bet,int po,String hup, String aup,String doing) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BetDTO result2 = null;
		Date now = new Date();
		
		
			
			
		Float i4 = Float.parseFloat(homeb);
		String a = null;
		Float i5 = (float) 0;
		
		Float i6 = Float.parseFloat(awayb);
		
		// 언오버 일경우 값 변환
		if(draw.equals("(2.50)")) {
			a = draw;
			}
		else if(draw.equals("(3.50)")) {
			a = draw;
			}
		else if(draw.equals("(3.00)")) {
			a = draw;
			}
		else if(draw.equals("(2.00)")) {
			a = draw;
			}
		else {
			i5 = Float.parseFloat(draw);
		}
		
		
		Float pointresult =  (float) 0;
		
		
		// 배팅한값 * 배당
		if( po == 1) {
			 pointresult =  bet * i4;
		}
		
		if(po == 2) {
			pointresult = bet * i5;
		}
		if(po == 3) {
			pointresult = bet * i6;
		}
		
		
		
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
		sf = new SimpleDateFormat("MM/dd HH:mm");

		String t = sf.format(now);

		int count = 0;
		String i= null;

		
		
		// 외부로 보낼 결과값 ( 0이면 가입 실패 , 0아니면 가입 성공)
		
		
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");

			// 3. SQL 쿼리 준비
			// 추가하려는 데이터의 값은 전달된 인자를 통해 동적으로 할당되는 값이다.
			// 즉 어떤 값이 전달될지 모르므로 Select 할 때와 달리
			// stmt = conn.createStatement(); 를 작성하지 않고
			// pstmt = conn.prepareStatement(sql); 로 작성하여 데이터를 추가할 것임을 알립니다.
			// 물론 sql 쿼리 내에서 + 연산자로 한 줄로 작성할 수 있지만 가독성이 너무 떨어지게 되므로
			// 이 방법을 권합니다.
			String sql = "INSERT INTO bet VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			// 4. 데이터 binding
			// 위 sql 문에서  ?로 된 모양에 데이터 순서대로 들어감
			pstmt.setString(1, id);
			
			pstmt.setString(2, i);
			pstmt.setInt(3, po);
			pstmt.setString(4, time);
			pstmt.setString(5, home);
			pstmt.setString(6, homeb);
			pstmt.setString(7, draw);
			if( hup == null) {
				pstmt.setString(8, "");
				pstmt.setString(9, "");
			}
			else {
			pstmt.setString(8, hup);
			pstmt.setString(9, aup);
			}
			pstmt.setString(10, away);
			pstmt.setString(11, awayb);
			pstmt.setString(12, doing);
			pstmt.setInt(13, bet);
			
			pstmt.setInt(14, Math.round(pointresult));
			
			pstmt.setString(15, doing);
			pstmt.setString(16, t);
			

			// 5. 쿼리 실행 및 결과 처리
			// SELECT와 달리 INSERT는 반환되는 데이터들이 없으므로
			// ResultSet 객체가 필요 없고, 바로 pstmt.executeUpdate()메서드를 호출하면 됩니다.
			// INSERT, UPDATE, DELETE 쿼리는 이와 같이 메서드를 호출하며
			// SELECT에서는 stmt.executeQuery(sql); 메서드를 사용했었습니다.
			// @return     int - 몇 개의 row가 영향을 미쳤는지를 반환
			
			// 실행결과를 count 변수에 삽입 
			count = pstmt.executeUpdate();
			if (count == 0) {
				System.out.println("데이터 입력 실패");
			} else {
				System.out.println("데이터 입력 성공");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러 " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 외부로 count 값을 보냄  (Servlet or JSP) 
		return result2;
	}
	
  // 배팅금액 감소
	public static MemberDAO Charge1(String pid , int bet) {
		Connection conn = null;
		PreparedStatement stmt = null;

		MemberDAO result2 = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			String sql = "Update member set  point = point - ? where id = ?";
			
			stmt = conn.prepareStatement(sql);
			

			stmt.setInt(1, bet);
			stmt.setString(2, pid);
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
		return result2;
	}


}
