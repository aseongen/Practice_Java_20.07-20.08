<%@ page contentType="text/html; charset=UTF-8"%>
<%--
 # 디렉티브 태그의 include: 
 ex) <%@ include file="삽입할 페이지"%>
 - 페이지 내부에서 공유하면서 써야할 변수나 메서드를 다른 파일에 선언해두고 삽입하여 사용한다. 
 
 #  액션태그의 include:
 ex) <jsp:include page ="삽입할 페이지"/>
 - 단순히 UI 를 복사하고 싶을 때 주로 사용한다.
 --%>

<h3>여기는 1번 페이지입니다. </h3>

<%@ include file="include_ex02.jsp" %> <!-- directive -->
<jsp:include page ="include_ex02.jsp"/> <!--  action tag -->

<h4>다시 여기는 1번 페이지입니다</h4>


