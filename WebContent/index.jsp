<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/index.css">
<body>
<h1 align="center"> 접속 </h1>

<%

 String name = (String) session.getAttribute("name");
 if(name == null) {  %>
 
 <!--  세션값 없을시 로그인페이지로 이동 -->
<a href="./html/login.jsp"> 

<% 	 
 }   
 else{ %>
 <!-- 세션값 있으면 바로 메인홈페이지로 이동 -->

	<a href="./html/login.jsp"> 
	 <%
 }
 %>



<div class="ryan">  
  <div class="ear left"></div>
  <div class="ear right"></div>
  
  <div class="face">
    <div class="eyebrow left"></div>
    <div class="eyebrow right"></div>
    <div class="eye left"></div>
    <div class="eye right"></div>
    <div class="nose"> </div>
    
    <div class="mouth left"></div>
    <div class="mouth right"></div>
  </div>
</div>
</a>

</body>
</html>