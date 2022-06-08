<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.kh.model.vo.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성)</h3>
	<pre>
	*변수 선언(&lt;c:set var="변수명" value="리터럴" scope="스코프 영역 지정(생략가능)"&gt;)
	-변수를 선언하고 초기값을 대입해두는 기능을 제공한다.
	-해당 변수를 어떤 scope영역에 담아둘건지 지정가능(생략가능하고 생략시 pageScope에 담긴다)
	->해당 scope영역에 setAttribute라는 메소드를 이용해서 key+value 형태로 데이터를 담아놓는것이라고 생각하면 된다.
	->c:set을 통해 선언된 변수는 EL로 접근해서 사용 가능!! (단, 스크립팅원소는 접근 불가)
	
	*주의사항
	-변수의 타입을 별도로 지정하지 않는다.
	-반드시!! 해당 변수를 초기화 해야한다. (초기값 설정 필수~!) 
	</pre>
	
	<c:set var="num1" value="10"/> <!-- pageScope에 담김 -->
	<c:set var="num2" value="20" scope="request"/> <!-- request영역에 담긴다. -->
	<!-- request.setAttribute("num2",20); 와 똑같음 -->
	
	num1의 변수값 : ${ num1 } <br>
	num2의 변수값 : ${ num2 } <br>
	
	<c:set var = "result" value="${num1+num2}" scope="session"/> <!-- sessionScope에 담김 -->
	
	result 변수값 : ${result} <br>
	
	<!-- 변수명만 제시하면 공유범위가 가장 작은곳부터 찾기때문에 처리속도가 느려질 수 있다. (스코프영역.변수명)을 권장 -->
	${pageScope.num1} <br>
	${requestScope.num2} <br>
	${sessionScope.result} <br>
	${requestScope.result} <br>
	
	<c:set var="result" scope="request">
		150
	</c:set> <!-- value속성 말고 시작태그와 종료태그 사이에도 값을 기술 가능하다. -->
	
	${requestScope.result}
	
	<hr>
	
	<pre>
	*변수 삭제 (&lt;c:remove var="제거하고자하는변수명" scope="스코프영역(생략가능)"&gt;)
	-해당 변수를 scope에서 찾아 제거하는 태그
	-scope 영역지정을 생략하면 모든 scope영역에 있는 해당변수를 찾아서 제거
	-> 해당하는 scope영역에 removeAttribute()메소드를 사용하는것과 같다고 생각하면 됩니다.
	</pre>
	
	삭제전 result : ${result} <br>
	
	1)특정 scope 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/>
	request에서 삭제 후 result : ${result} <br> 
	2)모든 scope에서 삭제 <br>
	<c:remove var="result"/>
	모든 scope에서 삭제 후 result : ${result} <br>
	
	<hr>
	
	<pre>
		*변수(데이터) 출력 (&lt;c:out value="출력하고자하는값" default="기본값(생략가능)" 
															escapeXml="true(기본값,생략가능)/false"&gt;)	
		-데이터를 출력하고자 할 때 사용하는 태그
		-기본값 : value에 출력하고자 하는 값이 없을 경우 기본값으로 출력할 값을 설정 (생략 가능)
		-escapeXml : 태그로써 해석해서 출력할지 여부(생략가능, 생략 시 기본값 true)
	</pre>

	result : <c:out value="${result}"/> <br>
	default 설정한 result : <c:out value="${result}" default="없음"/> <br>
	
	<!-- escapeXml 확인 -->
	<c:set var="outTest" value="<b>수업 재밌다!</b>"/>
	<c:out value="${outTest}"/><br> <!-- escapeXml 생략시 기본값 true / 태그 해석 X 문자 그대로 출력 -->
	<c:out value="${outTest}" escapeXml="false"/><br>
	
	<hr>
	
	<h3>2.조건문 - if (&lt;c:if test="조건식"&gt;)</h3>
	<pre>
		-JAVA의 단일 if문과 비슷하다.
		-조건식은 test라는 속성에 작성 (단! el구문으로 작성해야한다.)
	</pre>
	
<%-- 	<%if(조건식){ %> --%>
<%-- 	<%} %> --%>

	<c:if test="${num1>num2}"> <!-- 조건이 true일때 실행할 구문을 태그 사이에 작성 -->
		<b>num1이 num2보다 큽니다</b>
	</c:if>
	
	<c:if test="${num1 le num2}">
		<b>num1이 num2보다 작거나 같습니다</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="하이"/>
	
<%-- 	<%if(str.equals("하이")){ %> --%>
<%-- 	<%} %> --%>
	<c:if test="${str eq '하이' }">
		<mark>HI</mark>
	</c:if>
	
	<c:if test="${str ne '하2' }">
		<mark>bye</mark>
	</c:if>
	
	<br>
	
	<h3>3.조건문 choose(&lt;c:choose&gt; &lt;c:when&gt; &lt;c:otherwise&gt;)</h3>
	<pre>
		-JAVA의 if-else 또는 switch문과 비슷한 역할을 하는 태그
		-각 조건들을 c:choose 하위 요소로 c:when을 통해서 작성
	</pre>

<%-- 	<%if(num1==20){ %> --%>
<%-- 	<%}else if(num1==10) {%> --%>
<%-- 	<%}else{ %> --%>
<%-- 	<%} %> --%>

	<!-- 주석을 작성하더라도 choose안에 작성하면 오류(when또는 otherwise 안에 넣어야함) -->
	<c:choose> 
		<c:when test="${num1 eq 20}"><!-- if -->
			<b>안녕하십니까</b>
		</c:when>
		<c:when test="${num1 eq 10 }">
			<b>반갑습니다</b>
		</c:when>
		<c:otherwise>
			<b>안녕히 계십시오</b>
		</c:otherwise>
	</c:choose>
	
	<h3>4.반복문-forEach</h3>
	<pre>
		
		for loop문 - (&lt;c:forEach var="변수명" begin="초기값" end="끝값" step="증가시킬값(생략가능)"&gt;)
		향상된 for문  - (&lt;c:forEach var="변수명" items="순차적으로 접근할 배열또는컬렉션" 
						varStatus="현재접근된요소의상태값을보관할수있는변수명(생략가능)"&gt;)
		-step : 생략시 기본값: 1
		-varStatus : 현재 접근된 요소의 상태값을 보관할 변수명 (생략가능) 
	</pre>

	<!-- for loop -->
	
	<%--
		<%for(int i=1; i<=10; i++){%>
		
		<%}%>
	 --%>
	<c:forEach var="i" begin="1" end="10">
		반복확인 : ${i}<br>
	</c:forEach>
	
	<%--
		<%for(int i=1; i<=10; i+=2){%>
		
		<%}%>
	 --%>
	 
	 <hr>
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${i} <br>
	</c:forEach>
	
	<br>
	
	<!-- 태그 안에서도 사용가능 -->
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 사용 가능 </h${i}>
	</c:forEach>
	
	<br>
	
	<!-- 향상된 for문 -->
	<c:set var="color">
		red,yellow,green,blue
	</c:set><!-- ,를 구분자로 배열의 역할을 한다. -->
	
	color값 : ${color} <br>
	
	<c:forEach var="c" items="${color}">
		${c} <br>
	</c:forEach>
	
	<ul>
		
		<c:forEach var="c" items="${color}">
			<li style="color:${c}">${c} </li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("송강호",44,"남자"));
		list.add(new Person("아이유",30,"여자"));
		list.add(new Person("강동원",40,"남자"));
		
		request.setAttribute("pList", list);
		//원래대로라면 controller에서 처리후 가져올 값들
	%>
	
	<table border="1">
		<thead>
			<tr>
					<th>순번</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
			</tr>
		</thead>
		<tbody>
<%-- 			<%if(pList.isEmpty()){ %> --%>
<%-- 			<%}else{ %> --%>
<%-- 				<%for(Person p :pList) %> --%>
					
<%-- 			<%} %>		 --%>
			
		<c:choose>
			<c:when test="${ empty pList }">
				<tr align="center">
					<td colspan="3">조회된 결과가 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="p" items="${requestScope.pList}" varStatus="status">
						<tr align="center">
							<td>${status.count}</td> <!-- index=0부터 시작  / count : 1부터 시작-->
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					
				</c:forEach>
			
			</c:otherwise>
		
		</c:choose>



		</tbody>
	
	</table>
	
	
	
	
</body>
</html>