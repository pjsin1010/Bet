package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.BetsEditDAO;

@WebServlet("/BetsEditServlet")
public class BetsEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BetsEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String i3 = request.getParameter("num");
		int po = Integer.parseInt(i3);
		
	    String result = request.getParameter("result");
		String doing = request.getParameter("doing");
		
		BetsEditDAO.BetEdit(result, po, doing);
		
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정 완료');");
		out.println("window.close();");
		out.println("</script>");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
