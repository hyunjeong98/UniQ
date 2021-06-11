<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid= request.getParameter("id");
	String upass= request.getParameter("pswd1");
	String uname= request.getParameter("name");
	String usex= request.getParameter("gender");
	String univename = request.getParameter("univ_name");
	String univedepart = request.getParameter("univ_department");
	//String uemail = request.getParameter("univ_email");
	
	
	String sql= "INSERT INTO quser(id, password, name, sex, univ, depart) VALUES (?,?,?,?,?,?)";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1111");
	PreparedStatement stmt= conn.prepareStatement(sql);
	stmt.setString(1, uid);
	stmt.setString(2, upass);
	stmt.setString(3, uname);
	stmt.setString(4, usex);
	stmt.setString(5, univename);
	stmt.setString(6, univedepart);
	//stmt.setString(7, uemail);
	
	int count = stmt.executeUpdate();
	if(count == 1) {
		out.print("회원가입이 완료 되었습니다.");
	}
	else{
		out.print("회원가입중 오류가 발생하었습니다.");
	}
	stmt.close(); conn.close();
%>