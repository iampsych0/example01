<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String path = request.getContextPath();
	
	String menuGubun = request.getParameter("menuGubun");
	//System.out.println("menuGubun" + menuGubun);

	if(menuGubun == null || menuGubun.trim().equals("")){
		menuGubun = "dashBoard_list";
	}
	
	String[] imsiArray = menuGubun.split("_");
	String folderName = imsiArray[0];
	String fileName = imsiArray[1];
	String includePage = "../" + folderName + "/" + fileName + ".jsp";
	//System.out.println("includePage" + includePage);
	
	// -- 로그인 여부 체크 --
	int sessionNo = 0;
	String sessionId = "";
	String sessionName = "";
	
	if(session.getAttribute("sessionNo") != null){ //로그인한 상태
		sessionNo = (Integer)session.getAttribute("sessionNo");
		sessionId = (String)session.getAttribute("sessionId");
		sessionName = (String)session.getAttribute("sessionName");
	}
	
	/* if(sessionNo == 0 && !menuGubun.equals("dashBoard_list")) {
		out.println("<script>");
		out.println("alert('로그인 하신 후 이용하세요');");
		out.println("location.href='main.jsp?menuGubun=dashBoard_list';");
		out.println("</script>");
	} */
%>