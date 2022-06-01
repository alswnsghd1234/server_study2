<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.product.model.vo.Product"%>
    <% 
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="/Semi/resources/css/detailPage.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="/views/common/menubar.jsp"%>
	
	
     <!-- 상품 디테일 헤더부분 -->
      <div class="detail-top">
        <!-- 디테일 헤더 왼쪽 -->
        <div id="detail-top-left">
          <img src="<%=pr.get(0).getProImage() %>" alt="" id="main">
        </div>
        <!-- 디테일 헤더 오른쪽 위-->
        <div id="detail-top-right">
          <pre id="pr-top">
            <h2 style="text-align: center;">Product Info제품정보<br></h2>
            시즌 도움말 보기 / 성별 2022 S/S / 여 <br>
            조회수(1개월) 400회 이상 <br>
            좋아요  12 <br>
          </pre>
          <pre id="pr-top">
            <h2 style="text-align: center;">Delivery Info배송정보</h2><br>
            배송 방법 국내 배송 / 입점사 배송 / 로젠택배<br>
            Price Info가격정보 <br>
            당산스포츠 판매가 228,000원<br><br>
          </pre>
          <!-- 디테일 헤더 오른쪽 아래-->
          <div id="detail-top-right-bottom">
            <div id="buy-order">
            <button id="buy">구매하기</button>
            <div class="order1"><button id="order11">찜하기</button></div>
            <div class="order2"><button id="order22">장바구니</button></div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
              <h3 style="display: inline-block;" id="total">상품 총금액 : <%=pr.get(0).getProPrice() %> 원</h3>
            </div>
          </div>
        </div>
      </div>

      <div class="detail-middle">
        <div id="detail-button">
          <button id="content"><h3>상품설명</h3></button>
          <button id="reviews"><h3>리뷰</h3></button>
          <button id="question"><h3>상품문의</h3></button>
        </div>
        <div id="pr-description"><img src="<%=pr.get(0).getProDes() %>" alt=""></div>
        <div id="pr-reviews">
          <div class="review-score">
            <h3 style="display: inline-block;">사용자 리뷰 총 평점수&nbsp;&nbsp; ★★★★☆ &nbsp;&nbsp;4.7</h3>
          </div>
          <div id="stars-view">
          
            <h4>별점 개수별로 조회</h4>
            <select name="star" id="star">
              <option value="5">★★★★★</option>
              <option value="4">★★★★☆</option>
              <option value="3">★★★☆☆</option>
              <option value="2">★★☆☆☆</option>
              <option value="1">★☆☆☆☆</option>
            </select>
          </div>
        </div>
        <div id="pr-question"></div>
      </div>

      <script>

        $('#buy').click(function(){
          location.href = <%=contextPath%>/purchase.pr?pc=<%=pr.get(0).getProNo()%>
        });
        $('#order22').click(function(){
          location.href = <%=contextPath%>/order.pr?pc=<%=pr.get(0).getProNo()%>
        });
      </script>
</body>
</html>