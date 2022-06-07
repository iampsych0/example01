<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file = "_inc_top.jsp" %>

<h2>메모 상세보기</h2>

<table border="1">
	<tr>
		<td>순번</td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=dto.getContent() %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
</table>

<hr>

|
<a href ="#" onclick="move('memo_list', '');">목록</a>
|
<a href ="#" onclick="move('memo_chuga', '');">등록</a>
|
<a href ="#" onclick="move('memo_sujung', '<%=dto.getNo() %>');">수정</a>
|
<a href ="#" onclick="move('memo_sakje', '<%=dto.getNo() %>');">삭제</a>
|

<script>
	function move(value1, value2){
		location.href = 'main.jsp?menuGubun=' + value1 + '&no=' + value2;
	}
</script>