<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.ryan.dao.MemberDAO" %>
<%@ page import ="com.ryan.dto.*" %>
<%@ page import ="com.ryan.dao.*" %>
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


	
	
	
	
	
	
	<% 
	// 1. DBClass 파일에 있는 selectinfo() 메소드에
	// 반환된 값(return list)를 mlist 변수에 ArrayList배열로 삽입
	
	ArrayList<SportsDTO> mlist = SportsListDAO.Sports();


	
	
	%>
	
	
	
	
	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title> ZI-ZONE </title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>




<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/button.css?3"> 
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">




<style>
a:link    {color:#000000;text-decoration:none;}
a:visited {color:#000000;text-decoration:none;}
a:active  {color:#000000;text-decoration:none;}
a:hover  {color:#000000;text-decoration:none;}


#join-btn { width: 60px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}

#join2-btn { width: 80px; height: 22px; line-height: 25px; text-align:center;  text-decoration:none; }
#join2-btn:hover {  bottom: 39px !important; top:inherit; opacity:1.0;}

#join1-btn { width: 75px; height: 23px; line-height: 20px; text-align:center;  text-decoration:none; }



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
	<td align="left" ><img src="./images/title/title_all.png"></td>
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
        <td width="73" align="center" class="color_writeS">무/언옵</td>
        <td width="283" align="center" class="color_writeS">패[Away]</td>
        <td width="110" align="center" class="color_writeS">상태</td>
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
					<td class="bar_league"><b><img align="absmiddle" src="./images/ball.png" >&nbsp;<span class="color_blackB">축구</span></b></td>
				</tr>
				</tbody></table>
				</td>
				</tr>
				</tbody></table>

								


<!--  
<script>
$(document).ready(function(){
$( "#myForm" ).submit(function( event ) {
	alert("aa");
	
  event.preventDefault();
  var url = $(this).attr( "action" );
  var data = $(this).serialize();
  var num = $("#join1-btn").val();
  var seed=prompt("얼마 배팅하시겠습니까?");
  
  data.push({num:num, bet:seed});
  
  $.post( url, data )
  .done(function( data ) {
  });
});

});
</script>
 -->
 
 
 <% 	for(SportsDTO m : mlist){
   
	%>
<script>
function A<%=m.getId()%>(){ 
var seed=prompt("얼마 배팅하시겠습니까?");
var a = 1;
form<%=m.getId()%>.action='./betting.ap?num='+a+ '&bet=' +seed;


}


function B<%=m.getId()%>(){
var seed=prompt("얼마 배팅하시겠습니까?");
var a = 2;
form<%=m.getId()%>.action='./betting.ap?num='+a+ '&bet=' +seed;

}

function C<%=m.getId()%>(){
	var seed=prompt("얼마 배팅하시겠습니까?");
var a = 3;
form<%=m.getId()%>.action='./betting.ap?num='+a+ '&bet=' +seed;

}
</script>
									


										<table width="1134" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody>
										
										
										<tr class="betting-list">
						
										 <form action="./betting.ap " method="post" name="form<%=m.getId()%>">
										 
											<td width="12%" height="23" align="center"><span class="bet_day"><%= m.getTime()%><input type="hidden" name="time" value="<%= m.getTime()%>" id="time" ></span><span class="lightbrown"></span></td>
											<td width="32%" class="disable">
											
												<table class="noSelected2" width="100%" border="0" cellspacing="0" cellpadding="0" id="id1_18562429" align="left" style="cursor:hand;" > 
												<tbody><tr>
													<td width="80%" align="left" style="padding-left:5px;  font-weight:bold;" height="23"  id="h" name="h"><%= m.getHome()%><input type="hidden" name="home" value="<%= m.getHome()%>" id="home" ></td> 
													<td width="20%" align="right" style="padding-right:5px;  font-weight:bold;" id="hb" height="23">
													
													<% if( m.getAup() != null) {%>
													<font color="blue"><%= m.getHup()%></font><input type="hidden" name="hup" value="<%= m.getHup()%>" id="hup" > 
													<% } %>
													<%= m.getHomeb()%><input type="hidden" name="homeb" value="<%= m.getHomeb()%>" id="homeb" >

													<button id="join1-btn" type="submit"  value="1" border="0" class="ui_btn_red" onclick="A<%=m.getId()%>()">배팅</a></td>
												   
												</tr>
												 
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562429_betting" style=" font-weight:bold;"><%= m.getDraw()%> <input type="hidden" name="draw" value="<%= m.getDraw()%>" id="draw" ><br>
											          
											          <% if( m.getAup() == null) {%>
											          <button id="join1-btn" type="submit" value="2" border="0" class="ui_btn_gray" onclick="B<%=m.getId()%>()">배팅</a>
													
													<% } %>
													</tr>
													</tbody></table>
											</td>
											
											

											
											<td width="32%" class="disable">
												<table id="id2_18562429" width="100%" border="0" cellspacing="0" cellpadding="0" align="left" class="noSelected2" style="cursor:hand;" > 
						<tbody><tr>
							<td width="20%" align="left" style="padding-left:5px;  font-weight:bold;" id="id2_18562429_team" height="23" bgcolor=""><%= m.getAwayb()%> 
							<% if( m.getAup() != null) {%>
							<font color="red"><%= m.getAup() %></font><input type="hidden" name="aup" value="<%= m.getAup() %>" id="aup" >
							<% } %>
							<input type="hidden" name="awayb" value="<%= m.getAwayb()%>" id="awayb" ><button id="join1-btn" type="submit" value="3" border="0" class="ui_btn_red" onclick="C<%=m.getId()%>()">배팅</a></td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor=""><%= m.getAway()%> <input type="hidden" name="away" value="<%= m.getAway()%>" id="away" ></td>
						</tr>
						</tbody></table>
											</td>
											<td width="80" align="center" class="batt_ing"><%= m.getDoing()%></td><input type="hidden" name="doing" value="진행중" id="doing" >
										</tr>
										</form> 
						</tbody></table>
						
					<% }%>

	

</td>

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
