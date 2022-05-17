<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
		<h2>ajax</h2>
        <p>
            Asynchronous JavaScript And XML의 약자로 <br>
            서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할수 있게 하는 기법 <br>
            기존에 a태그로 요청 및 form을 통해 요청했던 방식은 동기식 요청 <br>
            ->응답페이지가 돌아와야 볼수있음 (페이지 화면 깜빡거림) <br>
            비동기식 요청을 보내기 위해 AJAX를 사용  <br><br>

            *동기식 / 비동기식 <br>
            -동기식 : 요청 처리 후 그에 해당하는 응답 페이지가 돌아와야만 그 다음 작업 가능 <br>
             만약 서버에서 호출된 결과까지의 시간이 지연되면 계속 대기해야한다 <br>
             전체 페이지가 리로드됨(새로고침) <br><br>

             -비동기식 : 현재 페이지를 그대로 유지하면서 중간중간 추가적인 요청을 보내줄 수 있다.  <br>
              요청을 해도 다른 페이지로 넘어가지 않음 (현재 페이지 유지) <br>
              요청을 보내놓고 응답이 돌아오기 전까지 다른 작업 가능 <br>
              ex) 아이디 중복체크 기능,검색어 자동완성 기능, 인스타 댓글기능 등등... <br><br>

              *비동기식의 단점 <br>
              -현재 페이지에 지속적으로 리소스가 쌓이기때문에 페이지가 느려질 수 있다. <br>
              -페이지 내 복잡도가 기하급수적으로 증가 - 에러발생시 디버깅 어려움 <br>
              -요청 후 돌아오는 응답데이터를 가지고 현재페이지에 새로운 요소를 만들어서 구현해야함 
                ㄴDOM요소 작성 구문을 잘 알아야 한다. <br><br>

                *AJAX구현방식 : JavaScript / jQuery 방식 <br>
        </p>

        <pre>
            *jQuery 방식에서의 AJAX 통신

            $.ajax({
                속성명:속성값,
                속성명:속성값,
                속성명:속성값; ....
            })

            *주요속성
            -url:요청할 url (필수)
            -type/method : 요청전송방식(get/post) 생략시 get방식
            -data : 요청시 전달할 값 
            -success : ajax 통신 성공시 실행할 함수 정의
            -error : ajax 통신 실패시 실행할 함수 정의
            -complete : ajax 통신 성공실패 유무 상관없이 실행할 함수 정의

            *부수적인 속성
            * 부수적인 속성
            - async : 서버와의 비동기 처리 방식 설정 여부 (기본값 true)
            - contentType : request 의 데이터 인코딩 방식 정의 (보내는 측의 데이터 인코딩)
            - dataType : 서버에서 response 로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
                            xml : 트리 형태의 구조
                            json : 맵 형태의 데이터 구조 (일반적인 데이터 구조)
                            script : javascript 및 일반 String 형태의 데이터
                            html : html 태그 자체를 return 하는 방식
                            text : String 데이터
            - accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능)
            - beforeSend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 (데이터 가공 및 header 관련 설정)
            - cache : 요청 및 결과값을 scope 에서 갖고 있지 않도록 하는 것 (기본값 true)
            - contents : jQuery 에서 response 의 데이터를 파싱하는 방식 정의
            - context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
            - crossDomain : 타 도메인 호출 가능 여부 설정 (기본값 false)
            - dataFilter : response 를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
            - global : 기본 이벤트 사용 여부 (ajaxStart, ajaxStop) (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
            - password : 서버에 접속 권한 (비밀번호) 가 필요한 경우
            - processData : 서버로 보내는 값에 대한 형태 설정 여부 (기본 데이터를 원하는 경우 false 설정)
            - timeout : 서버 요청 시 응답 대기 시간 (milisecond)
        </pre>

        <h1>jQuery 방식을 이용한 AJAX 테스트</h1>

        <h3>1.버튼 클릭시 get방식으로 서버에 데이터 전송 및 응답</h3>

        입력: <input type="text" id="input1">
        <button id="btn1">전송</button>
        <br>
        응답: <label id="output1">현재 응답 없음</label>

        <script>
            $("#btn1").click(function(){
                //기존의 동기식 통신
                //요청 처리를 위해 이동해야함 404
               	//location.href="jqAjax1.do?input="+ $("#input1").val();
                
               	// 비동기식 통신
                $.ajax({
                	url : "jqAjax1.do",
                	data : {input:$("#input1").val()},
                	type : "get",
                	success:function(result){
                		console.log("ajax 통신 성공");
                		$("#output1").text(result);
                		
                	},
                	error:function(){
                		console.log("ajax 통신 실패");
                	},
                	complete:function(){
                		console.log("ajax 통신성공여부와 상관없이 호출됨")
                	}
                	
                 })
            })

        </script>
        <br>

        <h3>2. 버튼 클릭시 post 방식으로 서버에 데이터 전송 및 응답</h3>
        이름 : <input type="text" id="input2_1"> <br>
        나이 : <input type="text" id="input2_2"> <br>
        <button onclick="test2();">전송</button>
        <br>
        응답 : <label id="output2">현재 응답 없음</label>
        
        <!-- <script>

            function test2(){
            // 방법 1
            $.ajax({
                url : "jqAjax2.do",
                data : {
                    name : $("#input2_1").val(),
                    age : $("#input2_2").val()
                },
                type : "post",
                success : function(result){
					$("#output2").text(result);
					console.log(result);
                },
                error : function(){
                    console.log("ajax 통신 실패")
                }
            })

        }
        </script> -->

        <script>
          //방법 2
            function test2(){
                $.ajax({
                    url : "jqAjax2.do",
                    data : {
                        name : $("#input2_1").val(),
                        age : $("#input2_2").val()
                    },
                    type :"post",
                    success : function(result){
                    	//$("#output2").text(result);
                    	console.log(result);
                    	//배열 출력방식
                    	//$("#output2").text("이름 : "+result[0] + " 나이 : "+result[1]);
                    	
                    	//객체 출력방식
                    	$("#output2").text("이름 : "+result.name+" 나이 : "+result.age);
                    
                    },
                    error : function(){
                        console.log("ajax 통신 실패");
                    }
                })
                
            }

        </script>

        <br>

        <h3>3. 서버로 데이터 전송해서 조회된 객체를 응답 데이터로 받기 </h3>

        회원번호 입력 : <input type="number" id="input3">
        <button onclick="test3();">조회</button>

        <div id="output3"></div>

        <script>
            function test3(){
                $.ajax({
                    url : "jqAjax3.do",
                    data : {no : $("#input3").val()},
                    success : function(result){
                    	console.log(result);
                        var resultStr = "회원번호 "+result.memberNo + "<br>"
                                        +"이름 "+result.name + "<br>"
                                        +"나이 "+result.age + "<br>"
                                        +"성별 "+result.gender + "<br>";
                        $("#output3").html(resultStr);

                    },
                    error : function(){
                        console.log("ajax 통신 실패..ㅠ")
                    }
                })
            }
        </script>

        <h3>4.응답데이터로 여러개의 객체들이 담겨있는 ArrayList받기</h3>

        <button onclick="test4();">회원 전체 조회</button>

        <table id="output4" border="1" style="text-align: center;">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th>성별</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <script>
            //데이터를 보내서 요청하는것이 아닌 응답데이터로 정보 뽑아보기
            function test4(){
                $.ajax({
                    url:"jqAjax4.do",
                    success:function(result){
                        var str="";

                        for(var i=0; i<result.length;i++){
                            str+= "<tr>"
                            + "<td>"+result[i].memberNo+"</td>"
                            + "<td>"+result[i].name+"</td>"
                            + "<td>"+result[i].age+"</td>"
                            + "<td>"+result[i].gender+"</td>"
                            +"</tr>";
                        }

                        $("#output4 tbody").html(str);
                        
                    },
                    error:function(){
                        console.log("ajax 통신 실패..ㅎ");
                    }
                })
            }
        </script>



        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>