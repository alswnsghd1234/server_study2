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
            color: crimson;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
        }
        #mypage-form table{margin: auto;}
        #mypage-form input {margin:5px}

    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		//삼항연산자 = 조건 ? 참일때 실행할 구문 : 거짓일때 실행할 구문;
		String phone = (loginUser.getPhone() == null) ? "":loginUser.getPhone();//삼항 연산자
		String email = (loginUser.getEmail() == null) ? "":loginUser.getEmail();
		String address = (loginUser.getAddress() == null) ? "":loginUser.getAddress();
		String interest = (loginUser.getInterest() == null) ? "":loginUser.getInterest(); 
	
	%>

	<div class="outer">
    <h2 align="center">My Page</h2>
	<!-- menubar 를 include했기 때문에 contextPath변수를 가져와 사용할 수 있다. -->
    <form id="mypage-form" action="<%=contextPath%>/update.me" method="post">
        <table>
            <tr>
                <td>* 아이디</td>
                <td><input type="text" name="userId" maxlength="12" required value="<%=userId%>" readonly></td>
                <!-- <td><button type="button" onclick="">중복확인</button></td> -->
            </tr>
            <tr>
                <td>* 이름</td>
                <td><input type="text" name="userName" maxlength="6" required value="<%=userName%>"></td>
                <td></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phone" placeholder="-포함해서 입력" value="<%=phone%>"></td>
                <td></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email" value="<%=email%>"></td>
                <td></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="address" value="<%=address%>"></td>
                <td></td>
            </tr>
            <tr>
                <td>관심분야</td>
                <td>
                    <!-- (input[type=checkbox name=intrest id= value=]+label)*6 -->
                    <input type="checkbox" name="interest" id="music" value="음악" >
                    <label for="music">음악</label>
                    <input type="checkbox" name="interest" id="sports" value="운동">
                    <label for="sports">운동</label>
                    <input type="checkbox" name="interest" id="movie" value="영화" >
                    <label for="movie">영화</label>
                    <input type="checkbox" name="interest" id="game" value="게임">
                    <label for="game">게임</label>
                    <input type="checkbox" name="interest" id="cooking" value="요리">
                    <label for="cooking">요리</label>
                    <input type="checkbox" name="interest" id="coding" value="코딩">
                    <label for="coding">코딩</label>
                </td>
            </tr>
        </table>

        <script>
            $(function(){
            //interest = "음악,영화" / ""
            var interest = "<%=interest%>";
            console.log(interest);

            //문자열.search(비교값) : 문자열에서 비교값과 일치하는 값의 시작인덱스 값을 반환 (0부터 시작) 없으면 -1 반환
            $("input[type=checkbox]").each(function(){
                //순차적으로 접근한 input:chk 요소에 value값이 interest안에 포함되어 있는지 확인
                if(interest.search($(this).val())!=-1){ //interest 문자열안에 체크박스 밸류가 포함되어있지 않으면 -1을 반환
                $(this).attr("checked",true);
                }
            
                });
            });


        </script>

        <div align="center">
            <button type="submit">정보 변경</button>
            <button type="button">비밀번호 변경</button>
            <button type="button" class="btn btn-danger">회원 탈퇴</button>
        </div>

    </form>
</div>



</body>
</html>