<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/ryan.css">
<link rel="stylesheet" href="../css/button.css">
<!--  텍스트박스 디자인 -->
<link rel="stylesheet" href="../css/join.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>회원가입</title>
</head>

<!--  폼 값 ajax -->
<script src="../js/join.js"></script>



<body>


<form name="join" method="post" target="_self" action="../mb_ok.ap" onsubmit="return chk_frm()">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        
        
        
        <!--  텍스트 폼 -->
         <div class="form-group">
         
         아이디 (소문자 or 숫자 3~8자리)
    	 <br><input type="text" name="id" value="" id="idc" >
         <div class="check_font" id="id_check"></div><br>
	
	
		
		 비밀번호
		 <br><input type="password" name="pw" value="" id="userid"> <br>
		
		
		 닉네임 (한글 2~6자리)
		 <br><input type="text" name="name" value="" id="name"> 
		 <div class="check_font" id="na_check"></div><br>
		  
		
		 이메일
		 <br><input type="email" name="email" value="" id="emc"> 
		 <div class="check_font" id="em_check"></div><br>
		 
		 
		 휴대폰번호
		 <br><input type="text" name="phone" value="" id="phone"> 
		 <div class="check_font" id="ph_check"></div> </div> <br>
		 
		 
		 
		 <div class = "region" style="display:none;">
		 <button id="login-btn" type="submit" value="login" border="0" class="ui_btn_red">회원가입</button>
		 </div>
		 
		 <a href="login.jsp" id="join-btn" class="ui_btn_gray">뒤로가기</a> 
		 
		 <!--  폼 --> 
    </form>
    <!--  라이언 움직임 -->
	 <script src="../js/script.js"></script>

		

</body>
</html>