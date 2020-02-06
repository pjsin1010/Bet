package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.MemberDAO;
import com.ryan.dto.MemberDTO;

@WebServlet("/MemberInfoServlet")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoServlet() {
        super();
    }

    // 접속 아이피
    public static String getClientIp(HttpServletRequest req) {
        String ip = req.getHeader("X-Forwarded-For");
        if (ip == null) ip = req.getRemoteAddr();
        return ip;
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 세션값 받아오기 (object인 값을 강제로 문자열로 변환)
		
		PrintWriter out = response.getWriter();
		HttpSession Session= request.getSession();
		String name = (String) Session.getAttribute("name");
		if (name == null) {	 
			out.println("<script> alert('로그인 하세요'); history.back();</script>");
			
		} else {
			String ip = getClientIp(request);
			// 로그인 됨
			System.out.println("접속 아이디: " + name);
			System.out.println("접속 아이피: " + ip);
		}
		
		
		
		
		// 1. DBClass 파일에 있는 selectinfo() 메소드에
		// 반환된 값(return list)를 mlist 변수에 ArrayList배열로 삽입
		//ArrayList<MemberDTO> mlist = MemberDAO.selectinfo();
							// 키 ,  object(ArrayList<MemberDTO>)
		//request.setAttribute("mlist", mlist);
		
		RequestDispatcher dis = request.getRequestDispatcher("./html/home.jsp");
		dis.forward(request, response);
		
		
		// 2. 반환된 값이 들어간 mlist를 
					// MemberDTO m변수로 Getter 메소드들을 호출하며  
					// 값이 없어질때까지 반복
					//for(MemberDTO m : mlist) {

						// DTO에서 받아온 GET 메소드 정보를 시스템에 출력
						// 변수.메소드();
						//System.out.println(m.getId());
						//System.out.println(m.getPw());
						//System.out.println(m.getName());
						//System.out.println(m.getEmail());
						//System.out.println(m.getPhone());
					//}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
