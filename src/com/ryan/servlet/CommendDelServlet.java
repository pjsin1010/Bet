package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.CommendDelDAO;
import com.ryan.dao.CommendinsertDAO;

@WebServlet("/CommendDelServlet")
public class CommendDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommendDelServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		
		String o = request.getParameter("num");
		int parent_num = Integer.parseInt(o);
		
		String p = request.getParameter("num1");
		int num = Integer.parseInt(p);
		


		CommendDelDAO s = new CommendDelDAO();
		int a = s.comdel(num);
		
		response.sendRedirect("view.ap?num="+parent_num);
		// RequestDispatcher dis = request.getRequestDispatcher("./html/view.jsp");

		if(a == 1) {
		System.out.println("삭제 성공");
		}
			}
	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
