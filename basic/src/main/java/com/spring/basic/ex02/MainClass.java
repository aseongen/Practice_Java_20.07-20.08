package com.spring.basic.ex02;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
	/*	DataBaseInfo dbInfo = new DataBaseInfo();
		dbInfo.setUid("Spring1"
;
		dbInfo.setUrl("jdbc:mysql://localhost:3306/spring");
	*/
		
		//XML 호출
		GenericXmlApplicationContext ct =
				new GenericXmlApplicationContext("classpath:db-config.xml");
		
		DataBaseInfo db1 = ct.getBean("db1",DataBaseInfo.class);
		System.out.println("db1" + db1.getUrl());
		System.out.println("URL " + db1.getUid());
		System.out.println("UPW " + db1.getUpw());
	
		System.out.println("---------------------------");
	
		DataBaseInfo db2 = ct.getBean("db2",DataBaseInfo.class);
		System.out.println("db2: " + db2.getUrl());
		System.out.println("URL: " + db2.getUid());
		System.out.println("UPW: " + db2.getUpw());
		
		System.out.println("----------------------------");
		
//		MemberDAO dao = new MemberDAO();
		MemberDAO dao = ct.getBean("dao", MemberDAO.class);
		dao.showDBInfo();
		
		
		
	}
}
