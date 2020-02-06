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
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
    int point = (int) session.getAttribute("point");
    int level = (int) session.getAttribute("level");
    int pointlimit = (int) session.getAttribute("pointlimit");
    int charge = (int) session.getAttribute("charge");
    System.out.print(pointlimit);
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

#join1-btn { width: 100px; height: 40px; line-height: 20px; text-align:center;  text-decoration:none; }



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
	</table> <iframe name="exeFrame" width="0" height="0" frameborder="0">
	</iframe>



	
            <table class="result" width="100%" border="0" cellspacing="0" cellpadding="0">
          	  <tbody><tr>
            	<td align="center" class="sub_back">
                    <table width="1147" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <td valign="top">
<table width="1134" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td height="38" align="left" valign="bottom">
	</td>
	<td align="left" ><img src="./images/title/title_charge.png"></td>
  </tr>
 </tbody>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td align="left" valign="top"><table width="99%" border="0" cellspacing="0" cellpadding="3">
      <tbody><tr>
        <td height="10"></td>
      </tr>

      <tr>
        <td align="center" valign="top"><!-------------  내용테이블  ------------->
		<style>
		
		.t_01 { background-color:rgba(0, 0, 0,.3);border-top: 1px solid #4a4a4a;border-left: 1px solid #4a4a4a; }
		.t_02 { background-color:rgba(0, 0, 0,.3);border-top: 1px solid #4a4a4a;border-left: 1px solid #4a4a4a;border-right: 1px solid #4a4a4a; }
		.t_03 { background-color:rgba(0, 0, 0,.3);border-top: 1px solid #4a4a4a;border-left: 1px solid #4a4a4a;border-right: 1px solid #4a4a4a; }
		.t_04 { background-color:rgba(0, 0, 0,.3);border-left: 1px solid #4a4a4a;border-right: 1px solid #4a4a4a;border-bottom: 1px solid #4a4a4a; }
		.t_text1 { background-color:rgba(0, 0, 0,.3); }
		.t_text2 { background-color:rgba(0, 0, 0,.3); }
		.t_text3 { background-color:rgba(0, 0, 0,.3); }
		.t_text4 { background-color:rgba(0, 0, 0,.3); }
		
		</style>
          <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tbody>
            <tr>
              <td class="t_01">주의사항</td>
              <td class="t_02"><p>1. 충전신청후 바로 포인트 충전됩니다.<br><br></p>
                <p>
                  2. 레벨별로 일일 충전한도가 있습니다.</p>
				   <span class="t_text3">(level1 = 1만원   level2 = 5만원   level3 = 10만원  VIP = 100만원)</span>
                <p>
                  3. 일일 남은한도와 현재레벨을 보면서 충전하시길바랍니다.<br>
                  <span class="t_text3"></span></p></td>
            </tr>

            <tr>
              <td class="t_01">현재 레벨</td>
              <td class="t_02">level <%=level%>  <%=charge%></td>
            </tr>


			<tr> 
              <td class="t_01">남은 한도</td>
              <td class="t_02"><%=pointlimit%>원</td>
            </tr>
            <tr>
<script type="text/javascript">
var point;
var level;

function InputCheck_new()
{
point=10000;

aa.point.value=point;
}
function InputCheck_new1()
{
point=50000;

aa.point.value=point;
}
function InputCheck_new2()
{
point=100000;

aa.point.value=point;
}
function InputCheck_new3()
{
point=1000000;

aa.point.value=point;
}
function InputCheck_new4()
{
point=0;
aa.point.value=point;
}
function A(point){
if(confirm("충전하시겠습니까??")){
 location.href='./hcharge.ap?point=' +point;

}

}
</script>

              <td class="t_01">충전금액</td>
              <td class="t_02"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
				<form name="aa" action="./hcharge.ap" >
                  <td><input type="text" class="board_input" style="text-align:right; width:110px" name="point" id="point">
                    원 </td>
                  <td><a href="javascript:InputCheck_new();" style="color:#ffffff;"><img src="./images/btn_no_01.png"></a>
				  <a href="javascript:InputCheck_new1();" style="color:#ffffff;"><img src="./images/btn_no_03.png"></a> 
				  <a href="javascript:InputCheck_new2();" style="color:#ffffff;"><img src="./images/btn_no_04.png"></a>
				  <a href="javascript:InputCheck_new3();" style="color:#ffffff;"><img src="./images/btn_no_10.png"></a>
				  <a href="javascript:InputCheck_new4();" style="color:#fff;"><img src="./images/btn_no_00.png"></a></td>
                </tr>
              </tbody></table></td>
            </tr>

            <tr>
              <td height="60" colspan="2" align="center" class="t_03">
			   <button id="join1-btn"  type="submit" value="1" border="0" class="ui_btn_gray" onclick="A()" >충전하기</a>
                
				</td>
				            <tr>
              <td colspan="2" align="center" valign="top" class="t_04" style="text-align:center;"></td>
            </tr>
            
            </form>

          </tbody></table>
          </td>
      </tr>
      <tr>
        <td height="15"></td>
      </tr>
    </tbody></table></td>
  </tr>
</tbody></table>
</table>

</table>






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