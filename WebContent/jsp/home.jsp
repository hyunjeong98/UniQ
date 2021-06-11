<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id"); 

UserObj user = (new UserDAO()).getUserInfo(id);

String name = user.getName();
String univ = user.getUniv();
String depart = user.getDepart();
int point = user.getPoint();
int ticket = user.getTicket();

	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <!-- HOME -->
    <div class="home__title">
        <h1 class="home__title__text">홈</h1>
    </div>

    <hr class="lightLine">
    <div class="home__profile">
        
        <br>
        <table class="home__profile__table">
            <tr>
                <td><img src="../images/avatar.png" alt="avatar" class="home__profile__avatar"></td>
                <td class="home__profile__float">
                    <span class="home__profile__name"><%= name %></span>
                    <span class="home__profile__major"><%= univ %> <%= depart %></span>
                    <br>
                    <span class="home__profile__upoint"><%= point %></span>
                    <span class="home__profile__p">p</span>
                    <span class="home__profile__uticket"><%= ticket %></span>
                    <span class="home__profile__ticket">ticket</span>
                </td>
            </tr>
            
        </table>
        <br>
        
        
    </div>
    <hr class="lightLine">

    <div class="home__buttons">
        <a href="../register.html"><button class="home__button_register">설문 등록</button></a>
        <a href="surveyList.jsp"><button class="home__button_participate">설문 참여</button></a>
    </div>

    <div class="empty"></div>

    
    
    <div class="bar">
        
        <div class="bar__container">
            
            <a href="home.html" class="bar__home">
                <img src="../images/icon_home.png" alt="home icon" class="bar__home__icon">
            </a>
            <a href="myQuestion.html" class="bar__mysurvey">
                <img src="../images/icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            </a>
            <a href="pointShop.html" class="bar__pointshop">
                <img src="../images/icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
            </a>
            <a href="settings.html" class="settings">
                <img src="../images/icon_settings.png" alt="settings icon" class="bar__settings__icon">
            </a>
        </div>
    </div>
</body>
</html>