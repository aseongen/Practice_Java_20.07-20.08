package com.spring.database.test;

//Lamda식 적용가능 경우 : 인터페이스 안에 추상메서드가 단 하나일 경우만 가능!

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
         
//3.세번재 예시 => Lamda식 적용 : 인터페이스 안에 추상메서드가 단 하나일 경우만 가능!
         Car tucson = () -> {System.out.println("투싼이 달립니다."); };
         tucson.run();
         
         ///////////////////////////////////
//4.네번째 예시
        //계산기 인터페이스와 람다식
         Calculator sharp = new Calculator() { //자동완성
			
			@Override
			public int add(int n1, int n2) {
				System.out.print("샤프 계산기의 덧셈: ");
				return n1 + n2;
			}
		};
		System.out.println("-------------------");
		System.out.println(sharp.add(10, 15));
		
//5. 다섯번째 예시		
		//add 기능은 Calculator.java 
		Calculator casio = (x,y) -> {
			
			System.out.print("카시오 계산기의 덧셈: ");
			return x + y;
		};
		
		System.out.println(casio.add(100, 200));
         
//6.여섯번재 예시
		Calculator shaomi = (x,y)-> x + y;
		System.out.println("샤오미 결과: " + shaomi.add(55, 44));
	
		Calculator shaomi2 = (x,y)-> {
			return x + y; //리턴만 하면 될때는 상단 처럼 생략해도 된다.
		};
		System.out.println("샤오미 결과2: " + shaomi2.add(55, 44));
	
	} //main
}
