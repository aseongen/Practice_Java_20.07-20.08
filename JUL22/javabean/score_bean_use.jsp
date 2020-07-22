<%@ page contentType="text/html; charset=UTF-8"%>
<%-- score_bean_make 에서 전송된 ScoreBean 객체를 활용하여
5가지 데이터를 브라우저에 출력하세요 --%>

<jsp:useBean id ="score" class="kr.co.koo.jspbasic.score.ScoreBean" scope="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

#국어점수: <jsp:getProperty name="score" property="kor" />점<br/>
#영어점수: <jsp:getProperty name="score" property="eng"/>점<br/>
#수학점수: <jsp:getProperty name="score" property="math"/>점<br/>
#총점: <jsp:getProperty name="score" property="total"/>점 <br/>
#평균: <jsp:getProperty name="score" property="average"/>점<br/>

</body>
</html>