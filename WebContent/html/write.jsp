<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.ryan.dao.MemberDAO" %>
<%@ page import ="com.ryan.dto.*" %>
<%@ page import ="java.io.PrintWriter" %>
<%

// 세션 없을시 접근 금지
if (session.getAttribute("name") == null) {
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요');");
	script.println("history.back();");
	script.println("</script>");
	%>
	<%	} %>
	
<%
	// 세션값 받아오기 (object인 값을 강제로 문자열로 변환)
	String name = (String) session.getAttribute("name");
int point = (int) session.getAttribute("point");
int level = (int) session.getAttribute("level");
%>

 
<html>
<head>
<meta charset = "utf-8">

<title> ZI-ZONE </title>

<link rel="stylesheet" href="./css/table.css">




<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/button.css?3"> 
<link rel="stylesheet" type="text/css" href="./css/hartz.css">
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">




<style>
a:link    {color:#000000;text-decoration:none;}
a:visited {color:#000000;text-decoration:none;}
a:active  {color:#000000;text-decoration:none;}
a:hover  {color:#000000;text-decoration:none;}


a:link    {color:#000000;text-decoration:none;}
a:visited {color:#000000;text-decoration:none;}
a:active  {color:#000000;text-decoration:none;}
a:hover  {color:#000000;text-decoration:none;}

#join2-btn { width: 80px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join2-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}
#join-btn { width: 60px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}

#join1-btn { width: 100px; height: 23px; line-height: 20px; text-align:center;  text-decoration:none; }



.pattern-header {
	width:100%;
	margin-top:15px;
	text-align: center;
    border-bottom: none;
    background:black;
    margin-bottom:10px;
 }

.pattern-header th,.pattern-header td {
    text-align: center;
    height: 35px;
    line-height: 25px;
    font-size: 12px;
    color: #fff;
    padding: 0px;
}

.charge {
    padding: 0px;
	text-align : center;
	
}

.charge tr,.charge td {
	padding : 0px;
	margin : 10px;
}

.container1 { 
	width : 100%;
	text-align:center;
}


 #idc { border:none; width: 25%;  height: 30px; line-height: 43px; display: block; font-size: 14px; font-weight: bold; vertical-align: middle; margin-bottom: 5px; border-radius:4px;     background: rgba(50,50,50,0.5); color: #fff; transition:0.2s;     border: 1px solid #000;      box-shadow: inset 0 3px 5px rgba(0,0,0,0.4);
text-align: center;
 }
 
  #idd { border:none;  line-height: 43px; display: block; font-size: 14px; font-weight: bold; vertical-align: middle; margin-bottom: 5px; border-radius:4px;     background: rgba(50,50,50,0.5); color: #fff; transition:0.2s;     border: 1px solid #000;      box-shadow: inset 0 3px 5px rgba(0,0,0,0.4);
 }
#idc:focus, #idd:focus {  color: #00FF00; border: solid 1px #00FF00; outline: none;} 

</style>



<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td align="center">
     <table width="1190" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td valign="top">
        	
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td height="12"></td>
              </tr>
              <tr>
                <td height="155" align="center" background="./images/top.png">
                
                    <table width="1127" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td rowspan="2" valign="bottom"><a href="./home.ap"><img src="./images/LOGO1.gif" border="0" style="cursor:pointer;"></a></td>
                        <td height="30" align="right" valign="bottom">
                        
                            <table border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                                
                              </tr>
                            </tbody></table>
                        
                        </td>
                      </tr>
                      <tr>
                        <td width="730" height="70" valign="bottom">
                        
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tbody><tr>
                              <tbody><tr>
                                <td><a href="./cross.ap"><img src="./images/menu_out_00.png" onmouseover='this.src="./images/menu_on_00.png"' onmouseout='this.src="./images/menu_out_00.png"' name="menu00"></a></td>
								<td><a href="./result.ap"><img src="./images/menu_out_03.png" onmouseover='this.src="./images/menu_on_03.png"' onmouseout='this.src="./images/menu_out_03.png"' name="menu01"></a></td>
								<td><a href="./board.ap"><img src="./images/menu_out_02.png" onmouseover='this.src="./images/menu_on_02.png"' onmouseout='this.src="./images/menu_out_02.png"' name="menu02"></a></td>
								<td><a href="./charge.ap"><img src="./images/menu_out_01.png" onmouseover='this.src="./images/menu_on_01.png"' onmouseout='this.src="./images/menu_out_01.png"' name="menu03"></a></td>
                              </tr>
                            </tbody></table>
                        
                        </td>
                      </tr>
                    </tbody></table>
                
                </td>
              </tr>
              <tr>
                <td height="36" align="center" background="./images/infobar.png"  >
                
<table width="97%" border="0" cellspacing="0" cellpadding="0">
                  <tbody><tr>
                    <td class="color_write"><img src="./images/level/<%=level%>.gif" align="absmiddle">&nbsp;<span class="color_a"><%=name%></span> <span class="color_yellow">님</span>   
					&nbsp;&nbsp;&nbsp;
					<span class="color_yellow">포인트 : </span> <span class="color_a"><%=point%></span>&nbsp;<span class="color_yellow">P </span></td>
                    <td align="right" class="white_link">  
                    <% if(session.getAttribute("admin").equals(1)){
                	   %>
                	   <a href="./admin.ap" id="join2-btn" class="ui_btn_gray">관리자모드</a> 
                   <% } %>
                    
                    
                    <a href="./mybet.ap" id="join-btn" class="ui_btn_gray">배팅내역</a> <a href="./html/logout.jsp" id="join-btn" class="ui_btn_gray">로그아웃</a></td>
                  </tr>
                </tbody></table>
                
                </td>
              </tr>
            </tbody>
	</table> <iframe name="exeFrame" width="0" height="0" frameborder="0"></iframe>



	
            <table class="result" width="100%" border="0" cellspacing="0" cellpadding="0">
          	  <tbody><tr>
            	<td align="center" class="sub_back">
                    <table width="1147" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <td valign="top">
<table width="1134" border="0" cellspacing="0" cellpadding="0" align="center">
  <tbody><tr>
    <td height="38" align="left" valign="bottom">
	</td>
		</td>
	<td align="left" ><img src="./images/title/title_free.png"></td>
  </tr>
 </tbody>
</table>


 <table class="result1" width="100%" border="0" cellspacing="0" cellpadding="0">
          	  <tbody><tr>
            	<td align="center" class="sub_back">
                    <table width="1147" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <td valign="top">

<table width="1150" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td height="38" align="left" valign="bottom">
	</td>

  </tr>
 </tbody>
</table>

				
							   
<form action="./insert.ap" method="post">
<table width="1134" border="0" cellspacing="0" cellpadding="0" class="boardWrite" style="margin-top:15px;" align="center">
	<tbody><tr>
		<th width="123">제목</th>
		<td width="807" class="title"><input type="text" name="title" id="idc" class="input6"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td class="title" align="left"><strong><%=name%></strong></td>
	</tr>
	<tr>
		<th style="vertical-align:top; padding-top:9px;">내용</th>
		<td class="content"><textarea name="board" id="idd" cols="25" rows="15" class="board"></textarea></td>
	</tr>


</tbody></table>
<table align="center">
<td>
<button id="join1-btn"  type="submit" value="1" border="0" class="ui_btn_red" >등록</td> <td class="white_link"><a href="./board.ap" id="join-btn" class="ui_btn_gray">돌아가기</a> </td>
</table>						  
 </form>
 
 
 <tr>
                    <td><img src="./images/sub_back02.gif" width="1190px;"></td>
                  </tr>
</table>					
					
					
					








</table>
</table>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td height="6"></td>
              </tr>
              <tr>
              </tr>



            </tbody>
			</table>
			
            
          </td>
         
       </tr>
    </tbody></table>
   </td>
  </tr>
</tbody></table>

</body></html>