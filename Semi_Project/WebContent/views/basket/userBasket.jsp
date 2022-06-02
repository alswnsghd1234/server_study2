<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.detail.model.vo.Basket,java.util.ArrayList"%>
    
    <%
    ArrayList<Basket> list = (ArrayList<Basket>)request.getAttribute("list");
    int totalPrice=0;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
        <!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
  <style>
    table{
          font-size: 18px;
          text-align: center;
          vertical-align: middle;
          display: table;
    }
    tfoot{
        font-size: 23px;
    }
    table th{
        text-align: center;
    }
    img{
        width: 150px;
        height: 150px;
    }
  </style>
</head>
<body>
    <%@ include file = "/views/common/menubar.jsp" %>
  <div class="container" style="border: 1px solid black;">
    <div  style="display: inline;">
        <h2  style="display: inline-block;">ORDER / PAYMENT</h2>
    </div>
    <div style="float: right; margin-top: 25px;">
        장바구니 ▶ 주문서 ▶ 주문완료
    </div>
     <hr style="height: 2px; background-color: lightgray;">         
    <table class="table">
        <thead>
            <tr>
                <th><input type="checkbox" id="allcheck"></th>
                <th>전체</th>
                <th>사진</th>
                <th>상품명</th>
                <th>판매가</th>
                <th>수량</th>
                <th>주문금액</th>
            </tr>
      </thead>
        <tbody>
        <%for(Basket b : list){ %>
            <tr>
                <td style="vertical-align: middle;"><input type="checkbox" name="checkbox"></td>
                <td style="vertical-align: middle;"><%=b.getBasketNo() %></td>
                <td style="vertical-align: middle;">
                    <div class="image">
                    <img src="<%=b.getProImage() %>" alt="">
                    </div>
                </td>
                <td style="vertical-align: middle;"><%=b.getProName() %></td>
                <td style="vertical-align: middle;"><%=b.getProPrice() %></td>
                <td style="vertical-align: middle;"><%=b.getPayOrderNo() %></td>
                <td style="vertical-align: middle;"><%=b.getProPrice() * b.getPayOrderNo()%></td>
            </tr>
            <%totalPrice+= b.getProPrice() * b.getPayOrderNo();%>
            <%} %>
        </tbody>
        <tfoot>
            <tr align="right">
                <td colspan="9">총 주문금액 = <span id="span"><%=totalPrice%></span></td>
            </tr>
            <tr>
                <td colspan="9"><button class="btn btn-dark" style="float: right;">결제하기</button></td>
            </tr>
        </tfoot>
    </table>

  </div>
  <script>
      $(function(){
        $("input:checkbox").attr("checked",true);
        var totalPrice = <%=totalPrice%>

        $("#allcheck").click(function(){

            if($(this).is(":checked")){
                $("input[name=checkbox]").prop("checked",true);
                totalPrice=<%=totalPrice%>
            }else{
                $("input[name=checkbox]").prop("checked",false);
                totalPrice=0;
            }
            $("#span").html(totalPrice);

        });
        $("input[name=checkbox]").change(function(){
            var total = $(this).parent().parent().children().eq(6).text();
            total = parseInt(total);
            if($(this).is(":checked")){
                totalPrice+=total;
            }else{
                totalPrice-=total;
            }
            $("#span").html(totalPrice);
        });
      })


  </script>
  
  
  
</body>
</html>