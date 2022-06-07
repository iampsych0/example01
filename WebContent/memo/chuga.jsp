<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file = "_inc_top.jsp" %>

<h2>메모 등록</h2>

<form name="chugaForm">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" style="width:300px; height: 200px"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="chuga();">저장하기</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function chuga(){
		if(document.chugaForm.writer.value==''){
			alert('작성자를 입력하세요');
			document.chugaForm.writer.focus();
			return;
		}
		
		if(document.chugaForm.content.value==''){
			alert('내용을 입력하세요');
			document.chugaForm.content.focus();
			return;
		}
		
		document.chugaForm.action = "../main/mainProc.jsp?menuGubun=memo_chugaProc";
		document.chugaForm.method = "post";
		document.chugaForm.submit();
	}
</script>