<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id"); 

UserObj user = (new UserDAO()).getUserInfo(id);
int point = user.getPoint();

PointObj pobj1 = (new PointDAO()).getStock(1); //포인트샵 첫 번째 칸에 해당하는 pointshop DB불러오기
String item1 = pobj1.getItem();
int ea1 = pobj1.getEa();
int price1 = pobj1.getPrice();

PointObj pobj2 = (new PointDAO()).getStock(2); //포인트샵 두 번째 칸에 해당하는 pointshop DB불러오기
String item2 = pobj2.getItem();
int ea2 = pobj2.getEa();
int price2 = pobj2.getPrice();
%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>포인트샵</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="pointshop__title">
        <h1 class="pointshop__title__text">포인트샵</h1>
    </div>

    <hr class="lightLine">

	<section class="pointshop">
		<div class="background"></div>
		<div class="modal_wrap1">
			<div class="modal_message">
				<%=item1 %> <%=ea1 %>장을<br>
				구매하시겠습니까?<br>
				<br>
				보유 포인트 : <%=point %>p
			</div>
			<a href="pointshop1.jsp"><button class="modal_buy">구매</button></a>
			<button class="modal_cancel1">취소</button>
		</div>
		<div class="modal_wrap2">
			<div class="modal_message">
				<%=item2 %> <%=ea2 %>장을<br>
				구매하시겠습니까?<br>
				<br>
				보유 포인트 : <%=point %>p
			</div>
			<a href="pointshop2.jsp"><button class="modal_buy">구매</button></a>
			<button class="modal_cancel2">취소</button>
		</div>
		<table>
			<tr>
				<td rowspan="3"><img class="pointshop__ticketimg" src="images/ticket.png"></td>
				<td rowspan="3" id="qty1">X5</td>
				<td id="pointshop__td-right"><%=item1 %> <%=ea1 %>장</td>
			</tr>
			<tr>
				<td id="pointshop__td-right"><%=price1 %>p</td>
			</tr>
			<tr>
				<td id="pointshop__td-right"><button id="pointshop__button1">구매</button></td>
			</tr>
		</table>
		<hr class="pointshop__line">
	
		<table>
			<tr>
				<td rowspan="3"><img class="pointshop__ticketimg" src="images/ticket.png"></td>
				<td rowspan="3" id="qty2">X10</td>
				<td id="pointshop__td-right"><%=item2 %> <%=ea2 %>장</td>
			</tr>
			<tr>
				<td id="pointshop__td-right"><%=price2 %>p</td>
			</tr>
			<tr>
				<td id="pointshop__td-right"><button id="pointshop__button2">구매</button></td>
			</tr>
		</table>
	</section>

	<footer>
		<div class="bar">
			<div class="bar__container">
				<a href="home.html" class="bar__home">
					<img src="images/icon_home.png" alt="home icon" class="bar__home__icon">
				</a>
				<a href="myQuestion.html" class="bar__mysurvey">
					<img src="images/icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
				</a>
				<a href="pointShop.html" class="bar__pointshop">
					<img src="images/icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
				</a>
				<a href="settings.html" class="settings">
					<img src="images/icon_settings.png" alt="settings icon" class="bar__settings__icon">
				</a>
			</div>
		</div>
	</footer>
</body>
</html>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/core.js"></script>
<script>
$(document).ready(function() {
	Page.init(start);
});
function start(uid) {
	AJAX.call("jsp/pointShop.jsp", {id: uid}, function(data) {
		var list = JSON.parse(data.trim());
		for (var i=0; i<list.length; i++) {
			frIds += ', "' + list[i].id + '"';
		}
		start2(uid);
	});
}

window.onload = function() {

	function onClick1() {
		document.querySelector('.modal_wrap1').style.display = 'block';
		document.querySelector('.background').style.display = 'block';
	}

	function onClick2() {
		document.querySelector('.modal_wrap2').style.display = 'block';
		document.querySelector('.background').style.display = 'block';
	}

	function offClick1() {
		document.querySelector('.modal_wrap1').style.display = 'none';
		document.querySelector('.background').style.display = 'none';
	}

	function offClick2() {
		document.querySelector('.modal_wrap2').style.display = 'none';
		document.querySelector('.background').style.display = 'none';
	}

	document.getElementById('pointshop__button1').addEventListener('click', onClick1);
	document.querySelector('.modal_cancel1').addEventListener('click', offClick1);
	document.getElementById('pointshop__button2').addEventListener('click', onClick2);
	document.querySelector('.modal_cancel2').addEventListener('click', offClick2);
};
</script>