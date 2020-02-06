package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.BetDelDAO;
import com.ryan.dao.BoardDelDAO;
import com.ryan.dto.viewDTO;

@WebServlet("/BetDelServlet")
public class BetDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BetDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String num = request.getParameter("num");
		int n = Integer.parseInt(num);

		BetDelDAO.BetDel(n);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료');");
		out.println("location.href='./sportsinfo.ap'");
		out.println("</script>");
		//response.sendRedirect("board.ap");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
