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
        color: crimson;
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
        
    
        
        <!-- align="center"

        <h2>My Page</h2> -->

        <!-- menubar 를 include했기 때문에 contextPath변수를 가져와 사용할 수 있다. -->
        <form id="mypage-form" action="<%=contextPath%>/update.me" method="post">
            
            <div id="side_ng">
                <li>    <a href="<%=contextPath %>/views/member/myPage.jsp">기본정보</a>    </li><br>                
                <li>    <a href="<%=contextPath %>/views/member/myPage_Modify.jsp">정보수정</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_OrderCheck.jsp">주문조회</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Withdrawal.jsp" style=" color: rgb(80, 241, 31)">회원탈퇴</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Payment.jsp">결제관리</a>    </li><br>
            </div>

            <table style="text-align: bottom; border: 1px solid black; margin: 0px 0px 0px 200px;">
                
                
                <div style="margin-left: 1250px; width: 700px; height:140px;">
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
                </div>
            </table>
        </form>
    </div>


        
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
        

        <div align="left" style=" width: 100px; margin-left: 545px;">
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원 탈퇴</button>
        </div>
        
        
        
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
                        <b>회원 탈퇴 후 해당 정보는 복구가 불가능 합니다. <br> 정말로 탈퇴 하시겠습니까? </b> <br><br>
                        <form action="<%=contextPath%>/delete.me" method="post">
                            <%-- <input type="hidden" name="userId" value="<%=userId%>"> --%>
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

