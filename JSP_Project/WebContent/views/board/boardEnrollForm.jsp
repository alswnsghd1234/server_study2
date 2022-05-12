<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.Category,java.util.ArrayList"%>
<% 
	
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");

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
    #enroll-form>table{border: 1px solid darkgoldenrod;}
    #enroll-form input,#enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }

</style>
</head>
<body>
    <%@ include file="/views/common/menubar.jsp"%>

    <div class="outer">
        <br>
        <h2 align="center">일반 게시글 작성하기</h2>

        <form action="<%=contextPath%>/insert.bo" method="post" id="enroll-form" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <table align="center">
                <!-- (tr>th+td)*4 -->
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select name="category" >
                        	<%for(Category c : list) {%>
                        		<option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName() %></option>
                        	<%} %>
                            <!-- <option value="10">공통</option>
                            <option value="20">운동</option>
                            <option value="30">등산</option>
                            <option value="40">게임</option>
                            <option value="50">낚시</option>
                            <option value="60">요리</option>
                            <option value="70">기타</option> -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" cols="30" rows="10" required></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
            </table>

            <br>
            <div align="center">
                <button type="submit">작성하기</button>
                <button type="reset">취소</button>
            </div>


        </form>




    </div>


</body>
</html>