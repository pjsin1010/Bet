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
		} 
String name = (String) session.getAttribute("name");
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
        
          
          <span class="sidebar-brand-text mx-3" >경기결과 상태 관리</span>
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

            
<table width="1434" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff">
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
											<td> <a href="??.ap" id="join-btn" class="ui_btn_gray"> 삭제</a></td>
										</tr>
						</tbody></table>

								



									


									
                                                
            

          

            

            

            </div>
                              <a href="./inser.ap" id="join1-btn" algin="right" class="ui_btn_gray">경기등록</a>              
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

     

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
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
