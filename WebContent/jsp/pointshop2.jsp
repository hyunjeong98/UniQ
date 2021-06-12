<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
request.setCharacterEncoding("utf-8");
PointDAO dao= new PointDAO();

String uid = (String) session.getAttribute("id"); 
int upoint = dao.loadpoint(uid);
int uticket = dao.loadticket(uid);

int point = upoint + 10;
int ticket = uticket + 10;

boolean code = dao.buy(uid, point, ticket);
if(point == 1009 && ticket ==1009) out.print("티켓 또는 포인트 계산에서 오류가 발생했습니다. 관리자에게 연락해주세요.");
else if(!code) out.print("구매 중 오류가 발생했습니다. 관리자에게 연락해주세요.");
else{
	session.setAttribute("id", uid);
	response.sendRedirect("home.jsp");
}
	
%>