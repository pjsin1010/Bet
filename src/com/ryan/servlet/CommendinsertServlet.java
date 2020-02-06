package com.ryan.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.BoardinsertDAO;
import com.ryan.dao.CommendinsertDAO;

@WebServlet("/CommendinsertServlet")
public class CommendinsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommendinsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

HttpSession session = request.getSession();

String name = (String) session.getAttribute("name");

int level = ((Integer)(session.getAttribute("level"))).intValue();

String content = request.getParameter("content");
String o = request.getParameter("num");
int parent_num = Integer.parseInt(o);


CommendinsertDAO s = new CommendinsertDAO();
int a = s.cominsert(name, level,content,parent_num);
response.sendRedirect("view.ap?num="+parent_num);
// RequestDispatcher dis = request.getRequestDispatcher("./html/view.jsp");

if(a == 1) {
System.out.println("성공");
}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
