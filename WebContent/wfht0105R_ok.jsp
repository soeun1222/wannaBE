<%@page import="homeTip.HtBean"%>
<%@page import="comment.ComBean"%>
<%@page import="homeTip.HtDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="com" class="comment.ComBean"></jsp:useBean>
<jsp:setProperty property="*" name="com"/>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfht0101R.jsp");
	}
	
	int ht_num = 0;
	
	if (request.getParameter("ht_num") != null) {
		ht_num = Integer.parseInt(request.getParameter("ht_num"));
	}
	
	/*--�ش� �� �ۼ��� �ޱ�--*/
	
	String ht_id = "";
	if(request.getParameter("ht_id") != null) {
		ht_id = request.getParameter("ht_id");
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");
	
	/*--�����϶�--*/
	int comm_num = 0, comm_ref = 0, comm_step = 0, comm_level = 0;
	
	comm_ref = ht_num;
	
	if (request.getParameter("comm_num") != null) {
		comm_num = Integer.parseInt(request.getParameter("comm_num"));
	}
	
	if (comm_num != 0) {
		comm_ref = Integer.parseInt(request.getParameter("comm_ref"));
		comm_step = Integer.parseInt(request.getParameter("comm_step"));
		comm_level = Integer.parseInt(request.getParameter("comm_level"));
	} else {
		comm_ref = ht_num;
	}
	
	HtDBBean db = HtDBBean.getinstance();

	
	ComBean comBoard = new ComBean();
	
	comBoard.setComm_content(com.getComm_content());
	comBoard.setComm_ref(comm_ref);
	comBoard.setComm_step(comm_step);
	comBoard.setComm_level(comm_level);
	comBoard.setU_id(u_id);
	comBoard.setTable_num(ht_num);

	int re = db.insertComment(comBoard);
	
	if(re == 1) {
%>
		<script>
			alert("��� ����� ��ϵǾ����ϴ�.");
		</script>
<%
		response.sendRedirect("wfht0105R.jsp?ht_id=" + ht_id + "&ht_num=" + ht_num + "&u_id=" + u_id + "&pageNum=" + pageNum);
	} else {
%>
		<script>
			alert("��� ��Ͽ� �����Ͽ����ϴ�.");
		</script>
<%
	}
%>