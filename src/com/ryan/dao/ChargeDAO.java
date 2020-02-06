package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ryan.dto.MemberDTO;

public class ChargeDAO {
	
		// 충전하기
		public static MemberDTO Charge(String pid, int ppoint , int ppointlimit , int pcharge) {

			Connection conn = null;
			PreparedStatement stmt = null;
			int presult = (ppointlimit - ppoint);
			int repoint = ppoint;
			MemberDTO result2 = null;
			//System.out.println(ppointlimit);
			//System.out.println(ppoint);
//			DecimalFormat df = new DecimalFormat("00");
//			Calendar currentCalendar = Calendar.getInstance();
//			String last = df.format(currentCalendar.get(Calendar.DATE));
			
			try {
				// 1. 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");

				// 2. 연결하기
				String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
				conn = DriverManager.getConnection(url, "root", "root");
				
				
				if(ppoint <= ppointlimit) {
				String sql = "Update member set point = point + ? , charge = charge + ? , pointlimit = ? where id = ?";
				
				// 3. 쿼리 수행을 위한 Statement 객체 생성
				stmt = conn.prepareStatement(sql);
				
				stmt.setInt(1, ppoint);
				stmt.setInt(2, ppoint);
				stmt.setInt(3, presult);
				stmt.setString(4, pid);
				result2 = new MemberDTO();
				
				result2.setPointlimit(presult);
				
				stmt.executeUpdate();
				}else {
					result2 = null;
					System.out.println("포인트 적립 실패");
				
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

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result2;
		}


		
		
		// 포인트,한도 갱신
		// 데이터 보기  (select)
			public static MemberDTO refresh(String id) {
				Connection conn = null;
				PreparedStatement stmt = null;
				MemberDTO dto =null;
				ResultSet rs = null; 

				
				int ret = 0;
				
				try {
					Class.forName("com.mysql.jdbc.Driver");

					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "SELECT * FROM member where id = ?";

					stmt = conn.prepareStatement(sql);
					
					stmt.setString(1, id);


					rs = stmt.executeQuery();
					
					
					if (rs.next()) {
						
						
						int point = rs.getInt("point");
						int pointlimit = rs.getInt("pointlimit");
						int charge = rs.getInt("charge");
						int last = rs.getInt("last");
						dto = new MemberDTO();
						dto.setPoint(point);
						dto.setCharge(charge);
						dto.setPointlimit(pointlimit);
						dto.setLast(last);
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
				// dto 데이터를 반환한다
				// ex) public static void select(String tid, String tpw)
				// void를 MemberDTO로 바꾸면 외부로 반환이 가능하다
				// ex) public static MemberDTO select(String tid, String tpw)
				return dto;
				
			}
	
			
			//일일 충전량 초기화 : 00시가 되면 charge 초기화
			public static int Dayday() {
				Connection conn = null;
				PreparedStatement stmt = null;
				
				// sql 결과값을 rs에 넣는다
				ResultSet rs = null; 

				
				int charge = 1;
				
				try {
					// 1. 드라이버 로딩
					Class.forName("com.mysql.jdbc.Driver");

					// 2. 연결하기
					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
				
					
					String sql = "UPDATE member set charge = 0";

					// 3. 쿼리 수행을 위한 Statement 객체 생성
					stmt = conn.prepareStatement(sql);
					
					// where id = 'tid' 이랑 비슷하다.
					//stmt.setString(1, id);
					


					// 4. 쿼리 수행
					// 레코드들은 ResultSet 객체에 추가된다.
					stmt.executeUpdate();
					
					charge = 0;
					
				
					
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
				// dto 데이터를 반환한다
				// ex) public static void select(String tid, String tpw)
				// void를 MemberDTO로 바꾸면 외부로 반환이 가능하다
				// ex) public static MemberDTO select(String tid, String tpw)
				return charge;
			}
			
			// 일일 충전량 초기화
			public static int DayChance() {
				Connection conn = null;
				PreparedStatement stmt1 = null;
				PreparedStatement stmt2 = null;
				PreparedStatement stmt3 = null;
				PreparedStatement stmt4 = null;
				// sql 결과값을 rs에 넣는다
				ResultSet rs = null; 

				
				int charge = 1;
				
				try {
					// 1. 드라이버 로딩
					Class.forName("com.mysql.jdbc.Driver");

					// 2. 연결하기
					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
				
					
					String sql1 = "UPDATE member set pointlimit = 10000 where level='1'";
					String sql2 = "UPDATE member set pointlimit = 100000 where level='2'";
					String sql3 = "UPDATE member set pointlimit = 500000 where level='3'";
					String sql4 = "UPDATE member set pointlimit = 1000000 where level='4'";

					// 3. 쿼리 수행을 위한 Statement 객체 생성
					stmt1 = conn.prepareStatement(sql1);
					stmt2 = conn.prepareStatement(sql2);
					stmt3 = conn.prepareStatement(sql3);
					stmt4 = conn.prepareStatement(sql4);
					
					// where id = 'tid' 이랑 비슷하다.
					//stmt.setString(1, id);
					


					// 4. 쿼리 수행
					// 레코드들은 ResultSet 객체에 추가된다.
					stmt1.executeUpdate();
					stmt2.executeUpdate();
					stmt3.executeUpdate();
					stmt4.executeUpdate();
					
					charge = 0;
					
				
					
				} catch (ClassNotFoundException e) {
					System.out.println("드라이버 로딩 실패");
				} catch (SQLException e) {
					System.out.println("에러 " + e);
				} finally {
					try {
						if (conn != null && !conn.isClosed()) {
							conn.close();
						}
						if (stmt1 != null && !stmt1.isClosed()) {
							stmt1.close();
						}
						if (stmt2 != null && !stmt2.isClosed()) {
							stmt2.close();
						}
						if (stmt3 != null && !stmt3.isClosed()) {
							stmt3.close();
						}
						if (stmt4 != null && !stmt4.isClosed()) {
							stmt4.close();
						}
						if (rs != null && !rs.isClosed()) {
							rs.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				// dto 데이터를 반환한다
				// ex) public static void select(String tid, String tpw)
				// void를 MemberDTO로 바꾸면 외부로 반환이 가능하다
				// ex) public static MemberDTO select(String tid, String tpw)
				return charge;
			}
			
			
			
			
			
			/*
			// 충전하기 1
			public static MemberDAO Charge1(String pid  , int pcharge) {
				Connection conn = null;
				PreparedStatement stmt = null;

				MemberDAO result2 = null;
				
				
				try {
					Class.forName("com.mysql.jdbc.Driver");

					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "Update member set  charge = charge + ? where id = ?";
					
					stmt = conn.prepareStatement(sql);
					

					stmt.setInt(1, pcharge);
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
			
			
			//충전하기2
			public static MemberDAO Charge2(String pid, int ppoint ) {
				Connection conn = null;
				PreparedStatement stmt = null;
				
				int repoint = ppoint;
				
				MemberDAO result2 = null;
				
				
				try {
					Class.forName("com.mysql.jdbc.Driver");

					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "Update member set point = point + ?  where id = ?";
					
					stmt = conn.prepareStatement(sql);
					
					stmt.setInt(1, ppoint);
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
			
			
			// 충전하기 3
			public static MemberDAO Charge3(String pid  , int pointlimit) {
				Connection conn = null;
				PreparedStatement stmt = null;

				MemberDAO result2 = null;
				
				
				try {
					Class.forName("com.mysql.jdbc.Driver");

					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "Update member set  pointlimit =  ? where id = ?";
					
					stmt = conn.prepareStatement(sql);
					

					stmt.setInt(1, pointlimit);
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
			
			
			
			// 충전하기 4
			public static MemberDAO Charge4(String pid  , int pcharge) {
				Connection conn = null;
				PreparedStatement stmt = null;

				MemberDAO result2 = null;
				
				
				try {
					Class.forName("com.mysql.jdbc.Driver");

					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "Update member set  charge =  charge - ? where id = ?";
					
					stmt = conn.prepareStatement(sql);
					

					stmt.setInt(1, pcharge);
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
			*/
			
			
			
			
			
			
			
			
			
}
