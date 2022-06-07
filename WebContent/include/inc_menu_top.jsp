<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>

<%
	String linkAddr = path + "/main/main.jsp";
%>
    
<table border="0" width="90%" align="center">
	<tr>
		<td colspan="10" align="right">
			<% if(sessionNo > 0) { %>
				<%=sessionName %> (<%=sessionId %>)님 환영합니다.
				&nbsp;
				<a href="<%=linkAddr %>?menuGubun=noLogin_logout">[로그아웃]</a>
			<% } else { %>
				<a href="<%=linkAddr %>?menuGubun=dashBoard_list">[로그인]</a>
			<% } %>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 0px 10px 0px 10px" id="memo">
			<a href="<%=linkAddr %>?menuGubun=memo_list">메모장</a>
		</td>

		
		<%-- <% if(folderName.equals("product")) { %>
		<% } else { %>
		<% } %> --%>
	</tr>
</table>

<script>
	function applyStyle(){
		document.getElementById('<%=folderName %>').style.backgroundColor = "gray";
	}
	
	applyStyle();
</script>