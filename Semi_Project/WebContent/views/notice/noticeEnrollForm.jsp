<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  
    #enrollForm input,#enrollForm textarea{
    	width: 100%;
    	box-sizing:border-box;
    }


</style>
</head>
<body>
        <%@include file="/views/common/menubar2.jsp"%>

        <div class="outer">
            <br> <h2 align="center">공지사항 작성하기</h2>
                <form id="enrollForm" action="<%=contextPath%>/insert.no" method="post">
                    <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">

                    <table align="center">
                        <tr>
                            <th width="50px">제목</th>
                            <td width="400px"><input type="text" name="title" required></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="content" id="" cols="30" rows="10" style="resize: none;" required></textarea>
                            </td>
                        </tr>

                    </table>

					<div align="center">
					<button type="submit">등록하기</button>
					<button type="button" onclick="history.back();">뒤로가기</button>
					<!-- history.back() 뒤로가기(이전페이지 이동) 전용 함수 -->
					</div>
	

                </form>



        </div>



</body>
</html>