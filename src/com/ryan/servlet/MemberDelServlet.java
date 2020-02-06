package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.MemberDelDAO;



@WebServlet("/MemberDelServlet")
public class MemberDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String num = request.getParameter("num");
		

		MemberDelDAO.MemberDel(num);
		
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료');");
		out.println("location.href='./memberinfo.ap'");
		out.println("</script>");
		//response.sendRedirect("board.ap");etWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
