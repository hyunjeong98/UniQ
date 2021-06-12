<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	int jno = Integer.parseInt(request.getParameter("jno"));
	
	QuestDAO quest = new QuestDAO();
	UserDAO user = new UserDAO();
	
	boolean updateJoinquest = quest.updateJoinquest(id, jno);
	boolean updatePoint = user.updatePoint(id, 1);
	
	if(updateJoinquest == true && updatePoint == true){
		response.sendRedirect("home.jsp");
	}
	
	else  out.print("오류 발생"); 

%>	

	
	