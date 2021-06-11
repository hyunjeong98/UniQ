<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			request.setCharacterEncoding("utf-8");
			
			String no = request.getParameter("no");
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String DB_URL = "jdbc:mysql://localhost:3306/mysns?allowMultiQueries=true";
				
				Connection conn = DriverManager.getConnection(DB_URL, "root", "1111");
				
				String sql = "delete from myquest where no=?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(no));
				
				pstmt.executeUpdate();
				
				pstmt.close(); conn.close();
			}
			catch(ClassNotFoundException e){
				out.println(e);
			}catch(SQLException e){
				out.println(e);
			}response.sendRedirect("myQuestionExtended.jsp");
			%>
</body>
</html>