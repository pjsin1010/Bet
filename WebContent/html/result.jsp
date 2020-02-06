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

<table width="1134" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td height="38" align="left" valign="bottom">
	</td>
	<td align="left" ><img src="./images/title/title_result.png"></td>
  </tr>
 </tbody>
</table>

<table width="1134" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
  <tbody><tr>
    <td valign="top" class="pattern-header"  >
    
    <table width="1134" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="116" height="20" align="center" class="color_writeS">경기일시</td>
        <td width="283" align="center" class="color_writeS">승[Home]</td>
        <td width="73" align="center" class="color_writeS">무</td>
        <td width="283" align="center" class="color_writeS">패[Away]</td>
        <td width="110" align="center" class="color_writeS">스코어</td>
      </tr>
    </tbody>
	</table>                    
    
    </td>
  </tr>
</tbody>
</table>


			<table width="1134" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
				<td style="padding:1px" bgcolor="e8cbfb">
				<table width="860" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td class="bar_league"><b><img align="absmiddle" src="./images/ball.png" >&nbsp;<span class="color_blackB">챔피언스리그 4강</span></b></td>
				</tr>
				</tbody></table>
				</td>
				</tr>
				</tbody></table>

								



																		<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.09	04:00</span><span class="lightbrown"></span></td>
											<td  width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23">2.04</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562429_betting" style=" font-weight:bold;">3.25<span id="id0_18562429_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor="">2.85</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor="">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											<td width="80" align="center" class="batt_ing">2:3</td>
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.09	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562430" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562430_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562430_betting" height="23">2.48</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562430_betting" style=" font-weight:bold;">-1.50<span id="id0_18562430_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  width="32%" class="disable">
												<table id="id2_18562430" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"    bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562430_team" height="23" bgcolor="">1.68</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562430_betting" height="23" bgcolor="">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">2:3</td>
											
										</tr>
						</tbody></table>

								



									






									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.09	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562431" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562431_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562431_betting" height="23"><font color="blue">▼</font>&nbsp;1.89</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562431_betting" style=" font-weight:bold;">(3.50)<span id="id0_18562431_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18562431" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562431_team" height="23">2.04&nbsp;<font color="red">▲</font></td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562431_betting" height="23">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">2:3 ( 5 )</td>
											
										</tr>
						</tbody></table>





									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.18	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team">리버풀</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23">2.35</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562429_betting" style=" font-weight:bold;">3.40<span id="id0_18562429_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td width="32%" class="disable">
												<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor="">2.33</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor="">바르셀로나</td>
						</tr>
						</tbody></table>
											</td>
											<td width="80" align="center" class="batt_ing">4:0</td>
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.18	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562430" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562430_team">리버풀</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562430_betting" height="23">1.67</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562430_betting" style=" font-weight:bold;">+1.50<span id="id0_18562430_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  width="32%" class="disable">
												<table id="id2_18562430" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"    bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562430_team" height="23" bgcolor="">3.12</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562430_betting" height="23" bgcolor="">바르셀로나</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">4:0</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">05.18	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562431" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562431_team">리버풀</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562431_betting" height="23"><font color="blue">▼</font>&nbsp;2.00</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562431_betting" style=" font-weight:bold;">(2.50)<span id="id0_18562431_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18562431" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562431_team" height="23">1.84&nbsp;<font color="red">▲</font></td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562431_betting" height="23">바르셀로나</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">4:0 ( 4 )</td>
											
										</tr>
						</tbody></table>






				


				<table width="1134" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
				<td style="padding:1px" bgcolor="e8cbfb">
				<table width="860" border="0" cellspacing="0" cellpadding="0">
				<tbody><tr>
					<td class="bar_league"><b><img align="absmiddle" src="./images/ball.png" >&nbsp;<span class="color_blackB">챔피언스리그 8강</span></b></td>
				</tr>
				</tbody></table>
				</td>
				</tr>
				</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562429_team">맨시티</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562429_betting" height="23">1.34</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562429_betting" style=" font-weight:bold;">4.30<span id="id0_18562429_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td width="32%" class="disable">
												<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor="">5.90</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor="">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											<td width="80" align="center" class="batt_ing">4:3</td>
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562430" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562430_team">맨시티</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562430_betting" height="23">2.31</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562430_betting" style=" font-weight:bold;">-2.50<span id="id0_18562430_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18562430" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"    bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562430_team" height="23" bgcolor="">2.05</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562430_betting" height="23" bgcolor="">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">4:3</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562431" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18562431_team">맨시티</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18562431_betting" height="23"><font color="blue">▼</font>&nbsp;1.76</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562431_betting" style=" font-weight:bold;">(3.50)<span id="id0_18562431_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18562431" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562431_team" height="23">1.94&nbsp;<font color="red">▲</font></td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562431_betting" height="23">토트넘</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">4:3 ( 7 )</td>
											
										</tr>
						</tbody></table>



								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563560" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563560_team">포르투</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563560_betting" height="23">2.25</td>
												</tr>
												</tbody></table>
											</td>
											<td  width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563560_betting" style=" font-weight:bold;">3.12<span id="id0_18563560_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td class="A" width="32%" class="disable">
												<table id="id2_18563560" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563560_team" height="23" bgcolor="">1.98</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563560_betting" height="23" bgcolor="">리버풀</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:4</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td  width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563561" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563561_team">포르투</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563561_betting" height="23">1.65</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563561_betting" style=" font-weight:bold;">+2.00<span id="id0_18563561_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  class="A" width="32%" class="disable">
												<table id="id2_18563561" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563561_team" height="23">2.7</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563561_betting" height="23">리버풀</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:4</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.18	04:00</span><span class="lightbrown"></span></td>
											<td   width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563562" align="left" style="cursor:hand;" onclick="addCart('pjsin1010',18563562,1,'MULTI','2019-03-19 19:00/한국도로공사:GS칼텍스/2','_');"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563562_team">포르투</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563562_betting" height="23"><font color="blue">▼</font>&nbsp; 2.00 
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563562_betting" style=" font-weight:bold;">(3.50)  <br><span id="id0_18563562_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  class="A" width="32%" class="disable">
												<table  id="id2_18563562" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;" onclick="addCart('pjsin1010',18563562,2,'MULTI','2019-03-19 19:00/한국도로공사:GS칼텍스/2','_');"  > 
						<tbody><tr>
							<td  width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563562_team" height="23">1.90&nbsp;<font color="red">▲</font></td>
							
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563562_betting" height="23" >리버풀</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:4 ( 5 )</td>
											
										</tr>
						</tbody></table>








								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563560" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563560_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563560_betting" height="23">1.54</td>
												</tr>
												</tbody></table>
											</td>
											<td class="A" width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563560_betting" style=" font-weight:bold;">5.00<span id="id0_18563560_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td width="32%" class="disable">
												<table id="id2_18563560" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563560_team" height="23" bgcolor="">2.37</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563560_betting" height="23" bgcolor="">유벤투스</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:1</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td  width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563561" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563561_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563561_betting" height="23">1.84</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563561_betting" style=" font-weight:bold;">-1.00<span id="id0_18563561_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  class="A" width="32%" class="disable">
												<table id="id2_18563561" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563561_team" height="23">1.93</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563561_betting" height="23">유벤투스</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:1</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td  class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563562" align="left" style="cursor:hand;" onclick="addCart('pjsin1010',18563562,1,'MULTI','2019-03-19 19:00/한국도로공사:GS칼텍스/2','_');"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563562_team">아약스</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563562_betting" height="23"><font color="blue">▼</font>&nbsp; 2.00 
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563562_betting" style=" font-weight:bold;">(2.50)  <br><span id="id0_18563562_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  width="32%" class="disable">
												<table  id="id2_18563562" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;" onclick="addCart('pjsin1010',18563562,2,'MULTI','2019-03-19 19:00/한국도로공사:GS칼텍스/2','_');"  > 
						<tbody><tr>
							<td  width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563562_team" height="23">1.90&nbsp;<font color="red">▲</font></td>
							
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563562_betting" height="23" >유벤투스</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">1:1 ( 2 )</td>
											
										</tr>
						</tbody></table>











								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563560" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563560_team">바르셀로나</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563560_betting" height="23">2.25</td>
												</tr>
												</tbody></table>
											</td>
											<td  width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563560_betting" style=" font-weight:bold;">3.12<span id="id0_18563560_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td  width="32%" class="disable">
												<table id="id2_18563560" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   bgcolor=""> 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563560_team" height="23" bgcolor="">1.98</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563560_betting" height="23" bgcolor="">맨유</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">3:0</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563561" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563561_team">바르셀로나</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563561_betting" height="23">1.65</td>
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563561_betting" style=" font-weight:bold;">-1.50<span id="id0_18563561_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td   width="32%" class="disable">
												<table id="id2_18563561" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"  > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563561_team" height="23">2.7</td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563561_betting" height="23">맨유</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">3:0</td>
											
										</tr>
						</tbody></table>

								



									


									<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody><tr class="betting-list">
											<td width="12%" height="23" align="center"><span class="bet_day">04.17	04:00</span><span class="lightbrown"></span></td>
											<td  class="A" width="32%" class="disable">
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18563562" align="left" style="cursor:hand;"  > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23" id="id1_18563562_team">바르셀로나</td>
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="id1_18563562_betting" height="23"><font color="blue">▼</font>&nbsp; 2.00 
												</tr>
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18563562_betting" style=" font-weight:bold;">(3.50)  <br><span id="id0_18563562_team"></span></td>
													</tr>
													</tbody></table>
											</td>
											<td   width="32%" class="disable">
												<table  id="id2_18563562" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;"   > 
												
						<tbody><tr>
							<td  width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18563562_team" height="23">1.90&nbsp;<font color="red">▲</font></td>
							
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18563562_betting" height="23" >맨유</td>
						</tr>
						</tbody></table>
											</td>
											
											<td width="80" align="center" class="batt_ing">3:0 ( 3 )</td>
											
										</tr>
						</tbody></table>

	



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