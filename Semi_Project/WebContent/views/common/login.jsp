<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.member.model.vo.MemberUser"%>
<%
	MemberUser loginUser = (MemberUser)session.getAttribute("loginUser");
	boolean isAdmin = loginUser !=null && loginUser.getUserId().equals("admin");
  	
    
  	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">


<style>
    .form-group{
        width: 500px;
    }
    button{
        width: 500px;
    }
</style>
</head>
<body>
	<%@include file="/views/common/menubar2.jsp"%>
	
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

	<div align="center">
        <h1>로그인</h1>
        <div class="form-group">
            <label for="usr">아이디:</label>
            <input type="text" class="form-control" id="usr">
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호:</label>
                <input type="password" class="form-control" id="pwd">
            </div>
            <button class="btn btn-outline-primary" type="submit">로그인</button><br>
            <button class="btn btn-outline-primary">회원가입</button><br>
        <button class="btn btn-outline-primary">아이디찾기</button><Br>
        <button class="btn btn-outline-primary">비밀번호찾기</button><br>
    </div>
</body>
</html>