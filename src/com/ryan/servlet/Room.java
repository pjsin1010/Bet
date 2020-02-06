package com.ryan.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Room")
public class Room extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Room() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		
		//System.out.println(uri);  // /controller/a.ap
		//System.out.println(url);  //  http://localhost:8080/controller/a.ap
		
		
		String [] uris = uri.split("/"); //  /로 다자름
		
		// 주소:  공백/controller/a.ap
		//System.out.println("1. " +uris[0]);      // 공백
		//System.out.println("2. " +uris[1]);      // controller
		//System.out.println("3. " +uris[2]);      // a.ap
		System.out.println("4. " +uris[uris.length - 1]);  
		String ap= uris[uris.length - 1];
		String path = "";
		if(ap.equals("login.ap")) {
			System.out.println("로그인");
			path="lg_ok";

		}

		else if(ap.equals("join.ap")) {
			System.out.println("회원가입");
			path="mb_ok";
		}
		else if(ap.equals("start.ap")){
			System.out.println("게임시작");
			path="lg_ok";
		}
		
		else if(ap.equals("main.ap")){
			System.out.println("메인");
			path="info";
		}
		
		else {
			System.out.println("잘못된 경로");
		}
		
		// 정보를 담아 dis에 삽입 후 Servlet 쪽으로 이동
		RequestDispatcher dis = request.getRequestDispatcher(path);
		dis.forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
