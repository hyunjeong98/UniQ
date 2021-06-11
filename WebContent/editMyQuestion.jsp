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
<form action="deleteMyQuestion.jsp">
	<header>
		<div>
			<table>
				<tr>
					<td class="list_button">
						<button onclick="내_설문_리스트로_가는_링크"><img  src="이미지"></button>
					</td>
					<td><h3 id="joined_list_header">내가 등록한 설문 리스트</h3></td>
				</tr>
			</table>
		</div>
	</header>
	<nav>
			<div>
				<table>
					<tr>
						<td>
							<select name="job">
							    <option value="recent">최신순</option>
							    <option value="asc">오름차순</option>
							    <option value="desc">내림차순</option>
							    <option value="spelling">가나다순</option>
							</select>
						</td>
						<td class="list_search">
							<input type="text" placeholder="검색어를 입력해주세요.">
						</td>
						<td class="list_button">
							<button onclick=""><img  src="이미지경로"></button>
						</td>
					</tr>
				</table>
			</div>
		</nav>
	<section>

		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?allowMultiQueries=true", "root", "1111");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select no, range, title, deadline from myquest");
		
		int pageSize=10;
		
		String str = "<table><tr><td>";
		while(rs.next()){
			var i =0;
			i++;
		%>
		<input type="button"  value="<%=rs.getString("range")%> <%=rs.getString("title")%> <%=rs.getString("deadline")%>">
		</td>
		<td>
		<input type="checkbox"  name="questionNo" value="<%=i %>"/>
		<%
		str += "</td></tr>";
		}
		str += "</table>";
		out.print(str);
		String[] noValues = request.getParameterValues("questionNo");
		%>		
		<input type="button"  value = "편집" onClick="location.href='deleteMyQuestion.jsp?no=<%=rs.getArray("questionNo")%>'"/>
		<%
		rs.close(); stmt.close(); conn.close();
		%>
		
	</section>
	<footer>
      	<div class="bar">
        
        	<div class="bar__container">
            
            	<a href="home.html" class="bar__home">
                	<img src="icon_home.png" alt="home icon" class="bar__home__icon">
            	</a>
           		<a href="mysurvey.html" class="bar__mysurvey">
                	<img src="icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            	</a>
            	<a href="pointshop.html" class="bar__pointshop">
                	<img src="icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
            	</a>
            	<a href="settings.html" class="settings">
                	<img src="icon_settings.png" alt="settings icon" class="bar__settings__icon">
            	</a>
         	</div>
      	</div>
   	</footer>
</form>
</body>
</html>