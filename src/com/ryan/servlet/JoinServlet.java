package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.MemberDAO;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
		 // 1. 클라이언트(브라우저)에서 받음 (POST)
		 String id = request.getParameter("id");
		 String pw = request.getParameter("pw");
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String phone = request.getParameter("phone");
		 
		 
		
		 
		 // 2. 클라이언트에서 받은 데이터를
		 // insert(String id, String pw, String name,String email,String phone) 
		 // 메소드에 삽입
		 // insert 메소드 작동 결과 값을 result 변수에 삽입 (1 or 0)
		 int result = MemberDAO.insert(id, pw, name, email, phone);
		 
		 
		if(result == 0 ) {
			// 에러 페이지 이동
			//response.sendRedirect("joinerr.jsp");
			out.println("<Script> alert('중복된 아이디입니다'); history.back(); </script>");
		}
		else {
			// 메인 or 로그인페이지 이동
			response.sendRedirect("./html/mb_ok.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
