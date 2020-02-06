<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.ryan.dao.MemberDAO" %>
<%@ page import ="com.ryan.dto.*" %>
<%@ page import ="com.ryan.dao.*" %>
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
		
<% String name = (String) session.getAttribute("name");
	// 페이지 숫자 클릭 ?get방식
	String p = request.getParameter("p");
	
	
	
	// 전체 갯수
	int cnt = BetListDAO.adCount();
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
	
	ArrayList<BetDTO> list = BetListDAO.adselectinfo1(start , exit);
	
	
	%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Zlzone 관리자 페이지</title>

  <!-- Custom fonts for this template-->
    <link rel="stylesheet" type="text/css" href="./admin/css/button.css?3"> 
  <link href="./admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="./admin/css/sb-admin-2.min.css" rel="stylesheet">
 <link href="./admin/css/adminpage.css" rel="stylesheet">
</head>

    

    
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.ap">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
         <div class="sidebar-brand-text mx-3"><%=name%> <sup>[관리자]</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        
          
          <span class="sidebar-brand-text mx-3" >배팅내역 관리</span>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>경기 설정</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            
          <a class="collapse-item" href="sportsinfo.ap">경기 상태</a>
            <a class="collapse-item" href="resultinfo.ap">경기결과 상태</a>
            <a class="collapse-item" href="betinfo.ap">배팅내역 관리</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>회원정보 관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="memberinfo.ap">회원정보 상태</a>
            

          </div>
         
        </div>
         <a href="./home.ap"> 홈으로 </a>
      </li>

      

    </ul>
    <!-- End of Sidebar -->

    
        <!-- Begin Page Content -->
        <div class="container-fluid">

          
         
          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <table width="1434" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
  <tbody><tr>
    <td valign="top" class="pattern-header"  >
    
    <table width="1434" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="116" height="20" align="center" class="color_writeS">경기일시</td>
        <td width="283" align="center" class="color_writeS">승[Home]</td>
        <td width="203" align="center" class="color_writeS">무/핸디/언옵</td>
        <td width="283" align="center" class="color_writeS">패[Away]</td>
        <td width="50" align="center" class="color_writeS">상태</td>
        <td width="70" align="center" class="color_writeS">관리</td>
      </tr>
    </tbody>
	</table>                    
    
    </td>
  </tr>
</tbody>
</table>

            <% for ( BetDTO m : list){ %>
            
            
         <script>
		function pop4<%=m.getNum()%>()// 경기등록 팝업
		{
		window.open("./admin/bets.jsp?num=<%=m.getNum() %>","경기등록","width=1280, height=210, left=150, top=240");
		}										
		</script>
<table width="1434" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff" style="margin-bottom:15px;" class="abb1">
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
    <td>  <input type="button" onclick="pop4<%=m.getNum() %>()" id="join-btn" class="ui_btn_gray" value="수정">  
           <a href="./betdetaildel.ap?num=<%=m.getNum() %>" id="join-btn" class="ui_btn_gray"> 삭제</a></td>
</tr>
	<tr>
		<td height="6"></td>
	</tr>
<tr>
		<td  colspan="11"  class="abb" width="1434">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="34" >

				<tbody><tr>
<td align="center"  width="150">
 배팅한 아이디: <span class="color4"> <%= m.getId() %></span></td>
 <td colspan="5" align="left" style="color:balck;" height="30" width="150"><span class="color3">배팅시간:</span> <span class="color4"><%= m.getBettime() %></span></td>
<td colspan="0" align="left" style="color:balck;" height="30" width="170"><span class="color3">배팅머니(원): <span class="color4"><%= m.getPoint() %></span></td>
<td style="color:balck;" width="170"><span class="color3">예상배당(배): </span> <span class="color4"><%= m.getHomeb() %>&nbsp; </span></td>
<td  style="color:balck;" width="350"><span class="color3">예상적중금(원): </span><span class="color4"><%= m.getPointresult() %> &nbsp;</span></td>
<td align="center"  class="sGame" style="color:red;"><%= m.getDoing() %></td>
					
				</tr>
			</tbody></table>
			
		</td>
	</tr>
	</tbody>
	</table>
	
	<% }	%>	
								

<nav>
	<ul class="pagination  justify-content-center">
	
 <%for (int i=1; i<=totalpage; i++) { %>
 	<% if( i != ipage + 1){ %>
 	<li class="page-item"><a class="page-link" href="betinfo.ap?p=<%=i%>"><%= i%></a></li>
  	<% }  else {%>
  	
 <li class="page-item active"><a class="page-link" href="#"><%= i%></a></li>
	<% } %>
	<% } %>
	
	</ul>
</nav>

									


									
                                                
            

          

            

            

            </div>
    
                        
                             
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

     

    </div>
    <!-- End of Content Wrapper -->

  </div>


  <!-- Bootstrap core JavaScript-->
  <script src="./admin/vendor/jquery/jquery.min.js"></script>
  <script src="./admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./admin/js/sb-admin-2.min.js"></script>



</body>

</html>
