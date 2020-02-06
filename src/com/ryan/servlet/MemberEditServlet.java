package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ryan.dao.MemberDAO;

@WebServlet("/MemberEditServlet")
public class MemberEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEditServlet() {
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
	 String i = request.getParameter("point");
	 int point = Integer.parseInt(i);
	 String i2 = request.getParameter("level");
	 int level = Integer.parseInt(i2);
	 
	 
	
	 
	 // 2. 클라이언트에서 받은 데이터를
	 // insert(String id, String pw, String name,String email,String phone) 
	 // 메소드에 삽입
	 // insert 메소드 작동 결과 값을 result 변수에 삽입 (1 or 0)
	 int result = MemberDAO.MemberEdit(id, pw, name, point, level);
	 
	 
	if(result == 0 ) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경 완료');");
		script.println("window.close();");
		script.println("</script>");
		
	}
	else {
		
		out.println("<Script> alert('수정 실패'); history.back(); </script>");
		
	}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
