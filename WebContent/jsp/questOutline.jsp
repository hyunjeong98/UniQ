
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String title = request.getParameter("title");
	QuestObj info = (new QuestDAO()).getInfo(title);
	String id = (String) session.getAttribute("id"); 
	UserObj user = (new UserDAO()).getUserInfo(id);
	String univ = user.getUniv();
	
	String target = info.getTarget();
	String explain = info.getExplain();
	String deadline = info.getDeadline();

	int mChoice = info.getMchoice();
	int sAnswer = info.getSanswer();
	int tot = mChoice + sAnswer;
	int leadTime = info.getLeatTime();
	
	int jno = info.getQno();
	String[] links = info.getFormlink().split("/");
	String link = links[4] + "/" + links[5];
	String pageurl = "https://www.docs.google.com/forms/" + link + "/viewform";
	//String pageurl = "intent://docs.google.com/forms/" + link + "/viewfomr#Intent;scheme=http;package=com.android.chrome;end";


	
	if(target.equals("campus")){
		target = univ;
	}
	else target = "전국";

%>


<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/style.css"> 
	<title>설문 정보</title>

</head>
<body>
	<div class="outline__title">
		<a href="surveyList.jsp"><img class="leftarrow" src="../images/left-arrow.png"></a>
        <span class="register__title__text">설문 정보</span>
        <span id="hide">&lt;</span>
	</div>
	<div class="outline__container">
		<section class="sec1">
			<h3>[<%= target %>]&nbsp;<%= title %>
			</h3>
			<p>
				<%= explain %>
			</p>
			<p class="deadline">
				마감기한 : <%= deadline %>
			</p>
		</section>
		<hr class="boldline">
		<section class="sec2">
			<div>
				<h3>문항수</h3>
				<p>총 <%= tot %>문항</p>
				<p>객관식 : <%= mChoice %>문항</p>
				<p>주관식 : <%= sAnswer %>문항</p>
			</div>
		
			<div>
				<h3>소요 시간</h3>
				<p>
					<%= leadTime %> 분
				</p>
			</div>
		
			<div>
				<h3>적립 예정 포인트</h3>
				<p>
					5p
				</p>
			</div>
		</section>
		<div class="empty"></div>
	</div>
	<div class="outline__buttons" id="outline__buttons">
		<button class="outline__buttons__back" onclick="history.go(-1)">돌아가기</button>
		<button class="outline__buttons__participate" id="outline__buttons__participate">참여하기</button>
		<button class="outline__buttons__participate ok" id="outline__buttons__participate ok">참여완료</button>
		
	</div>
	
</body>
</html>

<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>

function openDialog(url, name, options, closeCallback) {

    var win = window.open(url, name, options);

    var interval = window.setInterval(function() {

        try {

            if (win == null || win.closed) {

                window.clearInterval(interval);

                closeCallback(win);

            }

        }

        catch (e) {

        }

    }, 1000);

    return win ;

}

var jno = "<%= jno %>";
var pageurl = "<%= pageurl %>";
var button = document.getElementById("outline__buttons__participate ok");

function myfunc(){
	window.location.href = "questOk.jsp?jno=" + jno;
}


var participate = document.getElementById("outline__buttons__participate");
participate.addEventListener("click",function(){
	openDialog(pageurl, "", "_blank", function(win) {
		button.addEventListener("click", function(){
			window.location.href = "questOk.jsp?jno=" + jno;
		});
	});
	
});
		
	
			
			
			


	
	

</script>
