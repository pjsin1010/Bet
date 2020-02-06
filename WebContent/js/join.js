//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	$("#idc").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#idc').val();
		 var idReg = /^[a-z0-9]{3,8}$/;
		 
		$.ajax({
			url : '../Check.ap?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);	
				// 버튼 숨기기	
				console.log(user_id);
				
				if(user_id.trim() == ""){
					
					$('#id_check').text('아이디를 입력해주세요:');
					$('#id_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
					} 
				else{
					if(!idReg.test($("#idc").val())) {

						$('#id_check').text("아이디는 소문자와 숫자 3~8자리만 가능합니다");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
						$(".region").hide();
 						}
					else{

						if (data == 0) { 
							// 1 : 아이디가 중복안됨 문구
							$("#id_check").text("사용가능한 아이디입니다.");
							$("#id_check").css("color", "blue");
							$("#reg_submit").attr("disabled", true);
							$(".region").show();
							}

						 else if (data == 1) {
								// 2 : 아이디가 중복되는 문구
								$("#id_check").text("사용중인 아이디입니다.");
								$("#id_check").css("color", "red");
								$("#reg_submit").attr("disabled", true);
								$(".region").hide();
							}



						}

					}


				 

				
 

		
					
			}
		
				, error : function() {
						console.log("실패");
				}
			});
		});
});

//이메일 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	$("#emc").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_email = $('#emc').val();
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		
		$.ajax({
			url : '../Check.ap?Email='+ user_email,
			type : 'get',
			success : function(data1) {
				console.log("1 = 중복o / 0 = 중복x : "+ data1);	
				// 버튼 숨기기	
				
				if(user_email.trim() == ""){
					
					$('#em_check').text('이메일을 입력해주세요:');
					$('#em_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
					} 
				else{
					// 유효성 검사
						if(!regExp.test($("#emc").val())) {

					$('#em_check').text("이메일의 양식에 맞지 않습니다.");
					$('#em_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
						}

						else{
							 if (data1 == 0) { 
								// 1 : 아이디가 중복안됨 문구
								$("#em_check").text("사용가능한 이메일입니다.");
								$("#em_check").css("color", "blue");
								$("#reg_submit").attr("disabled", true);
								$(".region").show();
								}

							 else if (data1 == 1) {
									// 2 : 아이디가 중복됨 문구
									$("#em_check").text("사용중인 이메일입니다.");
									$("#em_check").css("color", "red");
									$("#reg_submit").attr("disabled", true);
									$(".region").hide();
								}

							}

					}

				
		
					
			}
		
				, error : function() {
						console.log("실패");
				}
			});
		});
});



//이름 유효성 검사
$(document).ready(function(){
	$("#name").blur(function() {
		
		var user_name = $('#name').val();
		
		var getName= /^[가-힣]{2,6}$/; 
		$.ajax({
			url : '../Check.ap?Name='+ user_name,
			type : 'get',
			success : function(data3) {
				console.log("1 = 중복o / 0 = 중복x : "+ data3);	
				// 버튼 숨기기	
				console.log(user_name);
				
				if(user_name.trim() == ""){
					
					$('#na_check').text('닉네임을 입력해주세요:');
					$('#na_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
				   }

				   
					else {
						// 유효성 검사
 						 if(!getName.test($("#name").val())) {
						$('#na_check').text("올바르지 않은 닉네임입니다.");
						$('#na_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
						$(".region").hide();
 						}
 						 
 						else{
							 if (data3 == 0) { 
								// 1 : 아이디가 중복안됨 문구
								$("#na_check").text("사용가능한 이름입니다.");
								$('#na_check').css('color', 'red');
	 							$("#reg_submit").attr("disabled", true);
	 							$(".region").show();
								}

							 else if (data3 == 1) {
									// 2 : 아이디가 중복됨 문구
									$("#na_check").text("사용중인 이름입니다.");
									$("#na_check").css("color", "red");
									$("#reg_submit").attr("disabled", true);
									$(".region").hide();
								}

							}
 	 
 						
 	 						
   		} 

					
			}
		
				, error : function() {
						console.log("실패");
				}
			});
		});
});
















//전화번호 유효성 검사(1 = 중복 / 0 != 중복)
$(document).ready(function(){
	$("#phone").blur(function() {
		
		var user_phone = $('#phone').val();
		var regExp =  /^[0-9]{11,11}$/;
		
		$.ajax({
			url : '../Check.ap?Phone='+ user_phone,
			type : 'get',
			success : function(data2) {
				console.log("1 = 중복o / 0 = 중복x : "+ data2);	
				// 버튼 숨기기	
				
				if(user_phone.trim() == ""){
					
					$('#ph_check').text('전화번호를 입력해주세요:');
					$('#ph_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
					} 
				else{
					// 유효성 검사
						if(!regExp.test($("#phone").val())) {

					$('#ph_check').text("전화번호의 양식에 맞지 않습니다.");
					$('#ph_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
					$(".region").hide();
						}

						else{
							 if (data2 == 0) { 
								// 1 : 전화번호 중복안됨 문구
								$("#ph_check").text("사용가능한 전화번호입니다.");
								$("#ph_check").css("color", "blue");
								$("#reg_submit").attr("disabled", true);
								$(".region").show();
								}

							 else if (data2 == 1) {
									// 2 : 전화번호 중복됨 문구
									$("#ph_check").text("가입된 번호입니다.");
									$("#ph_check").css("color", "red");
									$("#reg_submit").attr("disabled", true);
									$(".region").hide();
								}

							}

					}

				
		
					
			}
		
				, error : function() {
						console.log("실패");
				}
			});
		});
});




function chk_frm(){
	if(!document.join.id.value){
	window.alert("아이디를 입력하세요");
	document.join.id.focus();
	return false;
	}

	if(!document.join.pw.value){
	window.alert("비밀번호를 입력하세요");
	document.join.pw.focus();
	return false;
	}

	if(!document.join.name.value){
	window.alert("이름을 입력하세요");
	document.join.name.focus();
	return false;
	}
	if(!document.join.email.value){
	window.alert("이메일을 입력하세요");
	document.join.email.focus();
	return false;
	}
	if(!document.join.phone.value){
	window.alert("휴대폰번호를 입력하세요");
	document.join.phone.focus();
	return false;
	}



	return true;
	}
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);