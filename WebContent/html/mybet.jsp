<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.ryan.dao.MemberDAO" %>
<%@ page import ="com.ryan.dto.*" %>
<%@ page import ="com.ryan.dao.BetListDAO" %>
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
String id = (String) session.getAttribute("id");
%>



<%
	// 페이지 숫자 클릭 ?get방식
	String p = request.getParameter("p");
	
	
	
	// 전체 갯수
	int cnt = BetListDAO.getCount(id);
	//System.out.println("전체: " + cnt);
	
	// 한 페이지당 10개씩 뿌리기
	int exit = 7; // 한 페이지에 뿌리고 싶은 갯수
	int totalpage = cnt / exit; 
	totalpage = totalpage +1 ;

	
	
	// System.out.println("페이지 " + totalpage);
	// ipage * 10 = ? ~ limit
	// System.out.println("페이지 시작점" + (totalpage * exit));
	
	int ipage = 0; //첫 페이지
	if(p != null){
		ipage = Integer.parseInt(p);
		ipage = ipage - 1; // 페이지로 넘어오는 숫자는 1부터라서
							// 디비에 넘겨야 할 숫자는 0부터 
	}
	int start = ipage * exit;
	
	ArrayList<BetDTO> list = BetListDAO.selectinfo1(start , exit , id);
	
	
	%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title> ZI-ZONE </title>




<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/button.css?3"> 
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">




<style>
a:link    {color:#000000;text-decoration:none;}
a:visited {color:#000000;text-decoration:none;}
a:active  {color:#000000;text-decoration:none;}
a:hover  {color:#000000;text-decoration:none;}

#join2-btn { width: 80px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join2-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}
#join-btn { width: 60px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}

#join1-btn { width: 30px; height: 20px; line-height: 20px; text-align:center;  text-decoration:none; }
.color4{color:#ff9420;}
.color3{color:#b0b0b0;}


.pattern-header {
	width:100%;
	margin-top:15px;
	text-align: center;
    border-bottom: none;
    background:black;
    margin-bottom:10px;
 }

 .abb {
    background:#3f3d3d; 
 }
  .abb1 {
    background:gray; 
 }

.pattern-header th,.pattern-header td {
    text-align: center;
    height: 35px;
    line-height: 25px;
    font-size: 12px;
    color: #fff;
    padding: 0px;
}
.A {
background:orange;
}
.H {
background:blue;
}


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



            <table width="100%" border="0" cellspacing="0" cellpadding="0">
          	  <tbody><tr>
            	<td align="center" class="sub_back">
				
				
				
                    <table width="1147" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <td valign="top">

<table width="1134" border="0" cellspacing="0" cellpadding="0" >
  <tbody><tr>
    <td height="38" align="left" valign="bottom">

	</td>
<td align="left" ><img src="./images/title/title_bet.png"></td>
  </tr>

 </tbody>

</table>








<% for (BetDTO m : list){ %>


<table width="1134" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
  <tbody><tr>
    <td valign="top" class="pattern-header"  >
    
    <table width="1134" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="116" height="20" align="center" class="color_writeS">경기일시</td>
        <td width="283" align="center" class="color_writeS">승[Home]</td>
        <td width="73" align="center" class="color_writeS">무/핸디/언옵</td>
        <td width="283" align="center" class="color_writeS">패[Away]</td>
        <td width="110" align="center" class="color_writeS">결과</td>
      </tr>
    </tbody>
	</table>                    
    
    </td>
  </tr>
</tbody>
</table>



				


<!-- 홈승 -->						
<!--  
<?php

 if($row[bet] ==1) {

?>

		 -->			
<% int a = Integer.parseInt(m.getBet()); %>

<% if(a == 1) { %>
<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff" style="margin-bottom:15px;" class="abb1">
<tbody><tr class="betting-list">
<td width="12%" height="23" align="center"><span class="bet_day"><%= m.getTime()%></span><span class="lightbrown"></span></td>
<td class="A" width="32%" class="disable">
<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left"  "  "> 
<tbody><tr>
<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team"><%= m.getHome() %></td>
<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23"><font color="blue"><%= m.getHup() %></font><%= m.getHomeb() %></td>
</tr>
</tbody></table>
</td>
<td width="12%" class="disable">				
<table align="center" class="noSelected2">
<tbody><tr>
<td align="center" id="id0_18562429_betting" style=" font-weight:bold;"><%= m.getDraw() %><span id="id0_18562429_team"></span></td>
</tr>
</tbody></table>
</td>
<td width="32%" class="disable">
<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2"  "  " bgcolor=""> 
<tbody><tr>
<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor=""><%= m.getAwayb() %><font color="red"><%= m.getAup() %></font></td>
<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor=""><%= m.getAway() %></td>

</tr>

</tbody></table>

</td>
<td width="80" align="center" class="batt_ing" ><%= m.getResult() %></td>
</tr>
	<tr>
		<td height="6"></td>
	</tr>
<tr>
		<td  colspan="11"  class="abb" width="1134">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="34" >

				<tbody><tr>
<td align="center"  width="150">
</td>
 <td colspan="0" align="left" style="color:balck;" height="30" width="150"><span class="color3">배팅시간:</span> <span class="color4"><%= m.getBettime() %></span></td>
<td colspan="0" align="left" style="color:balck;" height="30" width="170"><span class="color3">배팅머니(원): <span class="color4"><%= m.getPoint() %></span></td>
<td style="color:balck;" width="170"><span class="color3">예상배당(배): </span> <span class="color4"><%= m.getHomeb() %>&nbsp; </span></td>
<td  style="color:balck;" width="350"><span class="color3">예상적중금(원): </span><span class="color4"><%= m.getPointresult() %> &nbsp;</span></td>
<td align="center"  class="sGame" style="color:red;"><%= m.getDoing() %></td>
					
				</tr>
			</tbody></table>
		</td>
	</tr>

<% } %>

<!-- 무승부 -->



<% if(a == 2) { %>

					

<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff" style="margin-bottom:15px;" class="abb1">
<tbody><tr class="betting-list">
<td width="12%" height="23" align="center"><span class="bet_day"><%= m.getTime() %></span><span class="lightbrown"></span></td>
<td  width="32%" class="disable">
<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left"  "  "> 
<tbody><tr>
<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team"><%= m.getHome() %></td>
<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23"><font color="blue"><%= m.getHup() %></font><%= m.getHomeb() %></td>
</tr>
</tbody></table>
</td>
<td  class="A" width="12%" class="disable">				
<table align="center" class="noSelected2">
<tbody><tr>
<td align="center" id="id0_18562429_betting" style=" font-weight:bold;"><%= m.getDraw() %><span id="id0_18562429_team"></span></td>
</tr>
</tbody></table>
</td>
<td width="32%" class="disable">
<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2"  bgcolor=""> 
<tbody><tr>
<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor=""><%= m.getAwayb() %><font color="red"><%= m.getAup() %></font></td>
<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor=""><%= m.getAway() %></td>

</tr>

</tbody></table>

</td>
<td width="80" align="center" class="batt_ing" ><%= m.getResult() %></td>
</tr>
	<tr>
		<td height="6"></td>
	</tr>
<tr>
		<td  colspan="11"  class="abb" width="1134">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="34" >

				<tbody><tr>
<td align="center"  width="150">
</td>
 <td colspan="0" align="left" style="color:balck;" height="30" width="150"><span class="color3">배팅시간:</span> <span class="color4"><%= m.getBettime() %></span></td>
<td colspan="0" align="left" style="color:balck;" height="30" width="170"><span class="color3">배팅머니(원): <span class="color4"><%= m.getPoint() %></span></td>
<td style="color:balck;" width="170"><span class="color3">예상배당(배): </span> <span class="color4"><%= m.getDraw() %>&nbsp; </span></td>
<td  style="color:balck;" width="350"><span class="color3">예상적중금(원): </span><span class="color4"><%= m.getPointresult() %> &nbsp;</span></td>
<td align="center"  class="sGame" style="color:red;"><%= m.getDoing() %></td>
					
				</tr>
			</tbody></table>
		</td>
	</tr>
<% } %>




<!-- 원정승 -->


					
<% if(a == 3) { %>
<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff" style="margin-bottom:15px;" class="abb1">
<tbody><tr class="betting-list">
<td width="12%" height="23" align="center"><span class="bet_day"><%= m.getTime() %></span><span class="lightbrown"></span></td>
<td  width="32%" class="disable">
<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left"  "  "> 
<tbody><tr>
<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team"><%= m.getHome() %></td>
<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23"><font color="blue"><%= m.getHup() %></font><%= m.getHomeb() %></td>
</tr>
</tbody></table>
</td>
<td width="12%" class="disable">				
<table align="center" class="noSelected2">
<tbody><tr>
<td align="center" id="id0_18562429_betting" style=" font-weight:bold;"><%= m.getDraw() %><span id="id0_18562429_team"></span></td>
</tr>
</tbody></table>
</td>
<td class="A" width="32%" class="disable">
<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2"  "  " bgcolor=""> 
<tbody><tr>
<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor=""><%= m.getAwayb() %><font color="red"><%= m.getAup() %></font></td>
<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor=""><%= m.getAway() %></td>

</tr>

</tbody></table>

</td>
<td width="80" align="center" class="batt_ing" ><%= m.getResult() %></td>
</tr>
	<tr>
		<td height="6"></td>
	</tr>
<tr>
		<td  colspan="11"  class="abb" width="1134">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="34" >

				<tbody><tr>
<td align="center"  width="150">
</td>
 <td colspan="0" align="left" style="color:balck;" height="30" width="150"><span class="color3">배팅시간:</span> <span class="color4"><%= m.getBettime() %></span></td>
<td colspan="0" align="left" style="color:balck;" height="30" width="170"><span class="color3">배팅머니(원): <span class="color4"><%= m.getPoint() %></span></td>
<td style="color:balck;" width="170"><span class="color3">예상배당(배): </span> <span class="color4"><%= m.getAwayb() %>&nbsp; </span></td>
<td  style="color:balck;" width="350"><span class="color3">예상적중금(원): </span><span class="color4"><%= m.getPointresult() %> &nbsp;</span></td>
<td align="center"  class="sGame" style="color:red;"><%= m.getDoing() %></td>
					
				</tr>
			</tbody></table>
		</td>
	</tr>
	
	<% }  }%>


<style>

.pagination{display:-ms-flexbox;display:flex;padding-left:0;list-style:none;border-radius:.25rem}.page-link{position:relative;display:block;padding:.5rem .75rem;margin-left:-1px;line-height:1.25;color:#007bff;background-color:#fff;border:1px solid #dee2e6}.page-link:hover{z-index:2;color:#0056b3;text-decoration:none;background-color:#e9ecef;border-color:#dee2e6}.page-link:focus{z-index:2;outline:0;box-shadow:0 0 0 .2rem rgba(0,123,255,.25)}.page-item:first-child .page-link{margin-left:0;border-top-left-radius:.25rem;border-bottom-left-radius:.25rem}.page-item:last-child .page-link{border-top-right-radius:.25rem;border-bottom-right-radius:.25rem}.page-item.active .page-link{z-index:1;color:#fff;background-color:#007bff;border-color:#007bff}

.justify-content-end{-ms-flex-pack:end!important;justify-content:flex-end!important}.justify-content-center{-ms-flex-pack:center!important;justify-content:center!important}
</style>

</tbody></table>

<br>
<nav>
  <ul class="pagination justify-content-center">
  
  
	 <%for (int i=1; i<=totalpage; i++) { %>
 	<% if( i != ipage + 1){ %>
 	<li class="page-item"><a class="page-link" href="mybet.ap?p=<%=i%>"><%= i%></a></li>
  	<% }  else {%>
	<li class="page-item active"><span class="page-link"><%= i%></span></li>
	<% } %>
	<% } %>
  </ul>
</nav>










								





									




	



                            </tr>
                        </tbody>
						</table>
                    </td>
                  </tr>
                  <tr>
                    <td><img src="./images/sub_back02.gif" width=1190px;></td>
                  </tr>
            </tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody><tr>
                <td height="6"></td>
              </tr>
              <tr>
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