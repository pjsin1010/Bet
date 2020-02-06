package com.ryan.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ryan.dto.MemberDTO;

public class JoinCheckDAO {
	// 아이디 중복검사
			public static int select(String pid) {
				Connection conn = null;
				PreparedStatement stmt = null;
				
				// sql 결과값을 rs에 넣는다
				ResultSet rs = null; 

				
				int ret = 0;
				
				try {
					// 1. 드라이버 로딩
					Class.forName("com.mysql.jdbc.Driver");

					// 2. 연결하기
					String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
					conn = DriverManager.getConnection(url, "root", "root");
					
					
					String sql = "SELECT * FROM member where id = ?";

					// 3. 쿼리 수행을 위한 Statement 객체 생성
					stmt = conn.prepareStatement(sql);
					
					// where id = 'tid' 이랑 비슷하다.
					stmt.setString(1, pid);


					// 4. 쿼리 수행
					// 레코드들은 ResultSet 객체에 추가된다.
					rs = stmt.executeQuery();
					
					
					// 5. 실행결과 출력하기
					// rs.next() 는 데이터 나온값들을 계속 출력 (True)
					// 값이 더이상 없으면 (False)
					if (rs.next()) {
						
						ret = 1;
						String id = rs.getString("id");
						
						MemberDTO dto = new MemberDTO();
						
						dto.setId(id);
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
				return ret;
			}
		
		
			
			
			
			
		
		
		
					
				
					// 이메일 중복검사
					public static int select2(String email) {
						Connection conn = null;
						PreparedStatement stmt = null;
						
						// sql 결과값을 rs에 넣는다
						ResultSet rs = null; 

						
						int ret = 0;
						
						try {
							Class.forName("com.mysql.jdbc.Driver");

							String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
							conn = DriverManager.getConnection(url, "root", "root");
							
							
							String sql = "SELECT * FROM member where email = ?";

							stmt = conn.prepareStatement(sql);
							
							stmt.setString(1, email);


							rs = stmt.executeQuery();
							
							
							if (rs.next()) {
								
								ret = 1;
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
						return ret;
					}
			
					// 전화번호 중복검사
						public static int select3(String phone) {
							Connection conn = null;
							PreparedStatement stmt = null;
							
							// sql 결과값을 rs에 넣는다
							ResultSet rs = null; 

							
							int ret = 0;
							
							try {
								Class.forName("com.mysql.jdbc.Driver");

								String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
								conn = DriverManager.getConnection(url, "root", "root");
								
								
								String sql = "SELECT * FROM member where phone = ?";

								stmt = conn.prepareStatement(sql);
								
								stmt.setString(1, phone);


								rs = stmt.executeQuery();
								
								
								if (rs.next()) {
									
									ret = 1;
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
							return ret;
						}
						
						
						// 닉네임 중복검사
						public static int select4(String name) {
							Connection conn = null;
							PreparedStatement stmt = null;
							
							// sql 결과값을 rs에 넣는다
							ResultSet rs = null; 

							
							int ret = 0;
							
							try {
								Class.forName("com.mysql.jdbc.Driver");

								String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
								conn = DriverManager.getConnection(url, "root", "root");
								
								
								String sql = "SELECT * FROM member where name = ?";

								stmt = conn.prepareStatement(sql);
								
								stmt.setString(1, name);


								rs = stmt.executeQuery();
								
								
								if (rs.next()) {
									
									ret = 1;
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
							return ret;
						}
}
