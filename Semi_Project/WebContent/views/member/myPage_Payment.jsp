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
	<%@ include file="../common/menubar.jsp" %>
	
    <%
    String userId = loginUser.getUserId();
    String userName = loginUser.getUserName();
    String userPwd = loginUser.getUserPwd();
/*     String bank_Name = loginmanagement.getBank_Name();
    String acount_Num = loginmanagement.getAcount_Num(); */
    
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
                <li>    <a href="<%=contextPath %>/views/member/myPage_Modify.jsp" style=" color: rgb(80, 241, 31)">정보수정</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_OrderCheck.jsp">주문조회</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Withdrawal.jsp">회원탈퇴</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Payment.jsp">결제관리</a>    </li><br>
            </div>

            <table style="text-align: bottom; border: 1px solid black; margin: 0px 0px 0px 200px;">
                
                
                
<!-- 	 private String bank_Name; // 계좌이름
	 계좌이름 private int acount_Num; //계좌번호 -->
	 
                
                <div style="margin-left: 1250px; width: 700px; height:140px;">
                    <tr>
                        <td>* 은행이름</td>
                        <td><input  type="text" name="bank_Name" maxlength="12" required value="<%-- <%=bank_Name%> --%>" readonly></td>
                    </tr>
                    <tr>
                        <td>* 계좌번호</td>
                        <td><input type="text" name="acount_Num" maxlength="6" required value="<%-- <%=acount_Num%> --%>" readonly></td>
                        <td></td>
                    </tr>
                    
                </div>
            </table>
        </form>
    </div>


</body>
</html>

