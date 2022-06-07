<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<%@page import="java.util.ArrayList"%>    

<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<%
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	if(searchGubun == null || searchGubun.trim().equals("")){
		searchGubun = "";
	}
	
	if(searchData == null || searchData.trim().equals("")){
		searchData = "";
	}
	
	String searchYesNo="O";
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
		searchYesNo="X";
	}
	

	int no = 0;
	String no_ = request.getParameter("no");
	
	MemoDTO dto = new MemoDTO();
	
	if(!(no_ == null || no_.trim().equals(""))){
		
		no = Integer.parseInt(no_);
		
		MemoDTO arguDto = new MemoDTO();
		arguDto.setNo(no);
		
		MemoDAO arguDao = new MemoDAO();
		dto = arguDao.getSelectOne(arguDto);
	}
%>