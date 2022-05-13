<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.PageInfo,java.util.ArrayList,com.kh.board.model.vo.Board"%>


<%
	PageInfo pi =(PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
            height: 600px;
        }
        .list-area{
            border: 1px solid darkgoldenrod;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>

    <div class="outer">
        <br>
        <h2 align="center">일반 게시판</h2>

        <table align="center" class="list-area">
            <thead>
                <tr>
                    <th width="70">글번호</th>
                    <th width="70">카테고리</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
            	
            	<%if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="6">작성된 게시글이 없습니다.</td>
            		</tr>
            
            	<%}else{ %>
            		<%for(Board b : list) {%>
            		<tr>
                    	<td><%=b.getBoardNo() %></td>
                    	<td><%=b.getCategory() %></td>
                    	<td><%=b.getBoardTitle() %></td>
                    	<td><%=b.getBoardWriter() %></td>
                    	<td><%=b.getCount() %></td>
                    	<td><%=b.getCreateDate() %></td>
                	</tr>
                	<%} %>
            	<%} %>
            
                <!-- <tr>
                    <td>5</td>
                    <td>운동</td>
                    <td>오늘의 운동일지</td>
                    <td>김헬스</td>
                    <td>2</td>
                    <td>2021-01-01</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>게임</td>
                    <td>와 저 잘한듯</td>
                    <td>김프로준비생</td>
                    <td>5</td>
                    <td>2022-09-08</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>요리</td>
                    <td>자취밥상 꿀팁</td>
                    <td>자취10년차</td>
                    <td>15</td>
                    <td>2022-10-05</td>
                </tr> -->

            </tbody>

            <script>
                $(function(){
                    $(".list-area>tbody>tr").click(function(){
                        location.href ="<%=contextPath%>/detail.bo?bno="+$(this).children().eq(0).text();
                    });
                })
            </script>

        </table>
        <br>
        <!--로그인한 회원만 보일 수 있도록 -->
        <%if(loginUser!=null){%>
        <div align="center">
            <a href="<%=contextPath%>/enrollForm.bo" class="btn btn-info">글작성</a>
        </div>
        <br>
        <%}%>

        <div class="paging-area" align="center">
       		<%if(currentPage!=1){ %>
            <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=currentPage-1%>'">&lt;</button>
            <%} %>
            
            <%for(int i =startPage; i<=endPage; i++){ %>
	 			<%if(i!=currentPage){ %>
	            	<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=i%>'"><%=i %></button>
                    <%}else{ %>
				  	<button disabled><%=i %></button>         
	            <%} %>
            <%} %>
            
            <%if(currentPage!=maxPage){ %>
            <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=currentPage+1%>'">&gt;</button>
       		<%} %>
       
        <!-- <button>1</button>
	        <button>2</button>
	        <button>3</button>
	        <button>4</button>
	        <button>5</button>
	        <button>6</button>
	        <button>7</button>
	        <button>8</button>
	        <button>9</button>
	        <button>10</button> -->
        </div>
    </div>

</body>
</html>