package kr.co.koo.jdbc.user.model;

public class UserVO {

	/* VO 클래스는 dB 컬럼들을 클래스 필드로 선언
	 * VO 클래스의 변수들은 은닉을 통해 데이터를 관리한다.
	 * DB 테이블의 컬럼과 1:1로 매칭되는 변수를 선언해야한다
	 */
	private String name;
	private String id;
	private String pw;
	private String phone1;
	private String phone2;
	private String phone3;
	private String gender;
	
	//VO 클래스는 기본생성자와 모든 필드를 초기화 하는 생성자를 선언
	public UserVO() {}

	public UserVO(String name, String id, String pw, String phone1, String phone2, String phone3, String gender) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	} 
	
	
	
	
	
}
