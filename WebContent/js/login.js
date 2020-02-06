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


	return true;
	}