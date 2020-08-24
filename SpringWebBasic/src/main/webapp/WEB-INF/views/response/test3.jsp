<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<h2>회원가입 정보 출력하기</h2>
	<p>
		# 회원정보: ${user} <br><!-- ${user}넣을경우 -> 주소값만 나온다. -->
		# 아이디:${user.getUserId()}<br> 
		# 비밀번호: ${user.userPw} <br>  <!-- getter 생략가능 -->
		# 이름: ${user.userName} <br> 
		# 취미:
		<!-- list,배열 -> items  -->
		<c:if test="${user.hobby.size() != 0 }">
			<c:forEach var="h" items="${user.hobby}">
				<!-- h타입: String 값을 h 변수에 넣어준다 -->
            ${h} &nbsp;
	  </c:forEach>
		</c:if>
		<c:if test="${user.hobby.size() == null }">
	        이 사람은 취미가 없는 사람입니다.
	  </c:if>
	<br>
	</p>
</body>
</html>