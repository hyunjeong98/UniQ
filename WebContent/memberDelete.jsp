<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
    <title>���� ���� 泥�由�</title>
</head>
<body>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = request.getParameter("password");
        
        // ���대��, ���λ��� 鍮�諛�踰��몃�� 媛��몄�⑤��. 
        // 媛��몄�� 寃곌낵瑜� 媛�吏�怨� ������蹂대�� ��������. -> ����寃곌낵瑜� 諛���
       // MemberDAO dao = MemberDAO.getInstance();
        //int check = dao.deleteMember(id, pw);
        
       // if(check == 1){
            session.invalidate(); // �������ㅻ㈃ �몄����蹂대�� ��������.
    %>
        <br><br>
        <p>������蹂닿� ���������듬����.</p>
        <br><br>
    
        <input type="button" value="����" onclick="">
    
    <%    
         // 鍮�諛�踰��멸� ��由닿꼍�� - ����媛� �������� 寃쎌��
       // }else{
    %>
        <script>
            alert("鍮�諛�踰��멸� 留�吏� ���듬����.");
            history.go(-1); //�ㅻ� 媛�湲�
        </script>
    <%
       // } 
    %>
    
    <!--���⑤� 肄���-->
    <div class="bar">
        
        <div class="bar__container">
            
            <a href="home.html" class="bar__home">
                <img src="icon_home.png" alt="home icon" class="bar__home__icon">
            </a>
            <a href="mysurvey.html" class="bar__mysurvey">
                <img src="icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            </a>
            <a href="pointShop.html" class="bar__pointshop">
                <img src="icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
            </a>
            <a href="settings.html" class="settings">
                <img src="icon_settings.png" alt="settings icon" class="bar__settings__icon">
            </a>
        </div>
    </div>
</body>
</html>

