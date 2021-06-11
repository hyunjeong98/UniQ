<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("surveyTitle");
	String qexplain= request.getParameter("surveyExplanation");
	String formlink= request.getParameter("surveyLink");
	int mchoice = Integer.parseInt(request.getParameter("surveyQuestions__choice"));
	int sanswer = Integer.parseInt(request.getParameter("surveyQuestions__shortanswer"));
	int leadtime = Integer.parseInt(request.getParameter("surveyQuestions__leadtime"));
	String deadline = request.getParameter("endDay");
	String target = request.getParameter("surveyTarget");
	String qid = (String) session.getAttribute("id");
	
	//String uemail = request.getParameter("univ_email");
	
	 
	QuestDAO dao= new QuestDAO();
	if(dao.insert(qid, title, qexplain, formlink, mchoice, sanswer, leadtime, deadline, target)) {
%>
	<script>
		alert("설문이 등록되었습니다.");
		location.href='../surveyList.html';
	</script>
<%	

		
	}
	else{
%>
	<script>alert("설문 작성 중 오류가 발생했습니다.");</script>
<%
		
		}
	
%>