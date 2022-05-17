<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
            background-color: bisque;
            color: darkgoldenrod;
            width: 1000px;
            margin: auto;
            margin-top: 50px;
            height: 800px;
        }
    #enroll-form table{
        border: 1px solid black;
        padding: 20px;
    }
    #enroll-form input,#enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>
        <%@ include file="/views/common/menubar.jsp"%>

        <div class="outer">
            <br>
            <h2 align="center">사진게시판 작성하기</h2>
            <br>
			
            <form action="<%=contextPath%>/insert.th" id="enroll-form" method="post" enctype="multipart/form-data">
               	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                <table align="center">
                    <tr>
                        <th width="100">제목</th>
                        <td colspan="3"><input type="text" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3"><textarea name="boardContent" style="resize: none;" rows="5" required></textarea></td>
                    </tr>
                    <tr>
                        <th>대표이미지</th>
                        <td colspan="3" align="center">
                            <img id="titleImg" width="250" height="170">
                        </td>
                    </tr>
                    <tr>
                        <th>상세이미지</th>
                        <td><img id="contentImg1" width="150" height="120"></td>
                        <td><img id="contentImg2" width="150" height="120"></td>
                        <td><img id="contentImg3" width="150" height="120"></td>
                    </tr>

                </table>

                <div id="file-area">
                    <!-- input[type=file id=file$ name=file$]*4 -->
                    <!--onchange:input태그의 변화가(내용물이 변경)되었을때 발생하는 이벤트 -->
                    <input type="file" id="file1" onchange="loadImg(this,1);" name="file1" required> <!--대표이미지(썸네일) 필수-->
                    <input type="file" id="file2" onchange="loadImg(this,2);" name="file2">
                    <input type="file" id="file3" onchange="loadImg(this,3);" name="file3">
                    <input type="file" id="file4" onchange="loadImg(this,4);" name="file4">
                </div>
		
					 <div align="center">
			       		 <button>등록하기</button>
			      	 </div>

            </form>

        </div>

        <script>

            function loadImg(inputFile,num){
                //inputFile = 현재 변화가 생긴 input type="file" 요소 객체
                //num = 몇번째 input file요소인지 확인할 수 있는 매개변수,이 번호로 원하는 위치에 이미지 미리보기
                // console.log(inputFile.files.length);
                // 파일을 선택했을때 1 / 파일선택 취소시 0 을 반환하는것을 확인할 수 있다. 즉 파일의 존재 유무 확인가능
                //files 속성은 업로드된 파일의 정보를 배열로 묶어서 반환 / length 배열 크기 

                if(inputFile.files.length==1){
                    //선택된 파일이 있을때
                    //그 파일을 읽어서 영역에 미리보기 구현

                    //파일을 읽어줄 도구 FileReader 객체 생성
                    var reader = new FileReader();
                    //파일을 읽어주는 메소드 - 어떤파일을 읽을것인지 매개변수로 전달해야한다.
                   reader.readAsDataURL(inputFile.files[0]);
                   //해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url이 부여가 되고
                   //해당 url을 src 속성으로 부여해준다

                   //파일 읽기가 완료되었을때 실행할 함수
                   reader.onload = function(e){

                    switch(num){
                        case 1 : $("#titleImg").attr("src",e.target.result); break;
                        case 2 : $("#contentImg1").attr("src",e.target.result); break;
                        case 3 : $("#contentImg2").attr("src",e.target.result); break;
                        case 4 : $("#contentImg3").attr("src",e.target.result); break;
                    }

                   }

                }else{
                    //선택된 파일이 사라졌을때 (취소)
                    //미리보기 사라지게 하기 (경로 null로 초기화)
                    switch(num){
                        case 1 : $("#titleImg").attr("src",null); break;
                        case 2 : $("#contentImg1").attr("src",null); break;
                        case 3 : $("#contentImg2").attr("src",null); break;
                        case 4 : $("#contentImg3").attr("src",null); break;
                    }
                }

            }
        </script>
       

</body>
</html>