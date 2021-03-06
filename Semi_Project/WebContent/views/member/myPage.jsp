<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DS SPORTS</title>
  <link rel="stylesheet" href="../WebContent/resources/css/categoryPage.css">
  <link rel="stylesheet" href="/WebContent/resources/css/main.css">
  <link rel="stylesheet" href="../WebContent/resources/css/detailPage.css">
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
	    String userNName = loginUser.getUserNName();
	    String userPwd = loginUser.getUserPwd();
	    int userBirth = loginUser.getUserBirth();
	    
	    
	    String phone = (loginUser.getPhone() == null) ? "":loginUser.getPhone();
	    String email = (loginUser.getEmail() == null) ? "":loginUser.getEmail();
	    String address = (loginUser.getAddress() == null) ? "":loginUser.getAddress();
	    String interest = (loginUser.getInterest() == null) ? "":loginUser.getInterest(); 
    %>  
        
    
    <div class="outer">
        <form id="mypage-form" action="<%=contextPath%>/update.me" method="post">
            
            <div id="side_ng">
                <li>    <a href="<%=contextPath %>/views/member/myPage.jsp" style=" color: rgb(80, 241, 31)">????????????</a>    </li><br>                
                <li>    <a href="<%=contextPath %>/views/member/myPage_Modify.jsp">????????????</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_OrderCheck.jsp">????????????</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Withdrawal.jsp">????????????</a>    </li><br>
                <li>    <a href="<%=contextPath %>/views/member/myPage_Payment.jsp">????????????</a>    </li><br>
            </div>

            <table style="text-align: bottom; border: 1px solid black; margin: 0px 0px 0px 200px;">
                
                
                <div style="margin-left: 1250px; width: 700px; height:140px;">
                    <tr>
                        <td>* ?????????</td>
                        <td><input  type="text" name="userId" maxlength="12" required value="<%=userId%>" readonly></td>
                        <!-- <td><button type="button" onclick="">????????????</button></td> -->
                    </tr>
                    <tr>
                        <td>* ??????</td>
                        <td><input type="text" name="userName" maxlength="6" required value="<%=userName%>" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>????????????</td>
                        <td><input type="text" name="user_Birth" maxlength="6" required value="<%=userBirth%>" readonly></td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td>????????????</td>
                        <td><input type="text" name="phone" placeholder="-???????????? ??????" value="<%=phone%>" readonly></td>
                        <td></td> 
                    </tr>
                    <tr>
                        <td>?????????</td>
                        <td><input type="email" name="email" value="<%=email%>" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>??????</td>
                        <td><input type="text" name="address" value="<%=address%>" readonly></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>????????????</td>
                        <td>
                            <input type="checkbox" name="interest" id="music" value="??????" >
                            <label for="music">??????</label>
                            <input type="checkbox" name="interest" id="sports" value="??????" >
                            <label for="sports">??????</label>
                            <input type="checkbox" name="interest" id="movie" value="??????" >
                            <label for="movie">??????</label>
                            <input type="checkbox" name="interest" id="game" value="??????" >
                            <label for="game">??????</label>
                            <input type="checkbox" name="interest" id="cooking" value="??????" >
                            <label for="cooking">??????</label>
                            <input type="checkbox" name="interest" id="coding" value="??????" >
                            <label for="coding">??????</label>
                        </td>
                    </tr>
                </div>
            </table>
        </form>
    </div>


        
        <script>
            $(function(){
                //interest = "??????,??????" ??????  ""
                var interest = "<%=interest%>";
                $("input[type=checkbox]").each(function(){
                    if(interest.search($(this).val())!=-1){ 
                        $(this).attr("checked",true);
                    }
                });
            });
        </script>
        

       
</body>
</html>

