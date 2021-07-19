function remove_ok(){
	if (document.remove_frm.u_pwd.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		remove_frm.u_pwd.focus();
		return;
	}
	if(confirm("정말 삭제하시겠습니까?") == true) {
		if (document.remove_frm.u_pwd.value != document.remove_frm.pwd_check.value){
			alert("비밀번호가 일치하지 않습니다.");
			remove_frm.pwd_check.focus();
			return;
		}else{
			alert("정상적으로 탈퇴되었습니다.");
		}
	} else {
		return;
	}
	document.remove_frm.submit();
}

function memidedit_ok(){
	if (document.memedit_frm.u_email.value.length == 0) {
		alert("이메일을 입력하세요.");
		memedit_frm.u_email.focus();
		return;
	}
	if (document.memedit_frm.u_phone.value.length == 0) {
		alert("전화번호를 입력하세요.");
		memedit_frm.u_phone.focus();
		return;
	}
	if(confirm("정말 수정하시겠습니까?") == true) {
		document.memedit_frm.submit();
	} else {
		return;
	}
}

function delete_ok() {
}

function idedit_ok(){
	if (document.edit_frm.u_pwd.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		edit_frm.u_pwd.focus();
		return;
	}
	if (document.edit_frm.u_pwd.value != document.edit_frm.pwd_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		edit_frm.pwd_check.focus();
		return;
	}
	if (document.edit_frm.u_email.value.length == 0) {
		alert("이메일을 입력하세요.");
		edit_frm.u_email.focus();
		return;
	}
	if (document.edit_frm.u_phone.value.length == 0) {
		alert("전화번호를 입력하세요.");
		edit_frm.u_phone.focus();
		return;
	}
	if(confirm("정말 수정하시겠습니까?") == true) {
		if (document.edit_frm.u_pwd.value != document.edit_frm.pwd_check.value){
			alert("비밀번호가 일치하지 않습니다.");
			edit_frm.pwd_check.focus();
			return;
		}else{
			alert("정상적으로 수정되었습니다.");
		}
	} else {
		return;
	}
	document.edit_frm.submit();
}