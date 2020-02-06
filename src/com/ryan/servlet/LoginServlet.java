package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.ChargeDAO;
import com.ryan.dao.MemberDAO;
import com.ryan.dto.MemberDTO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
		
					response.setContentType("text/html;charset=utf-8");
					request.setCharacterEncoding("utf-8");
		
					
					DecimalFormat df = new DecimalFormat("00");
					Calendar currentCalendar = Calendar.getInstance();
					String last1 = df.format(currentCalendar.get(Calendar.DATE));
					int last2 = Integer.parseInt(last1);
					// 1. 세션 사용하기
					HttpSession session = request.getSession();

					// 2. 로그인.jsp 에서 받아온 아이디,비번 정보
					String id = request.getParameter("id");  
					String pw = request.getParameter("pw");

					// 3. script 문 사용하기위해 씀
					PrintWriter out = response.getWriter();
					
					
					
					
					// MemberDAO 파일속 select(String tid, String tpw) 메소드에 tid,tpw 값을 넣으면서 작동한다
					// ex) tid = id   , tpw = pw   
					// MemberDTO dto변수로 Getter 메소드들을 호출함  
					MemberDTO b = MemberDAO.select(id, pw);
					//int d = ChargeDAO.Dayday();
					
				
					/* 
					if(last1.equals(b.getLast())) {
						ChargeDAO.Dayday();
						ChargeDAO.DayChance();
					}
					
					*/
					//ChargeDAO.Dayday();
					//ChargeDAO.DayChance();
					// 날짜 수정
					//MemberDAO.update(id);
					
					
					
					// 다시 정보 갱신
					MemberDTO dto = MemberDAO.select(id, pw);

					
					// 5. DBClass에서 받아온 dto 값 확인
					// null or not null
					if (dto == null) {
						
						// 로그인 실패
						// 스크립트 발동
						out.println("<Script>alert('정보가 맞지않습니다.'); history.back();</script>");

					} else {
						
						if(last2 != dto.getLast()) {
							ChargeDAO.Dayday();
							ChargeDAO.DayChance();
						}
						MemberDAO.update(id);
						
						
						// 6. 세션 설정
						// session.setAttribute("변수", "값");
						// 세션: name 변수에는 DB속 Name값이 들어감
						session.setAttribute("id", dto.getId());
						session.setAttribute("name", dto.getName());
						session.setAttribute("level", dto.getLevel());
						session.setAttribute("point", dto.getPoint());
						session.setAttribute("charge", dto.getCharge());
						session.setAttribute("pointlimit", dto.getPointlimit());
						session.setAttribute("admin", dto.getAdmin());
						
						
						// 페이지에 출력
						response.getWriter().append("로그인 성공");
						// 페이지 이동
						response.sendRedirect("./info.ap");
					}	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
