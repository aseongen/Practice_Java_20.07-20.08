package kr.co.koo.jspbasic.user;


/* *자바빈 (JAVA Bean)이란?
- 자바빈이란 JAVA 언어의 데이터(변수)와 기능(메서드)로 이루어진 클래스이다.
- 자바빈은 데이터를 저장하는 변수, 데이터를 읽어오는 메서드(getter),데이터를 저장할 때 사용되는 메서드(setter)로 이루어져 있다.
- 자바빈은 데이터베이스의 반복적인 작업을 효율적으로 처리하기 위해 사용한다.
- JSP에서는 액션 태그를 사용하여 자바빈을 사용할 수 있는 방법이 있다.


 자바빈 용도
 client                         WAS               DB
  form                >>>>>>    req           DB에 정보를 넣는다.
(회원가입 양식폼 작성후 서버로 전달)       정보를 빈에다 포장       포장 째로 전달 해서 저장

**자바빈이란 ?
- 데이터 모음 객체
- 빈을 통해 원활한 DB작업 수행이 가능
- 은닉을 통해 설계
 
 #자바빈
 1.자바빈은 데이터 베이스와의 반복데이터 작업을 쉽게 처리하기 위한 클래스이다.
 2. 일반적으로 데이터베이스의 컬럼과 1:1로 매칭되는 멤버변수(필드)를 선언합니다.
3. 자바빈 클래스는 은닉(캡슐화)를 사용하여 데이터를 보호한다.
 */

public class UserBean { //extends Object 생략되어있음
	//개인 정보 보호
	private String id;
	private String pw;
	private String name;
	private String email;
	
	/* 자바빈 클래스는 일반적으로 기본생성자 1개와 모든 멤버변수를 초기화하는 생성자 1개를 선언한다.*/
	
	//**자바 빈 클래스의 모습
	//객체를 만들어줌
public UserBean() {}
   
public UserBean(String id, String pw, String name, String email) {
		super();
		this.id=id;
		this.pw=pw;
		this.name=name;
	    this.email=email;
	}
	//setter: 값저장, getter: 값 끌어옴

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
