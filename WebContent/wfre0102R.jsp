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
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
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
			alert(" ȸ�������� ���ϵ帳�ϴ�.\n\n �α��� ȭ������ �̵��մϴ�.");
			document.location.href = "wflg0101R.jsp";
		</script>
<%
		} else {
%>
		<script>
			alert("ȸ�����Կ� �����߽��ϴ�.");
			document.location.href = "wflg0101R.jsp";
		</script>
<%
		}
	}
%>


