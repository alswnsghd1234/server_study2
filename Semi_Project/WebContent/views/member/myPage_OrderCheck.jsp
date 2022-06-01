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

    #box{
        text-align: center;
        width: 700px;
        height: 500px;
    }

    #box_search{
        margin: 100px 0px 0px 200px;
    }
    #output{
        margin: 0 auto;
        width: 600px;
        height: 30px;
        border: 1px solid black;
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
    
        <form id="mypage-form" action="<%=contextPath%>/search.no" method="post">
            
            <div id="side_ng">
                <li>    <a href="<%=contextPath %>/views/member/myPage.jsp">기본정보</a>    </li><br>                
                <li>    <a href="<%=contextPath %>/views/member/myPage_Modify.jsp">정보수정</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_OrderCheck.jsp" style=" color: rgb(80, 241, 31)">주문조회</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Withdrawal.jsp">회원탈퇴</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Payment.jsp">결제관리</a>    </li><br>
            </div>
            
            
            


                <div id="box_search">
                    <input type="text" id="search">
                    <button onclick="test3();" id="btn">조회</button>
                </div>
        
                <div id="output">

                </div>

                <table id="tt" border="1" style="margin-left:200px; width: 300px;">
                    <thead>
                        <tr>
                            <td>제품명</td>
                            <td>제품코드</td>
                            <td>제품가격</td>
                        </tr>
                    </thead>
            
                    <tbody id="" style="border: none;">
            
                    </tbody>
                </table>





        
                <script>
                    $(function () {
                        //테이블에 회원정보 추가
                        $("#btn").click(function () {
                            let order_No = $("#order_No").val();
                            let pro_Name = $("#pro_Name").val();
                            let pro_Price = $("#pro_Price").val();
                            let info = "";
            
                            info += "<tr>";
                            info += "<td>" + order_No + "</td>";
                            info += "<td>" + pro_name + "</td>";
                            info += "<td>" + pro_Price + "</td>";
                            info += "</tr>";
                            console.log(info);
                            $(info).appendTo("tbody");
                        });
            
                        //마지막행 삭제
                        $("#btn2").click(function () {
                            $("tbody>tr").last().remove();
                        });
            
                    });
            
                    //선택된 행 아래에 출력하기
                    $("tbody").on("click", "tr", function () {
            
                        $(this).children().each(function (index, el) {
            
                            $("#s" + (index + 1)).text($(el).text()); 
            
                        });
            
                    });
                </script>












                <!-- <script>
                    function test3(){
                        $.ajax({
                            /* url : "/jqAjax3.do", */
                            url : "/search.no",
                            data : {no : $("#search").val()},
                            success : function(result){
                                console.log(result);
                                var resultStr = "상품정보 "+result.pro_name +
                                                +"주문번호 "+result.order_no +
                                                +"주문금액 "+result.pro_price +
                                $("#output").html(resultStr);
        
                            },
                            error : function(){
                                console.log("ajax 통신 실패..ㅠ")
                            }
                        })
                    }
                </script> -->
            </div>
        </form>
        
        

        
        
</body>
</html>

