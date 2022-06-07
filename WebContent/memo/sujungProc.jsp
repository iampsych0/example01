<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<%	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	MemoDTO dto = new MemoDTO();
	dto.setNo(no);
	dto.setWriter(writer);
	dto.setContent(content);
	
	MemoDAO dao = new MemoDAO();
	int result = dao.setUpdate(dto);
	
	if(result > 0 ){
		out.println("<script>");
		out.println("location.href = 'main.jsp?menuGubun=memo_view&no=" + no + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정중 오류가 발생했습니다');");
		out.println("location.href = 'main.jsp?menuGubun=memo_sujung&no=" + no + "';");
		out.println("</script>");
	}
%>