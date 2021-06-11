<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid= request.getParameter("id");
	String upass= request.getParameter("pswd1");
	String uname= request.getParameter("name");
	String usex= request.getParameter("gender");
	String univename = request.getParameter("univ_name");
	String univedepart = request.getParameter("univ_department");
	//String uemail = request.getParameter("univ_email");
	
	
	UserDAO dao= new UserDAO();
	if(dao.exists(uid)) {
		out.print("이미 가입한 회원입니다.");
		return;
	}
	if(dao.insert( uid, upass, uname, usex, univename, univedepart)) {
		out.print("회원가입이 완료되었습니다.");
		response.sendRedirect("home.jsp");
	}
	else{
		out.print("회원가입 처리중 오류가 발생하였습니다.");
	}
	
%>