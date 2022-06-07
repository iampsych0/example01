<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
 
 <%@ include file = "../include/inc_header.jsp" %>
 
 <div style="border: 0px solid red; width: 60%; text-align: center; margin: 0 auto;">
 	<font style="font-size: 100px; font-weight: bold;">메모장</font>
 	
 	<% if(sessionNo == 0) { %>
	 	<div style="padding: 20px 0px;">
	 		<form name="loginForm">
	 		아이디 : <input type="text" name="id" style="width: 80px;"> &nbsp;
	 		비밀번호 : <input type="password" name="passwd" style="width: 80px;"> &nbsp;
	 		<button type="button" onclick="login();">로그인</button>
	 		</form>
	 	</div>
	 	
	 	<script>
	 		function login(){
	 			if(confirm('로그인 할까요?')){
	 				document.loginForm.action ="mainProc.jsp?menuGubun=noLogin_loginProc";
	 				document.loginForm.method ="post";
	 				document.loginForm.submit();
	 			}
	 		}
	 	</script>
 	<% } %>

