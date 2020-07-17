<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<!-- 사용자의 입력값을 서버로 전달하는 방법
1. 사용자의 입력데이터를 서버로 전송하려면 HTML의 form 태그를 사용한다.
2. form 태그의 action 속성에 데이터를 받을 페이지의 URL 주소를 적습니다.
3. input태그의 name 속성으로 요청 파라미터의 이름을 지정할 수 있습니다.
4. 입력창이나 버튼체크에 의해 작성된 값이 요청 파라미터의 값으로 처리됩니다.
5. submit 버튼을 사용하여 서버로 데이터를 전송합니다.-->

	<form action="JSP_04_Send.jsp">
	<!-- JSP_05를 실행한 URL 주소로 이동이 된다.
	          즉, JSP04 에서 작성한 후 "확인"버튼을 클릭하면 -> 상단의 JSP_04_Send 클래스로 내용이 전환되면서 정보가 넘어간다-->
	<!-- http://localhost:8081/JUL16/JSP_04_Send.jsp?user_name=d&user_id=d&user_pw=d&gender=남성&hobby=soccer&regin=서울 -->
		
		<p>
			   <!-- 서버로 데이터를 전송하는 버튼 -->
			-이름: <input type="text" name="user_name" size="10px" /><br /> 
			-id: <input type="text" name="user_id" size="10px" /><br />
			-pw: <input type="password" name="user_pw" size="10px" /><br />
			   <!-- text 박스에 이름을 입력하는 순간 URL 파라미터 :user_name=하하&user_id=하하12&user_pw=1234#  -> 변한다. -->
			   
			-성별: <input type="radio" name="gender" value="남성" />남성 &nbsp; &nbsp; 
			      <input type="radio" name="gender" value="여성" />여성 <br />
			   <!-- value 값이 없을때 : &gender=on#value 값이 있을때 : &gender=남자 -->
			   <!-- radio : 여러개 중 택 1개 -->
			   
			-취미:<input type="checkbox" name="hobby" value="soccer" />축구 &nbsp; 
			     <input type="checkbox" name="hobby" value="reading" />독서 &nbsp; 
			     <input type="checkbox" name="hobby" value="rest" />수면 &nbsp; 
			     <input type="checkbox" name="hobby" value="music" />음악감상 &nbsp;<br />
			   <!-- &hobby=reading & hobby=rest -->
			   <!-- checkbox : 여러개 선택 가능 -->
			
			-지역: <select name="regin">
				<option>서울</option>
				<option>경기</option>
				<option>인천</option>
				<option>강원</option>
			</select><br/>
			<!-- 해당 지역 중 1개 선택 -->
			
			<!-- 서버로 데이터를 전송하는 버튼 -->
			<input type="submit" value="확인"/>
		</p>
	</form>
</body>
</html>