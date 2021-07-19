function write_ok() {
	if(document.wr_frm.bl_title.value.length == 0) {
		alert("제목을 입력해주세요");
		wr_frm.bl_title.focus();
		return;
	}
	document.wr_frm.submit();
}

function login_rq() {
	alert("로그인이 필요한 서비스입니다.");
	return;
}

function delete_ok() {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.show_frm.submit();
	} else {
		return;
	}
}

function not_like() {
	alert("본인의 게시글에는 좋아요를 누를 수 없습니다.");
	return;
}

function one_like() {
	alert("좋아요는 한번만 누를 수 있습니다.");
	return;
}

function com_write() {
	if(document.com_frm.comm_content.value.length == 0) {
		alert("내용을 입력해주세요");
		com_frm.comm_content.focus();
		return;
	}
	document.com_frm.submit();
}

function com_view() {
	if(document.getElementById('com_com').style.display == 'none') {
		document.getElementById('com_com').style.display = "block";
		document.getElementById('com_bt').value = "댓글닫기 ▲";
	} else {
		document.getElementById('com_com').style.display = "none";
		document.getElementById('com_bt').value = "댓글쓰기 ▼";
	}
}

function com_com_wr() {
	if(document.getElementById('com_com').getElementById('comm_content').value.length == 0) {
		alert("내용을 입력해주세요");
		document.getElementById('com_com').getElementById('comm_content').focus();
		return;
	}
	document.getElementById('com_com').getElementById('comm_content').submit();
}