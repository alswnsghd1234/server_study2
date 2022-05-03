<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	//loginUser가 null이면 로그인전
	//loginUser가 null이 아니면 로그인 후 화면을 보여주면 된다.
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .nav-area{background-color: blanchedalmond;}
    .menu{
        display: inline-block;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration: none;
        color: brown;
        font-size: 20px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 50px;
    }
    .menu a:hover{
        background-color: darksalmon;
    }

</style>
</head>
<body>
    <h1 align="center">본격 게시판</h1>
    <div class="login-area">
    <%if(loginUser==null) {%>
        <!--로그인 전에 보여지는 로그인 form-->
        <form action="/JSP/login.me" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" required></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button">회원가입</button>
                    </th>
                </tr>

            </table>
        </form>
        <%}else{ %>
        <!-- 로그인 성공 후 보여질 영역 -->
        	<div id="user-info">
        		<b><%=loginUser.getUserName()%></b>님 환영합니다  <br><br>
        		<a href="#">마이페이지</a>
        		<a href="#">로그아웃</a>
        		
        	</div>	
        		
        <%}%>
        
        
        
    </div>

    <br>
    
    <div class="nav-area" align="center">

        <div class="menu"><a href="/JSP">HOME</a></div>
        <div class="menu"><a href="">공지사항</a></div>
        <div class="menu"><a href="">일반게시판</a></div>
        <div class="menu"><a href="">사진게시판</a></div>


    </div>




</body>
</html>