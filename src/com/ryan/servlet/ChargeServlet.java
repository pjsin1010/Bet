package com.ryan.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ryan.dao.ChargeDAO;
import com.ryan.dto.MemberDTO;

@WebServlet("/ChargeServlet")
public class ChargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChargeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 한글 깨짐 방지
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
		
					// 1. 세션 사용하기
					HttpSession session = request.getSession();
					
					// 2. 로그인.jsp 에서 받아온 아이디,비번 정보
					 String id = (String) session.getAttribute("id"); 
					
					String i = request.getParameter("point");
					int point = Integer.parseInt(i);
					//System.out.print(point+1);
					PrintWriter out = response.getWriter();
					
					
					int pointlimit = ((Integer)(session.getAttribute("pointlimit"))).intValue();
					int charge = ((Integer)(session.getAttribute("charge"))).intValue();
					
					//MemberDAO.Charge(id, point, pointlimit, charge);

					// 3. script 문 사용하기위해 씀
					//PrintWriter out = response.getWriter();
					//System.out.println( point);
					//System.out.println(id + "/" + point + "/" +pointlimit + "/" +charge);
//					if(pointlimit <= point) {
//						 PrintWriter out = response.getWriter();
//						 out.println("<Script>alert('한도초과입니다.'); history.back();</script>");
//							}
					MemberDTO dto2 = ChargeDAO.Charge(id,point,pointlimit,charge);
					
					
					
				//MemberDAO dto = new MemberDAO();
					MemberDTO dto = ChargeDAO.refresh(id); //포인트 갱신용
					//System.out.println(dto2.getPointlimit());
					//dto.refresh(id);
					if(dto2 == null){
						System.out.println("포인트 적립 실패 확인!");
						out.println("<script> alert('포인트 한도가 초과되었습니다.'); history.back();</script>");
							
					
					
					}else {
							if(dto != null) {
								session.setAttribute("point", dto.getPoint());
								session.removeAttribute("pointlimit");
								
								session.setAttribute("pointlimit", dto2.getPointlimit());
								session.setAttribute("charge", dto.getCharge());
								out.println("<script>");
								out.println("alert('충전 완료하였습니다.');");
								out.println("location.href='home.ap'");
								out.println("</script>");
								//response.sendRedirect("home.ap");
							  }
						
					
					}

					
					
					// 다른방식
					
					
					/*
					
					// 충전하기 
					if(uris[2].equals("hcharge.ap")) {
					HttpSession session = request.getSession();
					PrintWriter out = response.getWriter();
					 String id = (String) session.getAttribute("id"); 
					
					String i = request.getParameter("point");
					int point = Integer.parseInt(i);
					
					
					int level = ((Integer)(session.getAttribute("level"))).intValue();
					int pointlimit = ((Integer)(session.getAttribute("pointlimit"))).intValue();
					int charge = ((Integer)(session.getAttribute("charge"))).intValue();

					
					if( level == 1) {
					if ( point > 10000) {
						out.println("<script> alert('초과'); history.back();</script>");
					}
					if(charge > 10000) {
						out.println("<script> alert('초과'); history.back();</script>");
					}
					else if (charge < 10001 &&  level == 1) {
					MemberDAO.Charge1(id,point);

					MemberDTO dto = MemberDAO.refresh(id);
					
					if(dto.getCharge() < 10001) {
						
						MemberDAO.Charge2(id, point);
						int b = 10000;
						int c = b - dto.getCharge();
						MemberDAO.Charge3(id, c);
						MemberDTO dto1 = MemberDAO.refresh(id);
						session.setAttribute("point", dto1.getPoint());
						session.setAttribute("pointlimit", dto1.getPointlimit());
						session.setAttribute("charge", dto1.getCharge());
						
						response.sendRedirect("home.ap");
					}
					else {
						
						MemberDAO.Charge4(id, point);
						out.println("<script> alert('초과'); history.back();</script>");
					}
					}
					
					}
					
					
					if( level == 2) {
						if ( point > 100000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						if(charge > 100000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						else if (charge < 100001 &&  level == 2) {
						MemberDAO.Charge1(id,point);

						MemberDTO dto = MemberDAO.refresh(id);
						
						if(dto.getCharge() < 100001) {
							
							MemberDAO.Charge2(id, point);
							int b = 100000;
							int c = b - dto.getCharge();
							MemberDAO.Charge3(id, c);
							MemberDTO dto1 = MemberDAO.refresh(id);
							session.setAttribute("point", dto1.getPoint());
							session.setAttribute("pointlimit", dto1.getPointlimit());
							session.setAttribute("charge", dto1.getCharge());
							
							response.sendRedirect("home.ap");
						}
						else {
							
							MemberDAO.Charge4(id, point);
							out.println("<script> alert('초과'); history.back();</script>");
						}
						}
						
						}
					
					
					
					
					
					if( level == 3) {
						if ( point > 500000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						if(charge > 500000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						else if (charge < 500001 &&  level == 3) {
						MemberDAO.Charge1(id,point);

						MemberDTO dto = MemberDAO.refresh(id);
						
						if(dto.getCharge() < 500001) {
							
							MemberDAO.Charge2(id, point);
							int b = 500000;
							int c = b - dto.getCharge();
							MemberDAO.Charge3(id, c);
							MemberDTO dto1 = MemberDAO.refresh(id);
							session.setAttribute("point", dto1.getPoint());
							session.setAttribute("pointlimit", dto1.getPointlimit());
							session.setAttribute("charge", dto1.getCharge());
							
							response.sendRedirect("home.ap");
						}
						else {
							
							MemberDAO.Charge4(id, point);
							out.println("<script> alert('초과'); history.back();</script>");
						}
						}
						
						}

					
					
					if( level == 4) {
						if ( point > 1000000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						if(charge > 1000000) {
							out.println("<script> alert('초과'); history.back();</script>");
						}
						else if (charge < 1000001 &&  level == 4) {
						MemberDAO.Charge1(id,point);

						MemberDTO dto = MemberDAO.refresh(id);
						
						if(dto.getCharge() < 1000001) {
							
							MemberDAO.Charge2(id, point);
							int b = 1000000;
							int c = b - dto.getCharge();
							MemberDAO.Charge3(id, c);
							MemberDTO dto1 = MemberDAO.refresh(id);
							session.setAttribute("point", dto1.getPoint());
							session.setAttribute("pointlimit", dto1.getPointlimit());
							session.setAttribute("charge", dto1.getCharge());
							
							response.sendRedirect("home.ap");
						}
						else {
							
							MemberDAO.Charge4(id, point);
							out.println("<script> alert('초과'); history.back();</script>");
						}
						}
						

					
					}
					*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
