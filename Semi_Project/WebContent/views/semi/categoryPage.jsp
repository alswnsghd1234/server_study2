<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/Semi/resources/css/categoryPage.css">


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	 <%@ include file="/views/common/menubar.jsp"%>

   <div class="list">
    <div class="list1">
		<h3>축구공</h3>
    </div>
    <div class="list2">
		<h3>축구화</h3>
    </div>
    <div class="list3">
		<h3>보호장비</h3>
    </div>

   </div>

  <div class="category">
<%for(Product n : pr) {%>
    <ul id="top-cate">
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate1"><h3><%=n.getProName()%></h3></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate2"><img src=<%=n.getProName()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate3"><img src=<%=n.getProName()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate4"><img src=<%=n.getProName()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate5"><img src=<%=n.getProName()%>" alt=""></div></a>
    </ul>
    

    <ul id="bottom-cate">
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate1"><img src=<%=n.getProImage()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate2"><img src=<%=n.getProImage()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate3"><img src=<%=n.getProImage()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate4"><img src=<%=n.getProImage()%>" alt=""></div></a>
      <a href="<%=contextPath %>/views/semi/detailPage.jsp"><div id="top-cate5"><img src=<%=n.getProImage()%>" alt=""></div></a>
    </ul>
    <%}%>
  </div>
  
  <script>
  	
  
  </script>


</body>
</html>