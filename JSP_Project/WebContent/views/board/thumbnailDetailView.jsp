<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*,java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .outer{
            background-color: bisque;
            color: black;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
            height: 800px;
        }
        .detail-area{
            border: 1px solid #000000;
        	text-align:center;
        	width: 700px;
        	height: 700px
        	
        }
</style>
</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판 상세보기</h2>
        <br>

        <table class="detail-area" align="center">
            <!-- (tr>td*4)*5 -->
            <tr>
                <td>제목</td>
                <td colspan="3"><%=b.getBoardTitle() %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%=b.getBoardWriter() %></td>
                <td>작성일</td>
                <td><%=b.getCreateDate() %></td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="3"><p style="height: 50px;"><%=b.getContent() %></p></td>
            </tr>
            <tr>
                <td>대표사진</td>
                <td colspan="3">
                  	<div>
                    <img src="<%=contextPath %>/<%=list.get(0).getFilePath()+list.get(0).getChangename()%>" width="400" height="300">
           			</div>
           		</td>
            </tr>
            <tr>
                <td>상세사진</td>
                <td colspan="3">
					<%for(int i=1; i<list.size(); i++) {%>
                    <img src="<%=contextPath %>/<%=list.get(i).getFilePath()+list.get(i).getChangename()%>" width="200" height="150">
   					<%} %>
                </td>

            </tr>

        </table>


    </div>


</body>

</html>