package com.spring.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.web.model.UserVO;

//자동으로 스프링 컨테이너에 해당 클래스의 빈을 등록하는 아노테이션
@Controller
@RequestMapping("/request")
public class RequestController {

	public RequestController() {
		System.out.println("RequestCon 작동!");
	}

	// RequestMapping은 어떤 URI로 이 메서드를 동작시킬 것인가에 대한 설정입니다.
	@RequestMapping("/test")
	public String testCall() {
		System.out.println("/request/test 요청이 들어옴!");
		return "test";
	}

	/*
	 * 만약 /request/req 요청이 들어왔을 때 views폴더 아래에 있는 request폴더 아래에 req-ex01.jsp파일을 열도록
	 * 메서드를 구성해보세요
	 */
	@RequestMapping("/req")
	public String req() {
		System.out.println("/request/req 요청이 들어옴!");
		return "request/req-ex01";
	}

//	@RequestMapping(value="/request/basic01", method=RequestMethod.GET)
	@GetMapping("/basic01")
	public String basicGet() {
		System.out.println("/request/basic01 요청이 들어옴: GET");
		return "request/req-ex01";
	}

//	@RequestMapping(value="/request/basic01", method=RequestMethod.POST)
	@PostMapping("/basic01")
	public String basicPost() {
		System.out.println("/request/basic01 요청이 들어옴: POST");
		return "request/req-ex01";
	}

	// 컨트롤러의 요청메서드를 void 리턴타입으로 지정
	@GetMapping("/req-ex02")
	public void reqEx02() {
		System.out.println("/request/req-ex02 요청!");
		// return 타입이 없다 -> 넘어갈 페이지가 없다. -> 404 페이지 확인되지만, console에 확인된다.
		// 또한, return 타입이 없어도 void 타입시 req-ex02.jsp 파일을 자동으로 찾아낸다.
	}

	// 요청 파라미터 받아보기
	@GetMapping("/param")
	public String paramTest(HttpServletRequest request) {
		System.out.println("/request/param 요청: GET");

		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);

		return "";
	}

	/*
	 * 정리 ) void 의 경우 : 내가 요청한 uri 경로에 해당 경로에 파일이 동일하게 있을 경우 사용 String 의 경우 : 내가 요청한
	 * uri 경로와 파일 경로가 다른 경우 return 으로 해당 파일 경로 지정
	 */

	@GetMapping("/join")
	public void register() {
		System.out.println("/request/join: GET");

	}

	/* 1. 전통적인 jsp/servlet 의 파라미터 읽기처리 방법 - HttpServletRequest객체를 사용
	 */

	/*
	 * @PostMapping("/join") public String register(HttpServletRequest request) {
	 * System.out.println("/request/join: GET");
	 * 
	 * System.out.println("ID: " + request.getParameter("userId"));
	 * System.out.println("PW: " + request.getParameter("userPw"));
	 * System.out.println("HOBBY: " +
	 * Arrays.toString(request.getParameterValues("hobby")));
	 * 
	 * return "request/join"; }
	 */

	/*
	 * 2. @RequestParam 어노테이션을 이용한 요청 파라미터 처리
	 */

/*	@PostMapping("/join")
	public void register(@RequestParam("userId") String id, 
			@RequestParam("userPw") String pw,
			@RequestParam(value="hobby", required=false, defaultValue = "no hobby person") List<String>hobbys){

		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
		System.out.println("hobby: " + hobbys.toString());

	}*/
	
	/* 3. 커맨드 객체 */
	
	@PostMapping("/join")
	public void register(UserVO user) {
		System.out.println("Id: " + user.getUserId());
		System.out.println("PW: " + user.getUserPw());
		
		System.out.println("NAME: " + user.getUserName());
		System.out.println("HOBBY: " + user.getHobby());
	}
	
	//req-quiz 정답
		@RequestMapping(value="/quiz", method=RequestMethod.GET)
		public String quiz() {
			return "request/req-Quiz";
		}
		
		/*@RequestMapping(value="/quiz", method=RequestMethod.POST)
		public String quiz(@RequestParam("userId") String id,
						@RequestParam("userPw") String pw) {
		
			if(id.equals("abc1234") && pw.equals("xxx4321"))
				return "request/login-success";
			else
				return "request/login-fail";
		}*/
		
		@RequestMapping(value="/quiz", method=RequestMethod.POST)
		public String quiz(UserVO user) {
		
			if(user.getUserId().equals("abc1234") 
					&& user.getUserPw().equals("xxx4321"))
				return "request/login-success";
			else
				return "request/login-fail";
		}
		
	
}
