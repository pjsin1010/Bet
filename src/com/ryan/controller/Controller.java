package com.ryan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.BettingDAO;
import com.ryan.dao.BoardDelDAO;
import com.ryan.dao.BoardEditDAO;
import com.ryan.dao.BoardListDAO;
import com.ryan.dao.BoardinsertDAO;
import com.ryan.dao.ChargeDAO;
import com.ryan.dao.JoinCheckDAO;
import com.ryan.dao.MemberDAO;
import com.ryan.dto.MemberDTO;
import com.ryan.dto.viewDTO;
import com.ryan.dao.JoinCheckDAO;

@WebServlet("*.ap")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String[] uris = uri.split("/");

		// 회원가입
		if (uris[2].equals("mb_ok.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./JoinServlet");
			dis.forward(request, response);
		}

		// 중복검사
		if (uris[2].equals("Check.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./CheckServlet");
			dis.forward(request, response);
		}

		// 로그인
		if (uris[2].equals("lg_ok.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./LoginServlet");
			dis.forward(request, response);
		}

		// 회원정보 출력
		if (uris[2].equals("info.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./MemberInfoServlet");
			dis.forward(request, response);

		}

		// 충전 하기
		if (uris[2].equals("hcharge.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./ChargeServlet");
			dis.forward(request, response);
		}

		// 배팅 하기
		if (uris[2].equals("betting.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./BetServlet");
			dis.forward(request, response);

		}

		//경기등록
		if (uris[2].equals("sportsinsert.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./SportsServlet");
			dis.forward(request, response);

		}
		
		
		
		// 게시판 글쓰기
		if (uris[2].equals("insert.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./BoardWriteServlet");
			dis.forward(request, response);
		}

		// 글보기
		if (uris[2].equals("view.ap")) {
			String num = request.getParameter("num");
			int n = Integer.parseInt(num);
			RequestDispatcher dis = request.getRequestDispatcher("./html/view.jsp");
		}

		// 글 수정 완료
		if (uris[2].equals("edit_ok.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./BoardEditServlet");
			dis.forward(request, response);
		}

		// 글삭제
		if (uris[2].equals("del.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./BoardDelServlet");
			dis.forward(request, response);
		}

		// 댓글 작성
		if(uris[2].equals("commendinsert.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./CommendinsertServlet");
			dis.forward(request, response);
		}
		
		// 댓글 삭제
		if(uris[2].equals("commentdel.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./CommendDelServlet");
		dis.forward(request, response);
		}
		
		// 어드민 경기 삭제
		if(uris[2].equals("betdel.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./BetDelServlet");
		dis.forward(request, response);
		}
		
		// 어드민 배팅내역 삭제
		if(uris[2].equals("betdetaildel.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./BetdetaildelServlet");
		dis.forward(request, response);
		}
		
		// 어드민 계정 삭제
		if(uris[2].equals("memberdel.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./MemberDelServlet");
		dis.forward(request, response);
		}
		
		// 어드민 배팅내역 수정
		if(uris[2].equals("betsEdit.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./BetsEditServlet");
		dis.forward(request, response);
		}
		
		// 어드민 계정 수정
		if(uris[2].equals("memberEdit.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./MemberEditServlet");
		dis.forward(request, response);
		}
		
		
		
		
		// 홈페이지 메뉴판 이동
		if (uris[2].equals("home.ap")) {
			
			RequestDispatcher dis = request.getRequestDispatcher("./html/home2.jsp");
			dis.forward(request, response);

		}
		// 크로스
		if (uris[2].equals("cross.ap")) {
			// response.sendRedirect("./html/cross.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/cross.jsp");
			dis.forward(request, response);
		}
		// 경기결과
		if (uris[2].equals("result.ap")) {
			// response.sendRedirect("./html/result.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/result.jsp");
			dis.forward(request, response);
		}
		// 자유게시판
		if (uris[2].equals("board.ap")) {
			// response.sendRedirect("./html/board.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/board.jsp");
			dis.forward(request, response);
		}
		
		// 충전하기
		if (uris[2].equals("charge.ap")) {
			// response.sendRedirect("./htmlcharge.jsp");

			RequestDispatcher dis = request.getRequestDispatcher("./html/charge.jsp");
			dis.forward(request, response);
		}
		// 배팅내역
		if (uris[2].equals("mybet.ap")) {
			// response.sendRedirect("./htmlcharge.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/mybet.jsp");
			dis.forward(request, response);
		}
		// 글쓰기
		if (uris[2].equals("write.ap")) {
			// response.sendRedirect("./htmlcharge.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/write.jsp");
			dis.forward(request, response);
		}
		// 글보기
		if (uris[2].equals("view.ap")) {
			// response.sendRedirect("./htmlcharge.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/view.jsp");
			dis.forward(request, response);
		}
		// 글수정
		if (uris[2].equals("edit.ap")) {
			// response.sendRedirect("./htmlcharge.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./html/edit.jsp");
			dis.forward(request, response);
		}
		// 경기등록
		if(uris[2].equals("inser.ap")) {
			RequestDispatcher dis = request.getRequestDispatcher("./html/test2.jsp");
			dis.forward(request, response);
		}
		
		
		
		
		
		
		// 어드민 홈페이지 접속
		if(uris[2].equals("admin.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./admin/index.jsp");
		dis.forward(request, response);
		}
			
		
		// 어드민 경기 상태 접속
		if(uris[2].equals("sportsinfo.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./admin/info.jsp");
		dis.forward(request, response);
		}
		
		// 어드민 경기 결과 접속
		if(uris[2].equals("resultinfo.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./admin/resultinfo.jsp");
		dis.forward(request, response);
		}
		
		// 어드민 배팅내역 접속
		if(uris[2].equals("betinfo.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./admin/betinfo.jsp");
		dis.forward(request, response);
		}
		
		// 어드민 회원관리 접속
		if(uris[2].equals("memberinfo.ap")) {
		RequestDispatcher dis = request.getRequestDispatcher("./admin/memberinfo.jsp");
		dis.forward(request, response);
		}
		
	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
