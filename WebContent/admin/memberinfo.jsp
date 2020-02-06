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
	int cnt = MemberDAO.memberCount();
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
	
	ArrayList<MemberDTO> list = MemberDAO.selectinfo(start , exit);
	
	
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
        
          
          <span class="sidebar-brand-text mx-3" >회원정보 관리</span>
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
            <table width="1034" border="0" cellspacing="0" cellpadding="0" style="margin-top:15px;">
  <tbody><tr>
    <td valign="top" class="pattern-header"  >
    
    <table width="1434" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="116" height="20" align="center" class="color_writeS">아이디</td>
        <td width="283" align="center" class="color_writeS">비밀번호</td>
        <td width="203" align="center" class="color_writeS">닉네임</td>
        <td width="283" align="center" class="color_writeS">포인트</td>
        <td width="50" align="center" class="color_writeS">레벨</td>
        <td width="70" align="center" class="color_writeS">관리</td>
      </tr>
    </tbody>
	</table>                    
    
    </td>
  </tr>
</tbody>
</table>


		
             <% for ( MemberDTO m : list){ %>
             
        <script>
		function pop5<%=m.getId()%>()// 멤버 관리 팝업
		{
		window.open("./admin/memberedit.jsp?num=<%=m.getId()%>","회원수정","width=1280, height=380, left=150, top=240");
		}										
		</script>
		
		
<table width="1434" border="0" cellspacing="2" cellpadding="0" bgcolor="#ffffff" style="margin-bottom:15px;" class="abb1">
    
    <tr class="no" height="35">
		<td width="12%" class="no" align="center"><span style="color:#ff0000;font-weight:bold;"><%=m.getId() %></span></td>
		<td width="32%" class="subjectL"><%=m.getPw() %><font color="#FF1212"><font style="color:#FF0000; font-size:11px;"></font></marquee></font></a></td>
		<td width="20%" class="write" align="center"><%=m.getName() %></td>
        <td width="31%" class="write" align="center"><%=m.getPoint() %></td>
		<td width="20%" class="regdate" align="center"><%=m.getLevel() %></td>
		 <td width="20%">  
		 <input type="button" onclick="pop5<%=m.getId()%>()" id="join-btn" class="ui_btn_gray" value="수정">  
		 <a href="./memberdel.ap?num=<%=m.getId()%>" id="join-btn" class="ui_btn_gray"> 삭제</a></td>
            </tr>	
    
    
    
</table>


<%} %>
								

                            
            

          

            

            

            </div>
                       <nav>
	<ul class="pagination  justify-content-center">
	
 <%for (int i=1; i<=totalpage; i++) { %>
 	<% if( i != ipage + 1){ %>
 	<li class="page-item"><a class="page-link" href="memberinfo.ap?p=<%=i%>"><%= i%></a></li>
  	<% }  else {%>
  	
 <li class="page-item active"><a class="page-link" href="#"><%= i%></a></li>
	<% } %>
	<% } %>
	
	</ul>
</nav>      
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
