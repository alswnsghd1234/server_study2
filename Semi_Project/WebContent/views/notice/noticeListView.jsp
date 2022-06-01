<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="/Semi/resources/css/notice.css">
<style>
    .outer{
        background-color: aliceblue;
            color: darkgoldenrod;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
            border : 1px solid black;
    }
   	table{
   	 	text-align:center;
    }
   

</style>


</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>
    
    <div class="container">
  <h2 style="text-align: center">공지사항</h2>         
  <table class="big-noticer">
  	<thead>
          <%if(list.isEmpty()){%>
	      		<tr>
	      			<td colspan="5">존재하는 공지사항이 없습니다.</td>
	      		</tr>
	          <%}else{%>
          
          <%for(Notice n : list) {%>
      <tr>
      	<th class="notice1"><%=n.getNoticeNo()%></th>
        <th class="notice1"><%=n.getNoticeTitle() %></th>
      </tr>
      
      <%} %>
      <%} %>
    </thead>
  </table>
</div>

  
        
        <br>
    <script>
        $(function(){

            $(".notice1").click(function(){
                // console.log("클릭");
                //클릭했을때 해당하는 글의 번호를 넘겨줘야 해당 글의 정보를 알수있음(식별자)
                //해당 tr에 자손 td에 있는 text를 알고싶다
                var nno = $(this).siblings().eq(0).text(); //공지사항글 번호
                console.log(nno);

                location.href='<%=contextPath%>/detail.no?nno='+nno;
            });
            });
    </script>

</body>
</html>