<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file = "_inc_top.jsp" %>

<%
	String content = dto.getContent();
	content = content.replace("\n", "<br>");
%>
<h2>메모 삭제</h2>

<form name="sakjeForm">
<input type="hidden" name="no" value="<%=dto.getNo() %>">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=content %></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sakje();">삭제하기</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function sakje(){
		document.sakjeForm.action = "../main/mainProc.jsp?menuGubun=memo_sakjeProc";
		document.sakjeForm.method = "post";
		document.sakjeForm.submit();
	}
</script>