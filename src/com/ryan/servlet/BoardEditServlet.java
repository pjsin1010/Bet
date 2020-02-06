package com.ryan.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.BoardEditDAO;
import com.ryan.dto.viewDTO;

@WebServlet("/BoardEditServlet")
public class BoardEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
				
		String num = request.getParameter("num");
		int n = Integer.parseInt(num);
		String title = request.getParameter("title");
		String board = request.getParameter("board");
		viewDTO dto = BoardEditDAO.BEdit(n, title, board);
		response.sendRedirect("view.ap?num="+num);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
