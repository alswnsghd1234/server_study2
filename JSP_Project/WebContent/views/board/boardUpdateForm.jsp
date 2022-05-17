<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*,java.util.ArrayList"%>
    
    
    <%
    	ArrayList<Category> list =(ArrayList<Category>)request.getAttribute("clist");
    	Board b = (Board)request.getAttribute("b");
    	Attachment at = (Attachment)request.getAttribute("at");
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
    #update-form>table{border: 1px solid darkgoldenrod;}
    #update-form input,#update-form textarea{
        width: 100%;
        box-sizing: border-box;
    }

</style>


</head>
<body>	
		<%@ include file="/views/common/menubar.jsp" %>

		<div class="outer">
        <br>
        <h2 align="center">일반 게시글 수정하기</h2>

        <form action="<%=contextPath%>/update.bo" method="post" id="update-form" enctype="multipart/form-data">
            <input type="hidden" name="bno" value="<%=b.getBoardNo()%>">
            <table align="center">
                <!-- (tr>th+td)*4 -->
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select name="category" >
                        	<%for(Category c : list) {%>
                        		<option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName() %></option>
                                 <!--   <option value="10">공통</option>
                                         <option value="20">운동</option>
                                         <option value="30">등산</option>
                                         <option value="40">게임</option>
                                        <option value="50">낚시</option>
                                         <option value="60">요리</option>
                                        <option value="70">기타</option> -->

                        	<%} %>
                      
                        </select>
                        <script>
                            $(function(){
                                $("#update-form option").each(function(){
                                    if($(this).text()=="<%=b.getCategory()%>"){
                                        $(this).attr("selected",true);
                                    }
                                })
                            })

                        </script>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="<%=b.getBoardTitle()%>" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" cols="30" rows="10" required><%=b.getContent() %></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                    <%if(at!=null) {%>
                    <%=at.getOriginName()%>
                    <!-- 원본파일의 파일번호, 수정명을 hidden으로 요청보내기 -->
                    <input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>">
                    <input type="hidden" name="orignFileName" value="<%=at.getChangename()%>">
                    <%} %>
                    <input type="file" name="reUpfile">
                    </td>
                </tr>
            </table>

            <br>
            <div align="center">
                <button type="submit">수정하기</button>
                <button type="reset">취소</button>
            </div>


        </form>




    </div>
		

</body>
</html>