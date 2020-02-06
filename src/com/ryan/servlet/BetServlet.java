package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.BettingDAO;
import com.ryan.dao.ChargeDAO;
import com.ryan.dto.MemberDTO;

@WebServlet("/BetServlet")
public class BetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
		HttpSession Session= request.getSession();
		PrintWriter out = response.getWriter();
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String last = df.format(currentCalendar.get(Calendar.DATE));
		
		 String id = (String) Session.getAttribute("id"); 
		 
		 
		 MemberDTO dto = ChargeDAO.refresh(id);
		 
		 String i3 = request.getParameter("num");
		 int po = Integer.parseInt(i3);
		 String i = request.getParameter("bet");
		 int bet = Integer.parseInt(i);
		 
		 if (dto.getPoint() < bet) {
			 out.println("<script> alert('포인트가 부족합니다.'); history.back();</script>");
		 }
		 else {
			 BettingDAO.Charge1(id,bet);
			 out.println("<script> alert('배팅되었습니다.'); ");
		 
		 String time = request.getParameter("time");
		 String home = request.getParameter("home");
		 String homeb = request.getParameter("homeb");
		 
		 
		 String draw = request.getParameter("draw");
		 
		 String hup = request.getParameter("hup");
		 String aup = request.getParameter("aup");
		 String away = request.getParameter("away");
		 String awayb = request.getParameter("awayb");

		 String doing = request.getParameter("doing");
		 
		 
		 
		 BettingDAO.bet(id,time,home,homeb,draw,awayb,away,bet,po,hup,aup,doing);
		 
		 MemberDTO dto1 = ChargeDAO.refresh(id);
		 Session.setAttribute("point", dto1.getPoint());
		 
		 response.sendRedirect("mybet.ap");
		 
	}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
