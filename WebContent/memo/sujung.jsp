<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file = "_inc_top.jsp" %>

<h2>메모 수정</h2>

<form name="sujungForm">
<input type="hidden" name="no" value="<%=dto.getNo() %>">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="<%=dto.getWriter() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" style="width:300px; height: 200px"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sujung();">수정하기</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function sujung(){
		if(document.sujungForm.writer.value==''){
			alert('작성자를 입력하세요');
			document.sujungForm.writer.focus();
			return;
		}
		
		if(document.sujungForm.content.value==''){
			alert('내용을 입력하세요');
			document.sujungForm.content.focus();
			return;
		}
		
		document.sujungForm.action = "../main/mainProc.jsp?menuGubun=memo_sujungProc";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
	}
</script>