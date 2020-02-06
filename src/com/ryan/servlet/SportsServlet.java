package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.BoardinsertDAO;
import com.ryan.dao.SportsinsertDAO;

@WebServlet("/sportsServlet")
public class SportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SportsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String id = null;
		String time = request.getParameter("time");
		String home = request.getParameter("home");
		String homeb = request.getParameter("homeb");
		String draw = request.getParameter("draw"); 
		String hup = request.getParameter("hup");
		String aup = request.getParameter("aup");
		String away = request.getParameter("away");
		String awayb = request.getParameter("awayb");
		String doing = request.getParameter("doing"); 
	System.out.println(id+ time + home + homeb + draw+ hup + aup + away+ awayb+ doing);
		

		SportsinsertDAO b = new SportsinsertDAO();
		int a = b.SportsWrite(id, time , home , homeb , draw , hup , aup , away, awayb, doing);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("window.close();");
		script.println("</script>");
		//response.sendRedirect("./cross.ap");

		if(a == 1) {
			System.out.println("성공");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
