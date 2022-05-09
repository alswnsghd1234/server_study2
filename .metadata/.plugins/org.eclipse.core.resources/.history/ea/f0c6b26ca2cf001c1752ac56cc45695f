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
<style>
    .outer{
        background-color: bisque;
            color: darkgoldenrod;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
    }
   	table{
   	 	text-align:center;
    }
   

</style>


</head>
<body>
    <%@ include file = "/views/common/menubar.jsp"%>

    <h2 align="center">공지사항</h2>
    
    <div class="outer">
        
        <table align="center" class="table-hover">
            <thead>
                <tr>
                    <th width="10%">글번호</th>
                    <th width="50%">글제목</th>
                    <th width="15%">작성자</th>
                    <th width="10%">조회수</th>
                    <th width="15%">작성일</th>
                </tr>
            </thead>
            <tbody>
            <!-- 리스트가 비어있는 경우 -->
            <%if(list.isEmpty()){%>
            		<tr>
            			<td colspan="5">존재하는 공지사항이 없습니다.</td>
            		</tr>
            <%}else{%>
            <!-- 비어있지 않을 경우 -->
            <%for(Notice n : list) {%>
                <tr>
                    <td><%=n.getNoticeNo()%></td>
                    <td><%=n.getNoticeTitle() %></td>
                    <td><%=n.getNoticeWriter() %></td>
                    <td><%=n.getCount() %></td>
                    <td><%=n.getCreateDate() %></td>
                </tr>
          	<%}%>
          <%} %>
            </tbody>

        </table>
        <br>
        <!-- 로그인이 안되어있는 상태일때 getUserId를 먼저해버리면 nullpointerException뜸  
        	그래서 null인지 아닌지 먼저 비교후 아이디 admin 비교 해야함 -->
         <%if(loginUser!=null && loginUser.getUserId().equals("admin")) {%>
        <div id="writeBtn"  align="center" >
            <!--<button class="btn btn-info" onclick="location.href="";>글작성</button>  -->
            <a href="<%=contextPath %>/enrollForm.no" class="btn btn-info">글작성</a>
        </div>
        <%} %>
    </div>



</body>
</html>