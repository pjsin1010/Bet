<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.ryan.dao.MemberDAO" %>
<%@ page import ="com.ryan.dto.*" %>
<%@ page import ="java.io.PrintWriter" %>

<%
// 세션 없을시 접근 금지
if (session.getAttribute("admin").equals(0)) {
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('관리자가 아닙니다.');");
	script.println("history.back();");
	script.println("</script>");
		} %>
		
<% String num = request.getParameter("num"); %>
<%   MemberDTO m = MemberDAO.MemberView(num);   %>
 
<html>
<head>
<meta charset = "utf-8">

<title> ZI-ZONE </title>

<link rel="stylesheet" href="./css/table.css">
<!--  <link rel="stylesheet" href="./css/join.css">-->



<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/button.css?3"> 
<link rel="stylesheet" type="text/css" href="../css/hartz.css">
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
 
  #idd { border:none; width: 25%;  height: 30px; line-height: 43px; display: block; font-size: 14px; font-weight: bold; vertical-align: middle; margin-bottom: 5px; border-radius:4px;     background: rgba(50,50,50,0.5); color: #fff; transition:0.2s;     border: 1px solid #000;      box-shadow: inset 0 3px 5px rgba(0,0,0,0.4);
text-align: center;
 }
  #ide { border:none; width: 25%;  height: 30px; line-height: 43px; display: block; font-size: 14px; font-weight: bold; vertical-align: middle; margin-bottom: 5px; border-radius:4px;     background: rgba(50,50,50,0.5); color: #fff; transition:0.2s;     border: 1px solid #000;      box-shadow: inset 0 3px 5px rgba(0,0,0,0.4);
text-align: center;
 }

#idc:focus, #idd:focus, #ide:focus {  color: #00FF00; border: solid 1px #00FF00; outline: none;} 

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
$(function(){
	$("#lock").change(function(){
		
		if($("#lock").prop("checked")){
				$("#idd").attr("disabled" , false);
				$("#idd").attr("type" , "text");
				$("#idd").attr("value" , "");
				}
		else{
$("#idd").attr("disabled", true)
$("#idd").attr("type" , "hidden");
			};
});
});
});
</script>




	
           


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


				
							   
<form action="../memberEdit.ap" method="post">
<table width="1134" border="0" cellspacing="0" cellpadding="0" class="boardWrite" style="margin-top:15px;" align="center">

	<tr><input type="hidden" name="id" value="<%=m.getId()%>">
		<th width="123">아이디</th>
		<td width="807" class="title"><input type="text" name="result" id="idc" class="input6" value="<%=m.getId()%>" disabled/> 변경 불가 </td>
	</tr>
	
	<tr>
		<th width="123">비밀번호 변경 설정</th>
		<td width="807" class="title"><input type="checkbox" id="lock"> 체크하면 비밀번호 변경할수있습니다</td>
	</tr>
	
	<tr>
		<th width="123">비밀번호</th>
		<td width="807" class="title"><input type="hidden" name="pw" id="idd" class="input6" value="<%=m.getPw()%>" disabled/> </td>
	</tr>
	
	
	<tr>
		<th width="123">닉네임</th>
		<td width="807" class="title"><input type="text" name="result" id="idc" class="input6"  value="<%=m.getName()%>" disabled/> 변경 불가 </td>
	</tr>
	<tr>
		<th width="123">포인트</th>
		<td width="807" class="title"><input type="text" name="point" id="idc" class="input6"  value="<%=m.getPoint()%>"> </td>
	</tr>	
	<tr>
		<th width="123">레벨</th>
	    <td width="807" class="title">
		<select  name="level"  style="width:100px;"  id="idc" class="input6" >
        <option value="<%=m.getLevel()%>">레벨 <%=m.getLevel()%></option>
		<option value="1">레벨 1</option>
		<option value="2">레벨 2</option>
		<option value="3">레벨 3</option>
		<option value="4">레벨 4</option>
        </select>
	</td>
	</tr>


</tbody></table>
<table align="center">
<td>
<button id="join1-btn"  type="submit" value="1" border="0" class="ui_btn_red" >등록</td> <td class="white_link">
<a href="javascript:close();" id="join-btn" class="ui_btn_gray">돌아가기</a> </td>
</table>						  
 </form>
 
 
 
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