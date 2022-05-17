<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.Board,java.util.ArrayList"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
            height: 800px;
        }
    .list-area{
        width: 760px;
        margin: auto;
    }
    .thumbnail{
        border: 1px solid black;
        width: 220px;
        display: inline-block;
        margin: 15px;
    }
    .thumbnail:hover{
        cursor: pointer;
        opacity: 0.5;
    }

</style>
</head>
<body>
        <%@include file="/views/common/menubar.jsp"%>

        <div class="outer">
            <br>
            <h2 align="center">사진게시판</h2>
            <br>    
	
			<!-- 로그인한 회원만 보이게 작성 -->
			<%if(loginUser != null) {%>
            <div id="writebtn" align="center">
                <a href="<%=contextPath%>/enrollForm.th" class="btn btn-info">글작성</a>
            </div>
            <%} %>

            <div class="list-area">
            <%if(!list.isEmpty()) {%>
	            <%for(Board b : list) {%>
	                <div class="thumbnail" align="center">
                        <input type="hidden" value="<%=b.getBoardNo()%>">
	                    <img src="<%=contextPath%>/<%=b.getTitleImg()%>" alt="" width="200px" height="150px">
	                    <p>
	                        No. <%=b.getBoardNo()%> <%=b.getBoardTitle() %> <br>
	                        조회수 : <%=b.getCount()%>
	                    </p>
	                </div>
				<%} %>
			<%}else{%>
				등록된 게시글이 없습니다
				<%} %>
            </div>
        </div>
        <script>
            //게시글 클릭시 상세보기 요청 함수 
            $(function(){
                $(".thumbnail").click(function(){    
                                  //$(this).children.eq(0).val() - 보드 NO 
                    location.href ="<%=contextPath%>/detail.th?bno="+$(this).children().eq(0).val();
                })
            })
        

        </script>


</body>
</html>