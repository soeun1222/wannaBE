function check_ok(){
	if(document.reg_frm.u_id.value.length == 0){
		alert("아이디를 입력해야 합니다.");
		reg_frm.u_id.focus();
		return;
	}
	if(document.reg_frm.u_id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.u_id.focus();
		return;
	}
	if(document.reg_frm.u_pwd.value.length == 0){
		alert("비밀번호를 반드시 입력해야 합니다.");
		reg_frm.u_pwd.focus();
		return;
	}
	if(document.reg_frm.u_pwd.value != document.reg_frm.pwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pwd_check.focus();
		return;
	}
	if(document.reg_frm.u_name.value.length == 0){
		alert("이름을 입력해야합니다.");
		reg_frm.u_name.focus();
		return;
	}
	if(document.reg_frm.u_email.value.length == 0){
		alert("이메일을 입력해야합니다.");
		reg_frm.u_email.focus();
		return;
	}
	if(document.reg_frm.u_phone.value.length == 0){
		alert("휴대전화를 입력해야합니다.");
		reg_frm.u_email.focus();
		return;
	}
	if(document.reg_frm.u_birth.value.length == 0){
		alert("생년월일을 입력해야합니다.");
		reg_frm.u_birth.focus();
		return;
	}
	document.reg_frm.submit();

}


function login_ok(){
	if(document.reg_frm.u_id.value.length == 0){
		alert("아이디를 입력해야 합니다.");
		reg_frm.u_id.focus();
		return;
	}
	if(document.reg_frm.u_pwd.value.length == 0){
		alert("비밀번호를 입력해야 합니다.");
		reg_frm.u_pwd.focus();
		return;
	}
	document.reg_frm.submit();
	
	}