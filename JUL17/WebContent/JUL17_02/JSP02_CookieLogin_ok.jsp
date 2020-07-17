<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//post 한글처리 방식
	request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id"); //getParameter("이름 작성"); 
    String PW = request.getParameter("PW");
    
    if(id.equals("abc1234") && PW.equals("aaa1111")){
    	//쿠키를 가져오려면 쿠키 객체를 생성해야 한다.
    	
    	/*#쿠키 생성방법
    	1.쿠키 객체 생성  : 반드시 쿠키 이름을 지정해줘야 한다.
    	("id_cookie",id) (쿠키이름, 쿠키 value)
    	쿠키이름 꺼내려면 : getName , 쿠키 value 꺼내려면 :getValue*/
    	Cookie idCookie = new Cookie("id_cookie",id);
    	
    	//로그인에 성공한 사람은 id_cookie 의 쿠키를 갖고 있고 성공하지 못한사람은 없다.
    	
    	idCookie.setMaxAge(10);
    	/*setMaxAge: (30) : 30초
    	           (60 *60) => 1h
    	           (60 * 60 *24) => 24h*/
        response.addCookie(idCookie);	            
    	
     response.sendRedirect("JSP02_CookieWelcome.jsp");
    	
    }else {
    	response.sendRedirect("JSP02_CookieLogin.jsp");
    	
    }
%>
