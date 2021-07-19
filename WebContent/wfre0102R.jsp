<%@page import="board.WannaBeDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="wb" class="board.WannaBe"></jsp:useBean>
<jsp:setProperty property="*" name="wb"/>
<%
	WannaBeDB manager = WannaBeDB.getInstance();

	if(manager.confirmID(wb.getU_id()) == 1){
		System.out.println("@@@###getU_id ===>" + manager.confirmID(wb.getU_id()));
%>
		<script>
			alert("중복되는 아이디가 존재합니다.");
			history.back();
		</script>
<%
	}else{
		System.out.println("@@@###getu_id ===>"+manager.confirmID(wb.getU_id()));
		int re = manager.insertMember(wb);
		System.out.println("@@@###re ===>" + re);
		
		if(re == 1){
%>
		<script>
			alert(" 회원가입을 축하드립니다.\n\n 로그인 화면으로 이동합니다.");
			document.location.href = "wflg0101R.jsp";
		</script>
<%
		} else {
%>
		<script>
			alert("회원가입에 실패했습니다.");
			document.location.href = "wflg0101R.jsp";
		</script>
<%
		}
	}
%>


