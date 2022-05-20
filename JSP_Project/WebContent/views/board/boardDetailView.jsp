<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*"%>
    <%
    	Board b = (Board)request.getAttribute("b");
    	//게시글 번호,카테고리명,제목,내용,유저아이디,작성일
    	Attachment at = (Attachment)request.getAttribute("at");
    	//파일번호,원본명,수정명,저장경로
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
</style>
</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>
    <div class="outer">
        <br>
        <h2 align="center">일반 게시판 상세보기</h2>
        <br>

        <table id="detail-area" align="center" border="1">
            <!-- (tr>th+td+th+td)*4 -->
            <tr>
                <th width="60">카테고리</th>
                <td width="60"><%=b.getCategory() %></td>
                <th width="60">제목</th>
                <td width="350"><%=b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%=b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%=b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                	<p style="height:200px"><%=b.getContent() %></p>
                </td>
            
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                <%if(at==null){ %><!-- 첨부파일이 없을 경우 -->
						첨부파일이 없습니다.
                <%}else{ %><!-- 첨부파일이 있을 경우 -->
                    <a download="<%=at.getOriginName()%>" href="<%=contextPath%>/<%=at.getFilePath()+at.getChangename()%>"><%=at.getOriginName() %></a>
                <%} %>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="<%=contextPath%>/list.bo?cpage=1" class="btn btn-info">목록으로</a>
        
        <!--로그인한 사용자가 게시글 작성자일 경우-->
    <%if(loginUser!=null && loginUser.getUserId().equals(b.getBoardWriter())||isAdmin){ %>
            <a class="btn btn-dark" href="<%=contextPath %>/updateForm.bo?bno=<%=b.getBoardNo()%>">수정하기</a>
            <a class="btn btn-danger" href="<%=contextPath%>/delete.bo?bno=<%=b.getBoardNo()%>">삭제하기</a>
        <%} %>
        </div>



        <div id="reply-area">
            <table align="center" border="1">
                <thead>
                    <%if(loginUser!=null){ %>
                    <tr>
                        <th>댓글작성</th>
                            <td>
                                <textarea rows="3" cols="50" id="replyContent" style="resize: none;"></textarea>
                            </td>
                            <td><button onclick="insertReply();">댓글 등록</button></td>
                            <%} else{%>
                            </tr>
                            <th>댓글작성</th>
                            <td>
                                <textarea rows="3" cols="50" id="replyContent" style="resize: none;" readonly>로그인 해주세요</textarea>
                            </td>
                            <td><button disabled>댓글 등록</button></td>
                        </tr>
                        <%}%>
                </thead>
                <tbody>
                </tbody>
            </table>

            <script>
                $(function(){
                    selectReply();
                })
                //댓글 작성 함수
                function insertReply(){
                    $.ajax({
                        url:"replyInsert.bo",
                        data:{
                            content : $("#replyContent").val(),
                            bno : <%=b.getBoardNo()%>
                        },
                        type : "post",
                        success : function(result){//매개변수명
                            if(result>0){
                                selectReply();
                                $("#replyContent").val("");//초기화
                            }
                        },
                        error: function(result){
                            console.log("통신 실패");
                        }
                    })
                }
                //댓글조회함수
                function selectReply(){
                    $.ajax({
                        url:"replyList.bo",
                        data:{bno : <%=b.getBoardNo()%>},
                        success : function(result){
                            //console.log(result);
                            var row = "";
                            for(var i in result){
                                row+="<tr>"
                                +   "<td>"+result[i].replyWriter+"</td>"
                                +   "<td>"+result[i].replyContent+"</td>"
                                +   "<td>"+result[i].createDate+"</td>"
                                +   "<tr>";
                            }
                            //console.log(row);
                            $("#reply-area tbody").html(row);
                        },
                        error: function(){
                            console.log("통신 실패");
                        }
                    })
                }
                

            </script>
        </div>




    </div>


</body>
</html>