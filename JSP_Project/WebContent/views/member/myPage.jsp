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
		String userPwd = loginUser.getUserPwd();
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
                //interest = "음악,영화" 또는  ""
                var interest = "<%=interest%>";

            // 문자열.search(비교값) : 문자열에서 비교값과 일치하는 값의 시작인덱스 값을 반환 (0부터시작) 없으면 -1 반환
            $("input[type=checkbox]").each(function(){
                
                //순차적으로 접근한 input:chk 요소에 value값이 interest안에 포함되어 있는지 확인
                // interest문자열안에 체크박스 value값이 포함되어있지 않으면 -1을 반환
                if(interest.search($(this).val())!=-1){ 
                    $(this).attr("checked",true);
                }
        });
    });
        </script>

        <div align="center">
            <button type="submit" class="btn btn-success">정보 변경</button>
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원 탈퇴</button>
        </div>

    </form>
</div>

<!-- The Modal -->
<div class="modal" id="updatePwdForm">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	<form action="<%=contextPath%>/updatePwd.me" method="post">
                <!--현재 비밀번호, 변경할 비밀번호 , 비밀번호 확인-->
					<!-- 회원정보 식별할 회원 아이디도 데이터 보내야함 -->
					<!-- 굳이 보여줄 필요 없으니 숨겨서 값 넘기기 (hidden) -->
					<input type="hidden" name="userId" value="<%=userId%>">
                <table>
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input type="password" name="userPwd" id="enterPwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호</td>
                        <td><input type="password" name="updatePwd" id="pwd1" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호 확인</td>
                        <td><input type="password" name="checkPwd" id="pwd2" required></td>
                    </tr>
                </table>
                <br>
                <button type="submit" class="btn btn-dark" onclick="return validatePwd();">비밀번호 변경</button>
            </form>

            <script>

                function validatePwd(){

                	
                	
                        if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                            alert("변경할 비밀번호와 비밀번호 확인이 맞지 않습니다.");
                            return false;
                        }

                   }
                
            </script>



      </div>
    </div>
  </div>
</div>


		
		<!-- controller : MemberDeleteController 
			처리메소드명 : deleteMember 
			성공시 = 회원탈퇴 성공 메세지 alert창으로 띄우기 
			로그아웃 처리 해주기 페이지는 메인 페이지로 이동시키기.
			
			실패시 = 에러페이지로 보내서 에러 메세지 띄워주기
			
			sql문 = 매핑값 deleteMember 
			delete문 XXX Update문으로 작업 STATUS컬럼 'Y' -> 'N' 
						MODIFY 컬럼 SYSDATE로 작업
						WHERE절에 USER_ID와 USER_PWD를 검사 
			
			MODAL창 사용하기 
		-->
		
		
		<!-- The Modal -->
<div class="modal" id="deleteForm">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원 탈퇴</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" align="center">
       	<b>회원 탈퇴 후 복구는 불가능 합니다. <br> 정말로 탈퇴 하시겠습니까? </b> <br><br>
       <form action="<%=contextPath%>/delete.me" method="post">
<%-- 		<input type="hidden" name="userId" value="<%=userId%>"> --%>
			<table>
				<tr>
					<td>비밀번호 입력 : </td>	
					<td><input type="password" name="userPwd" required></td>			
				</tr>
			</table>
			<br>
			<button type="submit" class="btn btn-danger">탈퇴하기</button>		
		</form>
      </div>
		
    </div>
  </div>
</div>		
			
			



</body>
</html>