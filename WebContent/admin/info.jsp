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
	// 1. DBClass 파일에 있는 selectinfo() 메소드에
	// 반환된 값(return list)를 mlist 변수에 ArrayList배열로 삽입
	
	ArrayList<SportsDTO> mlist = SportsListDAO.Sports();
	

	
	
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
        
          
          <span class="sidebar-brand-text mx-3" >경기 상태 관리</span>
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
        <td width="80" align="center" class="color_writeS">관리</td>
      </tr>
    </tbody>
	</table>                    
    
    </td>
  </tr>
</tbody>
</table>

<% 	for(SportsDTO m : mlist){
    
	%>
            
<table width="1434" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
										<tbody>
										
										
										<tr class="betting-list">
						
										
										 
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

													
												   
												</tr>
												 
												</tbody></table>
											</td>
											<td width="12%" class="disable">
												
													<table align="center" class="noSelected2">
															                    
													
													<tbody><tr>
														<td align="center" id="id0_18562429_betting" style=" font-weight:bold;"><%= m.getDraw()%> <input type="hidden" name="draw" value="<%= m.getDraw()%>" id="draw" ><br>
											          
											          
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
							<input type="hidden" name="awayb" value="<%= m.getAwayb()%>" id="awayb" ></td>
							<td width="80%" align="right" style="padding-right:5px;  font-weight:bold;" id="id2_18562429_betting" height="23" bgcolor=""><%= m.getAway()%> <input type="hidden" name="away" value="<%= m.getAway()%>" id="away" ></td>
						</tr>
						</tbody></table>
											</td>
											<td width="80" align="center" class="batt_ing"><%= m.getDoing()%><input type="hidden" name="doing" value="진행중" id="doing" >
                                               </td>
                                                
                                                <td> 
                                                   <a href="./betdel.ap?num=<%=m.getId()%>" id="join-btn" class="ui_btn_gray"> 삭제</a></td>
										</tr> 
                                                
						</tbody>
                                                
                                                </table>
                                                
            <% } %>

    <script>
		function pop3()// 경기등록 팝업
		{
		window.open("./admin/sports.jsp","경기등록","width=1280, height=560, left=150, top=240");
		}										
		</script>

            

            

            </div>
                              <input type="button" onclick="pop3()" id="join1-btn" algin="right" class="ui_btn_gray" value="경기등록">         
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

     

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Bootstrap core JavaScript-->
  <script src="./admin/vendor/jquery/jquery.min.js"></script>
  <script src="./admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./admin/js/sb-admin-2.min.js"></script>



</body>

</html>
