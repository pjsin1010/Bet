package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ryan.dto.BoardDTO;

public class BoardListDAO {
	
	// 게시판 부르기
	// 전체 갯수 select count(*) from Board
		public static int getCount() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			int cnt = 0 ; // 갯수 반환
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
				conn = DriverManager.getConnection(url, "root", "root");
				
				
				String sql = "select count(*) from board";

				stmt = conn.prepareStatement(sql);
				
				rs = stmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);  // 첫번째 값 가져오기				
					
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
					if (stmt != null && !stmt.isClosed()) {
						stmt.close();
					}
					if (rs != null && !rs.isClosed()) {
						rs.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return cnt;
		}
		
		// 페이징 select * from member limit 0,10
		
		public static ArrayList<BoardDTO> selectinfo(int start , int exit) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			// 한번에 담기위해 MemberDTO 쓴다
			// 클래스명도 타입취급한다
			ArrayList<BoardDTO> list = new ArrayList<>();
			
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
				conn = DriverManager.getConnection(url, "root", "root");
				
				
				String sql = " select * from board order by num desc limit ?,? ";

				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, start);
				stmt.setInt(2, exit);
				
				rs = stmt.executeQuery();

				while (rs.next()) {
					int num = rs.getInt("num");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String board = rs.getString("board");
					String time = rs.getString("time");
					int level = rs.getInt("level");
				
					
					// 값을 다 받기위해 while문 안에 씀
					BoardDTO dto = new BoardDTO();
					
					
					// MemberDTO 파일 안에 있는 setId(String id) 메소드에 매개변수인 id 변수에
					// SELECT * FROM member 으로 나온 한 데이터중 ( id,pw,name,email,phone)
					// id 데이터를 삽입한다   

					// ex) id = "test"
					// public void setId(String id) {
					// this.id = id;    →   this.id = test
					// }
					
					// 그러면 MemberDTO 파일 안에 있는 Private String id 의 값은 test 이다
					// 외부에서 dto.getId(); 하면 test값이 출력된다
					// 나머지도 같은 방식
					
					dto.setNum(num);
					dto.setName(name);
					dto.setTitle(title);
					dto.setBoard(board);
					dto.setTime(time);
					dto.setLevel(level);
					
					
					
					//  그후 list에 배열 dto값 삽입
					//  ex)   id: test  /  pw: 1234 / name: 홍길동  / email: aa@aa.com / phone 010-0000-000
					//  [1] : setId(id) , setPw(pw) , setName(name) , setEmail(email) , setPhone(phone) 
					//  위 ex에 있는 값이 들어감
					
					//  while 반복문이므로 위 코드랑 같이 작동되면서 계속 쌓아짐
					//  [2] , [3] , [4]  ..... 
					list.add(dto);
					
					
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
					if (stmt != null && !stmt.isClosed()) {
						stmt.close();
					}
					if (rs != null && !rs.isClosed()) {
						rs.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			// 쌓아진 list 값이  selectinfo()에 들어가며 외부로 보냄
			// 또한 배열 이므로
			// public static void selectinfo() 를
			// public static ArrayList<MemberDTO> selectinfo() 로 바꾼다
			return list;
		}
}
