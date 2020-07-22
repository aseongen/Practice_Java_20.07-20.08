<%@ page contentType="text/html; charset=UTF-8"%>
<%--
액션태그를 사용해 ScoreBean객체를 request범위로 생성하고,
setProperty를 사용하여 객체 내부 데이터에 파라미터 데이터를 셋팅한 뒤 
파라미터데이터 3개와 총점, 평균을 구하여 5개를 모두 객체에 포장하여 
score_bean_use.jsp로 전송(포워딩)하세요
--%>

<jsp:useBean id="score" class="kr.co.koo.jspbasic.score.ScoreBean" scope="request" />
<jsp:setProperty name="score" property="" />

<%
	int total = score.getKor() + score.getEng() + score.getMath();
	double avg = (double) total / 3;
%>

<jsp:setProperty property="score" name="total" value="<%=total %>"/>
<jsp:setProperty property="score" name="score" value="<%=avg %>"/>

<jsp:forward page="score_bean_use.jsp"/>
