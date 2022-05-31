<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList,com.kh.notice.model.vo.Notice"%>
    <%
    
    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/Semi/resources/css/notice.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="/views/common/menubar2.jsp"%>

	

      <!-- NOTICE -->

      <br>
      <h1 align="center" style="font-size: 45px;">공지사항</h1>
      <div class="big-notice">
            <%if(list.isEmpty()){%>
       		<tr>
       			<td colspan="5">존재하는 공지사항이 없습니다.</td>
       		</tr>
            <%}else{%>
            <%for(Notice n : list) {%>
        <div class="notice" id="notice1"><%=n.getNoticeTitle()%>/list.bo</div><hr>
		<%}%>
          <%} %>
      </div>
      
<%--        <%if(loginUser!=null && loginUser.getUserId().equals("admin")) {%> --%>
<!--         <div id="writeBtn"  align="center" > -->
<!--             <button class="btn btn-info" onclick="location.href="";>글작성</button>  -->
<%--             <a href="<%=contextPath %>/enrollForm.no" class="btn btn-info">글작성</a> --%>
<!--         </div> -->
<%--         <%} %> --%>
<!--     </div> -->

    <script>
        $(function(){

            $(".notice").click(function(){
                // console.log("클릭");
                //클릭했을때 해당하는 글의 번호를 넘겨줘야 해당 글의 정보를 알수있음(식별자)
                //해당 tr에 자손 td에 있는 text를 알고싶다
                var nno = $(this).siblings().eq(0).text(); //공지사항글 번호
                // console.log(nno);
                //요청할 url?키=벨류&키=벨류 ....
                //물음표 뒤에 오는 내용을 쿼리스트링이라고 한다. ->직접 만들어서 넘겨야함

                // /JSP/detail.no?nno=글번호
                location.href='<%=contextPath%>/detail.no?nno='+nno;
                

            });




        });


    </script>
      

</body>
</html>