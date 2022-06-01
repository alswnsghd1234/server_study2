<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DS SPORTS</title>
    <style>
        .outer{
            background-color: bisque;
            color: crimson;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
        }
        #enroll-form table{margin: auto;}
        #enroll-form input {margin:5px}

    </style>
</head>
<body>
	<%@include file="/views/common/menubar2.jsp"%>
	
	<div class="outer">
    <h2 align="center">계좌생성</h2>
    <form id="enroll-form" action="<%=contextPath%>/management.me" method="get">
        <table>
            <tr>
                <td>* 은행이름</td>
                <td><input type="text" name=bank_Name maxlength="8" required></td>
                <!-- <td><button type="button" onclick="">중복확인</button></td> -->
            </tr>
            <tr>
                <td>* 계좌번호</td>
                <td><input type="password" name="acount_Num" maxlength="18" required></td>
                <td></td>
            </tr>
          
        </table>

        <div align="center">
            <button type="submit">계좌생성</button>
            <button type="reset">초기화</button>
        </div>

    </form>
</div>



</body>
</html>