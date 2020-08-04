<%@ page import="kr.co.koo.jdbc.user.model.*"%>
<%@ page import = "java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
   UserDAO dao =UserDAO.getInstance();
   List<UserVO> userList = dao.userSelectAll();
   
   /* new() vs getInstance()
    * new() : 객체를 계속 만들 수 있다.
      getInstance(): 싱글턴 패턴, 하나의 인스턴스만 가지고 공유해서 사용한다.
    * 싱글톤 패턴
     - 자바는 클래스들로 이루어져 있고 매번 새로운 객체를 생성한다.
        하지만, 매번 새로운 객체를 생성하는 것이 아닌 한번만 객체를 생성하고 그 이후에는 모든 클래스들이 동일한 객체를 써야하는 경우 사용한다.
   */
   
   for(UserVO user: userList){
	   String name =user.getName();
	   String id = user.getId();
	   String pw = user.getPw();
	   String phone = user.getPhone1() + "-" + user.getPhone2() + "-" + user.getPhone3();
	   String gender = user.getGender();
	   
	   out.println("이름: " + name + ", 아이디: " + id 
			   + ", 비번: " + pw + ", 전화번호 : " + phone
			   +", 성별: " + gender + "<br/>");
   }

 %>


