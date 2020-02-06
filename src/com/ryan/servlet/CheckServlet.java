package com.ryan.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.JoinCheckDAO;

@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userId");  
		String email = request.getParameter("Email");  
		String phone = request.getParameter("Phone"); 
		String name = request.getParameter("Name"); 
			// 아이디 중복검사
		
				if(id != null) {
				// 2. 회원가입.jsp 에서 받아온 아이디,비번 정보
			    response.getWriter().println(JoinCheckDAO.select(id));	
				}
						
				// 이메일 중복검사
				if(email != null) {
				// 2. 회원가입.jsp 에서 받아온 이메일 정보
				response.getWriter().println(JoinCheckDAO.select2(email));
				}
				
				// 닉네임 중복검사
				if(name != null) {
				// 2. 회원가입.jsp 에서 받아온 전화번호 정보
				response.getWriter().println(JoinCheckDAO.select4(name));		
				}
				
				// 전화번호 중복검사
				if(phone != null) {
				// 2. 회원가입.jsp 에서 받아온 전화번호 정보
				response.getWriter().println(JoinCheckDAO.select3(phone));		
				}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
