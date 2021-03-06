<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member,com.kh.common.PageInfo"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	//loginUser가 null이면 로그인전
	//loginUser가 null이 아니면 로그인 후 화면을 보여주면 된다.
	
	
	String alertMsg =(String)session.getAttribute("alertMsg");
	boolean isAdmin = loginUser !=null && loginUser.getUserId().equals("admin");
	
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



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
    
    #login-form,#user-info{
        float: right;
    }
    .login-area{
        margin-right: 10px;
    }

</style>
</head>
<body>
	<script>		
		var msg = "<%=alertMsg%>"; // "회원가입에 성공했습니다." /"null"
		
		if(msg!="null"){
			alert(msg);
			//알림창을 띄워준 후에 session에 담긴 msg를 지워주지 않으면 
			//해당 페이지가 읽혀질때마다 alert 메세지가 뜨게된다 
			//지워줘야함
			<%session.removeAttribute("alertMsg");%>
		}
		
	</script>




    <h1 align="center">본격 게시판</h1>
    
    <div class="login-area">
    <%if(loginUser==null) {%>
        <!--로그인 전에 보여지는 로그인 form-->
        <form action="<%=contextPath%>/login.me" method="post" id="login-form">
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
                        <button type="button" onclick="enrollPage();">회원가입</button>
                    </th>
                </tr>

            </table>
        </form>

        <script>
            function enrollPage(){
               //location.href="<%=contextPath%>/views/member/MemberEnrollForm.jsp";
            	//url에 디렉토리 구조가 노출되면 보안상 위험하다.
            	//단순한 정적페이지 이동도 servlet을 거쳐서 url에 매핑값만 보일수 있도록 작업하기
            	location.href="/JSP/enrollForm.me";
            }

        </script>


        <%}else{ %>
        <!-- 로그인 성공 후 보여질 영역 -->
        	<div id="user-info">
        		<b><%=loginUser.getUserName()%></b>님 환영합니다  <br><br>
        		<a href="<%=contextPath%>/myPage.me">마이페이지</a>
        		<a href="<%=contextPath%>/logout.me">로그아웃</a>
        		
        	</div>	
        		
        <%}%>
        
        
        
    </div>

    <br>
    <br clear="both"> <!--float 해제-->
    
    <div class="nav-area" align="center">

        <div class="menu"><a href="<%=contextPath%>">HOME</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.no">공지사항</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.bo?cpage=1">일반게시판</a></div>
        <div class="menu"><a href="<%=contextPath%>/list.th">사진게시판</a></div>


    </div>




</body>
</html>