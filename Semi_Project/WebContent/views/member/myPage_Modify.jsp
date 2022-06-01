<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        
    
    <meta charset="UTF-8">
    <title>DS SPORTS</title>
  <link rel="stylesheet" href="/WebContent/resources/css/categoryPage.css">
  <link rel="stylesheet" href="/WebContent/resources/css/main.css">
  <link rel="stylesheet" href="/WebContent/resources/css/detailPage.css">
  <link rel="stylesheet" href="/WebContent/resources/css/notice.css">



    <style>
    
    .outer{
        color: green;
        width: 1000px;
        /* margin: auto;
        margin-top: 50px; */
    }
    #mypage-form>tr>td{
        /* margin: auto; */
        margin-top: 200px;
    }
    #mypage-form input {margin:5px}

    #side_ng{
        border: 1px solid black;
        list-style-type: none;
        position:absolute;

        background-color: beige;
        text-align: left;
        height: 100%;
        width: 130px; 
        /* height: 500px; */
        padding: 150px 20px 50px 0px;
        margin: 0px 0px 0px 0px;
    }
    
    #side_ng>li{
        /* border: 1px solid black; */
        width: 100px;
        margin-left: 20px;
    }
    
    #side_ng>li:hover{
        transform: scale(1.2);
    }
    
    #side_ng>li>a{
        padding: 7px;
        font-size: 16px;
        font-weight: bold;
        text-decoration: none;
        color: rgb(108, 117, 117);
    }
    </style>
</head>
<body>
 <%@ include file="/views/common/menubar.jsp"%>
	
    <%
    String userId = loginUser.getUserId();
    String userName = loginUser.getUserName();
    String userPwd = loginUser.getUserPw();
    //삼항연산자 = 조건 ? 참일때 실행할 구문 : 거짓일때 실행할 구문;
    String phone = (loginUser.getPhone() == null) ? "":loginUser.getPhone();//삼항 연산자
    String email = (loginUser.getEmail() == null) ? "":loginUser.getEmail();
    %>  
        
    
    <div class="outer">
        
    
        
        <!-- align="center"

        <h2>My Page</h2> -->

        <!-- menubar 를 include했기 때문에 contextPath변수를 가져와 사용할 수 있다. -->
        <form id="mypage-form" action="<%=contextPath%>/update.me" method="post">
            
            <div id="side_ng">
                <li>    <a href="<%=contextPath %>/views/member/myPage.jsp">기본정보</a>    </li><br>                
                <li>    <a href="<%=contextPath %>/views/member/myPage_Modify.jsp" style=" color: rgb(80, 241, 31)">정보수정</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_OrderCheck.jsp">주문조회</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Withdrawal.jsp">회원탈퇴</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Payment.jsp">결제관리</a>    </li><br>
            </div>

            <table style="text-align: bottom; border: 1px solid black; margin: 0px 0px 0px 200px;">
                
                
                <div style="margin-left: 1250px; width: 700px; height:140px;">
                    <tr>
                        <td>* 아이디</td>
                        <td><input  type="text" name="userId" maxlength="12" required value="<%=userId%>" readonly></td>
                    </tr>
                    <tr>
                        <td>* 이름</td>
                        <td><input type="text" name="userName" maxlength="6" required value="<%=userName%>" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="phone" placeholder="-포함해서 입력" value="<%=phone%>" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" value="<%=email%>" readonly></td>
                        <td></td>
                    </tr>
                </div>
            </table>
        </form>
    </div>


        
        <script>
        </script>
        
        
        <div align="center">
            <button type="submit" class="btn btn-success" data-toggle="modal" data-target="#updateForm">정보 변경</button>
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button>
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


<!-- The Modal -->
<div class="modal" id="updateForm">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">정보 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	<form action="<%=contextPath%>/update.me" method="post">
					<input type="hidden" name="userId" value="<%=userId%>">
                <table>
                    <tr>
                        <td>* 아이디</td>
                        <td><input  type="text" name="userId" maxlength="12" required value="<%=userId%>" readonly></td>
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
                <br>
                <button type="submit" class="btn btn-dark" onclick="return validate();">정보 변경</button>
            </form>


</body>
</html>