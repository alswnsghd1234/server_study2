<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.notice.model.vo.Notice"%>
    <%
    Notice notice = (Notice)request.getAttribute("notice");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="/views/common/menubar2.jsp"%>
	<div class="outer">
        <br><h2 align="center">공지사항 상세보기</h2><br>

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="70px">제목</th>
<!--                 <td width="350px" colspan="3">공지사항 제목입니다</td> -->
					<td width="350px" colspan="3"><%=notice.getNoticeTitle()%></td>
            </tr>
            <tr>
                <th>작성자</th>
<!--                 <td>관리자</td> -->
				<td><%=notice.getNoticeWriter()%></td>
                <th>작성일</th>
<!--                 <td>2021-10-31</td> -->
				<td><%=notice.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
<!--                     <p style="height: 150px;">안녕하십니까 관리자입니다. 이 공지를 보신 분은 3년 내에 행복하게 됩니다.</p> -->
						<p style="height: 150px;"><%=notice.getNoticeContent() %></p>	
                </td>
            </tr>
        </table>
        <br>
		
        <div align="center">
            <a href="<%=contextPath%>/list.no" class="btn btn-success">목록으로 가기</a> <br>
			<br>
<%--             <%if(loginUser!=null && loginUser.getUserId().equals(notice.getNoticeWriter())){%> --%>
<%--             <a href="<%=contextPath%>/updateForm.no?nno=<%=notice.getNoticeNo()%>" class="btn btn-warning">수정하기</a>  --%>
<%--             <a href="<%=contextPath%>/delete.no?nno=<%=notice.getNoticeNo()%>" class="btn btn-danger">삭제하기</a> <br> --%>
<%--             <%}%> --%>
			
        </div>

    </div>
</body>
</html>