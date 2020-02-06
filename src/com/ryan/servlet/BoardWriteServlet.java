package com.ryan.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.BoardinsertDAO;

@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		//작성자
		String name = (String) session.getAttribute("name");
		
		int level = ((Integer)(session.getAttribute("level"))).intValue();
		//타이틀
		String title = request.getParameter("title");
		//내용
		String board = request.getParameter("board");
		//System.out.println(id +" "+name+" "+" "+title+" "+board );
		
		BoardinsertDAO s = new BoardinsertDAO();
		int a = s.boardWrite(id, name, title , board, level);
		response.sendRedirect("board.ap");
		
		if(a == 1) {
		System.out.println("성공");
		}
		
		
		//int dto = MemberDAO.boardWrite(id,name);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
