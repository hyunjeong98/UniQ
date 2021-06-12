<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.*" %>
<%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("login.html");
	return;
	}
	session.setAttribute("id", uid);
	
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>설정</title>
    <link rel="stylesheet" href="../css/style.css?ver=1.1">
</head>
<body>
    <div class="outline__title">
		<a href="settings.html"><img class="leftarrow" src="../images/left-arrow.png"></a>
        <span class="adminQuestion__title__text" style="color: #001d85;">공지사항</span>
        <span id="hide">&lt;</span>
	</div>
	<div class="notice__container">
	
<%
ArrayList<noticeObj> notices = (new noticeDAO()).getList();

String str = "<table class='notice__container__table'>";


for(noticeObj notice: notices) {
	str += "<tr>";
	str += "<td>" + notice.getTs().substring(0,10) + "</td>";
	str += "<td class='article'>" + notice.getAtitle() + "</td>";
	str += "</tr>";
	str += "<tr>";
	str += "<td class='content' colspan=2 align=left>" + notice.getContent() + "</td>";
	str += "</tr>";
}
str += "</table>";
out.print(str);
%>	

    </div>
    
    <!--하단바 코드-->
    <div class="bar">
			
				<div class="bar__container">
			
					<a href="adminUser.html" class="bar__home">
						<img src="../images/icon_user.png" alt="home icon" class="bar__home__icon">
					</a>
					<a href="adminQuestion.html" class="bar__mysurvey">
						<img src="../images/icon_adminsurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
					</a>
					<a href="adminPoint.html" class="bar__pointshop">
						<img src="../images/icon_adminpointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
					</a>
					<a href="../adminSetting.html" class="settings">
						<img src="../images/icon_settings.png" alt="settings icon" class="bar__settings__icon">
					</a>
				</div>
	</div>
</body>
</html>