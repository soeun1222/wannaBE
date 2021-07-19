<%@page import="nonFace.NfBean"%>
<%@page import="comment.ComBean"%>
<%@page import="nonFace.NfDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="com" class="comment.ComBean"></jsp:useBean>
<jsp:setProperty property="*" name="com"/>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfns0101R.jsp");
	}
	
	int nf_num = 0;
	
	if (request.getParameter("nf_num") != null) {
		nf_num = Integer.parseInt(request.getParameter("nf_num"));
	}
	
	/*--pageNum값 받기--*/
	String pageNum = request.getParameter("pageNum");
	
	/*--대댓글일때--*/
	int comm_num = 0, comm_ref = 0, comm_step = 0, comm_level = 0;
	
	if (request.getParameter("comm_num") != null) {
		comm_num = Integer.parseInt(request.getParameter("comm_num"));
	}
	
	if (comm_num != 0) {
		comm_ref = Integer.parseInt(request.getParameter("comm_ref"));
		comm_step = Integer.parseInt(request.getParameter("comm_step"));
		comm_level = Integer.parseInt(request.getParameter("comm_level"));
	} else {
		comm_ref = nf_num;
	}
	
	NfDBBean db = NfDBBean.getinstance();

	
	ComBean comBoard = new ComBean();
	
	comBoard.setComm_content(com.getComm_content());
	comBoard.setComm_ref(comm_ref);
	comBoard.setComm_step(comm_step);
	comBoard.setComm_level(comm_level);
	comBoard.setU_id(u_id);
	comBoard.setTable_num(nf_num);

	int re = db.insertComment(comBoard);
	
	if(re == 1) {
%>
		<script>
			alert("댓글 등록이 등록되었습니다.");
		</script>
<%
		response.sendRedirect("wfns0105R.jsp?nf_num=" + nf_num + "&u_id=" + u_id + "&pageNum=" + pageNum);
	} else {
%>
		<script>
			alert("댓글 등록에 실패하였습니다.");
		</script>
<%
	}
%>