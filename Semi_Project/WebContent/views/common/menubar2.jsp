<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.product.model.vo.Product,com.kh.member.model.vo.MemberUser"%>
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
  <link rel="stylesheet" href="<%=contextPath %>/resources/css/menubar2.css">

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
    <div class="top-navi">
      <ul class="navi">
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
        <li><a href="#">마이페이지</a></li>
        <li><a href="#">고객센터</a></li>
      </ul>
    </div>
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

</body>
</html>