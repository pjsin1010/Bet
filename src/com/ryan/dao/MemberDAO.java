package com.ryan.dao;

import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dto.BetDTO;
import com.ryan.dto.BoardDTO;
import com.ryan.dto.MemberDTO;
import com.ryan.dto.viewDTO;
import com.ryan.sha256.PwHash;
// DAO
public class MemberDAO {
	// 메소드에 static 쓰면 New 생성 할 필요가 없다
	// 메소드 변수 = new 메소드()    X
	// 클래스명.메소드명()           o
	
	
	// 데이터 보기 (전체, SELECT) 
	public static void select() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			String sql = "SELECT * fROM member";

			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			
			
			// 4. 쿼리 수행
			// 레코드들은 ResultSet 객체에 추가된다.
			rs = stmt.executeQuery();

			// 5. 실행결과 출력하기
			// SELECT 결과갯수만큼 반복
			while (rs.next()) {
				
				// 레코드의 칼럼은 배열과 달리 0부터 시작하지 않고 1부터 시작한다.
				// 데이터베이스에서 가져오는 데이터의 타입에 맞게 getString 또는 getInt 등을 호출한다.
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");

				System.out.println(id + " " + pw + " " + name + " " + email + " " + phone);
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
	}

	// 데이터 삽입 (회원가입 , insert)
	public static int insert(String id, String pw, String name, String email, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// 한도초기화 방지용
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String last = df.format(currentCalendar.get(Calendar.DATE));
		
		
		String point = "10000";
		String level = "1";
		String charge = "0";
		String pointlimit = "10000";
		
		
		// 외부로 보낼 결과값 ( 0이면 가입 실패 , 0아니면 가입 성공)
		int count = 0; 
		
		
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
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			// 4. 데이터 binding
			// 위 sql 문에서  ?로 된 모양에 데이터 순서대로 들어감
			pstmt.setString(1, id);
			pstmt.setString(2, PwHash.sha256(pw));
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, point);
			pstmt.setString(7, level);
			pstmt.setString(8, last);
			pstmt.setString(9, charge);
			pstmt.setString(10, pointlimit);
			pstmt.setInt(11, 0);

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
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return count;
	}
	
	
	
	// 데이터 보기 (로그인 , select)
	public static MemberDTO select(String tid, String tpw) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		//String last = df.format(currentCalendar.get(Calendar.DATE));
		
		// sql 결과값을 rs에 넣는다
		ResultSet rs = null; 
		
		
		// MemberDTO dto = new MemberDTO();
		// 괄호 안에있으면 데이터를 밖으로 못가져옴
		// 사용자에게 결과값을 알려주기 위해
		// Loginvlet에서 if(dto == null) 사용함
		
		// 그래서  MemberDTO dto = null;를 하면 
		// dto 값이 기본적인 NULL이고
		// 밑에 있는 if가 TRUE면 dto 값이 NULL이 사라진다
		// 이 방법을 통해 LoginServlet쪽으로 dto 값이 반환되며
		// if(dto == null) 부분에서 작동됨
		MemberDTO dto = null;
		
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			String sql = "SELECT * fROM member where id = ?  AND pw = ?";

			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			
			// where id = 'tid' 이랑 비슷하다.
			stmt.setString(1, tid);
			// AND pw = 'tpw'   이랑 비슷하다.
			stmt.setString(2, PwHash.sha256(tpw));
			
			
			
			// 4. 쿼리 수행
			// 레코드들은 ResultSet 객체에 추가된다.
			rs = stmt.executeQuery();

			// 5. 실행결과 출력하기
			// rs.next() 는 데이터 나온값들을 계속 출력 (True)
			// 값이 더이상 없으면 (False)
			if (rs.next()) {
				
				// 레코드의 칼럼은 배열과 달리 0부터 시작하지 않고 1부터 시작한다.
				// 데이터베이스에서 가져오는 데이터의 타입에 맞게 getString 또는 getInt 등을 호출한다.
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
		
				int last2 = rs.getInt("last");
				int point = rs.getInt("point");
				int level = rs.getInt("level");
				int pointlimit = rs.getInt("pointlimit");
				int charge = rs.getInt("charge");
				int last = rs.getInt("last");
				int admin = rs.getInt("admin");

				
				// 사용자한테 ID,PW 결과를 한번에 알려주고싶으면
				// DTO 만든다
				// MemberDTO dto = new MemberDTO();
				// 위에 말한것처럼 이것은 괄호 안에있으면 데이터를 외부로 못나간다
				// 그래서 괄호 밖에는 MemberDTO dto = null 쓰고
				// 여기선 dto = new MemberDTO();  나눠 쓴다
				
				// if문 TRUE 일경우 dto에 setter 메소드를 작동시킨다
				dto = new MemberDTO();
				
				
				// MemberDTO 파일 안에 있는 setId(String id) 메소드에 매개변수인 id 변수에
				// SELECT * fROM member where id = ?  AND pw = ? 으로 나온 한 데이터중 ( id,pw,name,email,phone)
				// id 데이터를 삽입한다   

				// ex) id = "test"
				// public void setId(String id) {
				// this.id = id;    →   this.id = test
				// }
				
				// 그러면 MemberDTO 파일 안에 있는 Private String id 의 값은 test 이다
				// 외부에서 dto.getId(); 하면 test값이 출력된다
				// 나머지도 같은 방식
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setEmail(email);
				dto.setPhone(phone);
				dto.setLast(last2);
				dto.setLevel(level);
				dto.setPoint(point);
				dto.setPointlimit(pointlimit);
				dto.setCharge(charge);
				dto.setLast(last);
				dto.setAdmin(admin);
			}
			else {
				//
				System.out.println("아이디가 없거나 패스워드가 틀렸다");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러 " + e);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
	 //  로그인 할시  접속날짜 수정
		public static String update(String pid) {
			Connection conn = null;
			PreparedStatement stmt = null;
			
			
			DecimalFormat df = new DecimalFormat("00");
			Calendar currentCalendar = Calendar.getInstance();
			String last = df.format(currentCalendar.get(Calendar.DATE));
			
			try {
				// 1. 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");

				// 2. 연결하기
				String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
				conn = DriverManager.getConnection(url, "root", "root");
				
				
				String sql = "Update member set last = ?  where id = ?";

				// 3. 쿼리 수행을 위한 Statement 객체 생성
				stmt = conn.prepareStatement(sql);
				
				// where id = 'tid' 이랑 비슷하다.
				stmt.setString(1, last);
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
			return last;
		}
	
		
	
	
	
	
	
	
	
	
	// 관리자
	
	// 회원정보 보여주기 ( ArrayList , SELECT)
		public static int memberCount() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			int cnt = 0 ; // 갯수 반환
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
				conn = DriverManager.getConnection(url, "root", "root");
				
				
				String sql = "select count(*) from member";

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
		
		
		
		
		
		
	public static ArrayList<MemberDTO> selectinfo(int start , int exit) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// 한번에 담기위해 MemberDTO 쓴다
		// 클래스명도 타입취급한다
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			String sql = "SELECT * FROM member  limit ?,?";

			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, start);
			stmt.setInt(2, exit);
			
			// 4. 쿼리 수행
			// 레코드들은 ResultSet 객체에 추가된다.
			rs = stmt.executeQuery();

			// 5. 실행결과 출력하기
			// SQL 데이터 나온 값을  없어질 때 까지 반복
			while (rs.next()) {
				
				// 레코드의 칼럼은 배열과 달리 0부터 시작하지 않고 1부터 시작한다.
				// 데이터베이스에서 가져오는 데이터의 타입에 맞게 getString 또는 getInt 등을 호출한다.
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int point = rs.getInt("point");
				int level = rs.getInt("level");
				
				// 값을 다 받기위해 while문 안에 씀
				MemberDTO dto = new MemberDTO();
				
				
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
				
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setEmail(email);
				dto.setPhone(phone);
				dto.setPoint(point);
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

	
	
	
			
	// 회원 관리 시스템
	
	public static MemberDTO MemberView(String num) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		// 한번에 담기위해 MemberDTO 쓴다
		// 클래스명도 타입취급한다
		ArrayList<BoardDTO> list = new ArrayList<>();
		MemberDTO dto = new MemberDTO();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			String sql = "select * from member where id = ?";
			
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, num);
			
			
			rs = stmt.executeQuery();
			
			//System.out.println(rs);

			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				int level = rs.getInt("level");
			
				
				// 값을 다 받기위해 while문 안에 씀
				
				
				
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
				
				dto.setId(id);
				dto.setName(name);
				dto.setPw(pw);
				dto.setPoint(point);
				dto.setLevel(level);
				
				
				
				
				
				//  그후 list에 배열 dto값 삽입
				//  ex)   id: test  /  pw: 1234 / name: 홍길동  / email: aa@aa.com / phone 010-0000-000
				//  [1] : setId(id) , setPw(pw) , setName(name) , setEmail(email) , setPhone(phone) 
				//  위 ex에 있는 값이 들어감
				
				//  while 반복문이므로 위 코드랑 같이 작동되면서 계속 쌓아짐
				//  [2] , [3] , [4]  ..... 
				
				
				
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
		return dto;
		
		
	}
					
					
					
						
   // 회원 수정
	
	public static int MemberEdit(String id, String pw , String name , int point , int level ) {

		Connection conn = null;
		PreparedStatement stmt = null;
		int result2 = 0;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://localhost/zlzone?serverTimezone=Asia/Seoul";
			conn = DriverManager.getConnection(url, "root", "root");
			
			
			if( pw != null) {
			String sql = "Update member set pw = ? , point =  ? , level = ? where id = ?";
			
			// 3. 쿼리 수행을 위한 Statement 객체 생성
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, PwHash.sha256(pw));
			stmt.setInt(2, point);
			stmt.setInt(3, level);
			stmt.setString(4, id);
			}
			else {
				String sql = "Update member set  point =  ? , level = ? where id = ?";
				
				// 3. 쿼리 수행을 위한 Statement 객체 생성
				stmt = conn.prepareStatement(sql);
				
			
				stmt.setInt(1, point);
				stmt.setInt(2, level);
				stmt.setString(3, id);
			}
			
		
			
			stmt.executeUpdate();
			
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러 " + e);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
