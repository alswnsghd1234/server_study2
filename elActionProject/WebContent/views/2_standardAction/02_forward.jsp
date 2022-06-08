<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- url로는 http://localhost:8889/ea/views/2_standardAction/02_forward.jsp가 찍혀있을것 -->
	<h1>여기는 02_forward.jsp 페이지야 </h1>
	
	<!-- forward 특성상 url은 그대로고 화면만 바뀐다. -->
	<jsp:forward page="footer.jsp"/>

</body>
</html>