<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.model.vo.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>1. 기존 방식대로 스크립틀릿과 표현식을 이용해서 각 영역에 담겨있는 값 뽑아서 화면에 출력</h3>
		
		<%
			//request Scope에 담긴 값 뽑기 
			String food = (String)request.getAttribute("food");
			Person student = (Person)request.getAttribute("student");
			
			//session Scope에 담긴 값 뽑기
			String drink = (String)session.getAttribute("drink");
			Person teacher = (Person)session.getAttribute("teacher");
		%>
		
		<p>
			음식 : <%=food %> <br>
			음료 : <%=drink %> <br>
			학생 : <%=student %> <br>
			강사 : 이름 :<%=teacher.getName() %>, 나이 :<%=teacher.getAge() %>, 성별 : <%=teacher.getGender() %> <br>
			
		</p>
		
		<hr>
		
		<h3>2.EL을 이용해서 보다 쉽게 해당 Scope에 저장된 값을 화면에 출력</h3>
		<p>
			EL은 getXXX을 통해서 값을 꺼낼 필요 없이 키값만 제시하면 바로 접근 가능 <br>
			내부적으로 해당 Scope 영역에 해당 키값의 벨류값을 가지고 올 수 있다 <br>
			기본적으로 EL은 JSP 내장 객체를 구분하지 않고 자동적으로 모든 내장객체에 <br>
			키값을 검색해서 존재하는 경우에 값을 가져오게 된다.
		</p>
		
		<p>
			음식 : ${ food } <br>
			음료 : ${ drink } <br>
			강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender }<br>
			<%--
				teacher에 접근했을때 value는 Person 객체
				해당 Person 객체의 각 필드값에 접근하려면 .필드명으로 접근하면 된다.
				내부적으로 getter메소드를 찾아서 실행한다. (getter메소드 생성 필수 !!!)
			
			 --%>
		
			학생 : 
			<ul>
				<li>이름 : ${student.name }</li>
				<li>나이 : ${student.age }</li>
				<li>성별 : ${student.gender }</li>
			</ul>
		</p>
		
		<hr>
		<h3>3.EL 사용시 내장객체들에 저장된 키값이 같을 경우</h3>
		scope값 : ${scope} <br>	
		<!-- 
			EL은 공유범위가 가장 작은 Scope에서부터 해당 키값을 검색한다.
			page -> request -> session -> application 순으로 속성을 찾는다.
			만약 모든 영역에서 못찾을 경우엔? 아무것도 출력 안됨 (오류 안남)
		 -->
		없는 값 : ${notting} <br>
		
		<hr>
		<h3>4. 직접 Scope 영역을 지정해서 접근하기 </h3>
		<%
			//pageScope 에 담기
			pageContext.setAttribute("scope","page");
		%>
		
		pageScope에 담긴 값 : ${scope} 또는 ${pageScope.scope } <br>
		requestScope에 담긴 값 : ${requestScope.scope } <br>
		sessionScope에 담긴 값 : ${sessionScope.scope } <br>
		applicationScope에 담긴 값 : ${applicationScope.scope }<br><br> 
		
		
		
		
</body>
</html>