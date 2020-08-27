package com.spring.database.test;

public class AnoymousTest { //구현 클래스를 객체로 생성해서 실행
	public static void main(String[] args) {

		Car s = new Sonata();
		s.run();
//1번째 예시 		
		Car ferrari = new Car(){
			/*sonata의 경우 java class 로 생성해 놓은 반면 ferrari의 경우 만들어 놓지 않앗다. 
			* 그럼 어떻게 해야할까?  람다식을 쓰자
			* 람다식을 사용한다는 의미 ) 클래스를 또 만들기 귀찬으니 람다식으로 해당 수식안에 클래스를 만들자
			
			class Ferrari implements Car{
				//Todo Auto-generated method stub
			}*/
			
			@Override
			public void run() {
             System.out.println("페라리가 썡쌩 달립니다.");				
			} //-> 구현 클래스 없이 해당 클래스에서 만들어서 바로 호출
			
		}; 
		
        ferrari.run();
//2번째 예시
        new Car() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				System.out.println("말리부가 팍팍 달립니다.");
			}
         }  .run();
         
//3.세번재 예시
         Car tucson = () -> {System.out.println("투싼이 달립니다."); };
         tucson.run();
         
	} //main
}
