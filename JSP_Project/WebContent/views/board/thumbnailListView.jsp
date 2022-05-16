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
        height: 600px;
    }
.list-area{
    width: 800px;
    margin: auto;
}
.thumbnail{
    border: 1px solid black;
    width: 200px;
    display: inline-block;
    margin: 10px;
}
.thumbnail:hover{
    cursor: pointer;
    color: brown;
}
</style>
</head>
<body>

    <%@ include file="/views/common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판</h2>
        <br>

        <div id="writebtn" align="center">
            <a href="<%=contextPath%>/enrollForm.th" class="btn btn-info">글작성</a>
        </div>

        <div class="list-area">
            <div class="thumbnail" align="center">
                <img src="/" alt="" width="200px" height="150px">
                <p>
                    No. 125 <br>
                    조회수 : 55
                </p>
            </div>

                <div class="thumbnail" align="center">
                    <img src="/" alt="" width="200px" height="150px">
                    <p>
                        No. 135 <br>
                        조회수 : 44
                    </p>
            </div>

            
            <div class="thumbnail" align="center">
                <img src="/" alt="" width="200px" height="150px">
                <p>
                    No. 215 <br>
                    조회수 : 99
                </p>
            </div>
            </div>
        </div>


</body>
</html>