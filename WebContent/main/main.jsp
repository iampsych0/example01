<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="60%" align="center">
	<tr>
		<td height="100">
		
			<jsp:include page="../include/inc_menu_top.jsp"></jsp:include>
			
		</td>
	</tr>
	<tr>
		<td style="padding : 50px 0px;">
		
			<jsp:include page="<%=includePage %>"></jsp:include>
	
		</td>
	</tr>
</table>
</body>
</html>