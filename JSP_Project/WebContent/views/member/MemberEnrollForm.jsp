<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: antiquewhite;
        color: crimson;
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    #enroll-form table{margin: auto;}
    #enroll-form input{margin: auto;}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    
<div class="outer">
    <h2 align="center">회원 가입</h2>
	<!-- menubar 를 include했기 때문에 contextPath 변수를 가져와 사용할 수 있다. -->
    <form id="enroll-form" action="<%=contextPath%>/insert.me" method="post">
        <table>
            <tr>
                <td>* 아이디</td>
                <td><input type="text" name="userId" maxlength="12" required></td>
                <!-- <td><button type="button" onclick="">중복확인</button></td> -->
            </tr>
            <tr>
                <td>* 비밀번호</td>
                <td><input type="password" name="userPwd" maxlength="15" required></td>
                <td></td>
            </tr>
            <tr>
                <td>* 비밀번호 확인</td>
                <td><input type="password" required></td>
                <td></td>
            </tr>
            <tr>
                <td>* 이름</td>
                <td><input type="text" name="userName" maxlength="6" required></td>
                <td></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phone" placeholder="포함해서 입력"></td>
                <td></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email"></td>
                <td></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="address"></td>
                <td></td>
            </tr>
            <tr>
                <td>관심분야</td>
                <td>
                <input type="checkbox" name="interest" id="music" value="음악">
                <label for="music">음악</label>
                <input type="checkbox" name="interest" id="sports" value="운동">
                <label for="sports">운동</label>
                <input type="checkbox" name="interest" id="movie" value="영화">
                <label for="movie">영화</label>
                <input type="checkbox" name="interest" id="game" value="게임">
                <label for="game">게임</label>
                <input type="checkbox" name="interest" id="cooking" value="요리">
                <label for="cooking">요리</label>
                <input type="checkbox" name="interest" id="coding" value="코딩">
                <label for="coding">코딩</label>
                </td>
                <td></td>
            </tr>

        </table>

        <div align="center">
            <button type="submit">회원가입</button>
            <button type="reset">초기화</button>
        </div>




    </form>
</div>


</body>
</html>