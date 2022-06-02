<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.notice.model.vo.Notice,com.kh.product.model.vo.Product,com.kh.member_2.model.vo.MemberUser,com.kh.detail.model.vo.Basket"%>
	<% String contextPath = request.getContextPath();
    String alertMsg = "";
	MemberUser loginUser = null;
	int loginN = -1;
	int userNo = -1;
	if(session.getAttribute("loginN")!=null) loginN = (int)session.getAttribute("loginN");
	if(session.getAttribute("loginUser")!=null) loginUser= (MemberUser)session.getAttribute("loginUser");
	if(session.getAttribute("alertMsg")!=null) alertMsg = (String)session.getAttribute("alertMsg");
	ArrayList<Product> pr = (ArrayList<Product>)request.getAttribute("list");
  	if(session.getAttribute("userNo")!=null) userNo = (int)session.getAttribute("userNo");
  	
  	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/menubar.css">
  

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<script>
		var date="";
		var alertMsg = '<%=alertMsg%>'
		
		<%if(session.getAttribute("banDate")!=null){%>
			date = '<%=session.getAttribute("banDate")%>';
		<%}%>
		if(<%=loginN%>==0) {
			window.alert("로그인 정보가 일치하지 않습니다");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==1) {
			window.alert("정상적으로 로그아웃 되었습니다.");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==2) {
			if(window.confirm("이미 탈퇴한 회원입니다. 탈퇴 취소 처리 하시겠습니까?")){
				$.ajax({
					url : "/Semi/ajaxReturnMember.lo",
					data : {userNo : <%=userNo%>},
					success : function(result){
						if(result>0) {
						window.
						alert("정상적으로 탈퇴 취소 처리 되었습니다. 재로그인 해주세요");
						window.location.reload(true);
						}
					},
					error : function(){
						
					}
				});				
			}
			<%if(session.getAttribute("userNo")!=null) request.getSession().removeAttribute("userNo");%>
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==3) {
			window.alert("회원님은"+date +"까지 정지 상태입니다.");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==4) {
			if(window.confirm("회원님은 현재 휴면 상태입니다. 휴면해제 처리 하시겠습니까? ")){
				$.ajax({
					url : "/Semi/ajaxReturnMember.lo",
					data : {userNo : <%=userNo%>},
					success : function(result){
						if(result>0) {
						window.alert("정상적으로 해제 처리 되었습니다. 재로그인 해주세요");
						window.location.reload(true);
						}
					},
					error : function(){
						
					}
				});
			}
			<%if(session.getAttribute("userNo")!=null) request.getSession().removeAttribute("userNo");%>
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==5) {
			window.alert("회원님은 영구정지 상태입니다.");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==10) {
			window.alert("회원가입이 성공적으로 완료되었습니다.");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==100) {
			window.alert("주문이 완료되었습니다.");
			<%session.setAttribute("loginN", -1);%>
		}
		if(<%=loginN%>==110) {
			window.alert("로그인이 필요한 서비스입니다. 로그인 후 이용해주세요");
			<%session.setAttribute("loginN", -1);%>
		}
		if(alertMsg != ""){
			window.alert(alertMsg);
			<%session.removeAttribute("alertMsg");%>
		}
		//밴, 휴면 자동
		$(document).ready(function(){
			$.ajax({
				url : "/Semi/ajaxMemberManage.lo"
			});
		})

	</script>


  	<!-- HEADER -->
    <header>
  
 
      <div class="inner">
  
      <a href="<%=contextPath %>/" class="logo"><img src="/Semi/resources/img/DsSports.png" alt="DS SPORTS"></a>
      
      <!-- top navi -->
		<%if(loginUser==null) {%>
      <div class="top-navi">
        <ul class="navi">
        <li><a href="/Semi/views/common/login.jsp">로그인</a></li>
        <li><a href="/Semi/views/semi/newMember.jsp">회원가입</a></li>
        <li><a href="<%=contextPath%>/myPage.me">마이페이지</a></li>
          <li><a href="#">고객센터</a></li>
        </ul>
      </div>
          <%} else {%>
                  <div class="top-navi" style="width:500px;">	
      <ul class="navi" style="width:500px;">
        <li style="width:160px;font-size:16px;"><%=loginUser.getUserName() %> 님 환영합니다</li>
        <li style="width:100px;"><a href="<%=contextPath%>/loginUser.lo?logout=1">로그아웃</a></li>
        <li style="width:100px;"><a href="<%=contextPath%>/myPage.me">마이페이지</a></li>
        <li style="width:100px;"><a href="#">고객센터</a></li>
      </ul>
    </div>
    <%}%>
      <!-- input -->
      <div class="search">
        <input id="search-button" type="text" placeholder="검색" style="font-size: 20px;">
        <div class="material-icons">search</div>
      </div>
      <!-- order -->
      <div class="order">
        <div id="order">
          <a href="#">
            <div class="material-symbols-outlined">
            shopping_cart
          </div>
          </a>
        </div>
      <div id="favor">
        <a href="#">
          <div  class="material-symbols-outlined">
            favorite
          </div>
        </a>
      </div>
    </div>
  </div>
  </header>
      <!-- navigator -->
      <div class="navigator">
        <ul id="navi">
          <li class="menu"><a href="<%=contextPath%>/soccer.pg?cpage=1" class="soccer">축구</a>
            <ul>
                <li ><a href="<%=contextPath%>/soccertp.pg?cpage=1" class="soccer1">축구공</a></li>
                <li><a href="<%=contextPath %>/soccermd.pg?cpage=1" class="soccer2">축구화</a></li>
                <li><a href="<%=contextPath %>/soccerbt.pg?cpage=1" class="soccer3">보호장비</a></li>
            </ul>
          </li>
          <li><a href="<%=contextPath %>/boling.pg?cpage=1" class="boling">볼링</a>
            <ul>
                <li><a href="<%=contextPath %>/boling.pg?cpage=1&tp=21" class="boling1">볼링공</a></li>
                <li><a href="<%=contextPath %>/boling.pg?cpage=1&tp=22" class="boling2">볼링화</a></li>
                <li><a href="<%=contextPath %>/boling.pg?cpage=1&tp=23" class="boling3">보호장비</a></li>
            </ul>
          </li>
          <li><a href="<%=contextPath %>/health.pg?cpage=1" class="health">헬스</a>
            <ul>
                <li><a href="<%=contextPath %>/health.pg?cpage=1&tp=31" class="health1">스트랩</a></li>
                <li><a href="<%=contextPath %>/health.pg?cpage=1&tp=32" class="health2">리프팅벨트</a></li>
                <li><a href="<%=contextPath %>/health.pg?cpage=1&tp=33" class="health3">보호대</a></li>
            </ul>
          </li>
          <li><a href="<%=contextPath %>/cycle.pg?cpage=1" class="cycle">자전거</a>
            <ul>
                <li><a href="<%=contextPath %>/cycle.pg?cpage=1&tp=41" class="cycle1">자전거</a></li>
                <li><a href="<%=contextPath %>/cycle.pg?cpage=1&tp=42" class="cycle2">LED전등</a></li>
                <li><a href="<%=contextPath %>/cycle.pg?cpage=1&tp=43" class="cycle3">보호장비</a></li>
            </ul>
          </li>
          <li><a href="#">할인판매</a>
          </li>
          <li><a href="#">동네헬스장공유</a>
          </li>
          
        </ul>
      </div>


      

</body>
</html>