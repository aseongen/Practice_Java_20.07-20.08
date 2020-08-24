package com.spring.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.web.model.ScoreVO;
import com.spring.web.service.IScoreService;

@Controller
@RequestMapping("/score")
public class ScoreController {
	
//	private IScoreDAO dao = new ScoreDAO();
	@Autowired // 객체주입 
	private IScoreService service;
	
	//점수 등록 화면을 열어주는 처리를 하는 요청 메서드 
	@GetMapping("/register")
	public String register() {
		System.out.println("/score/register:GET");
		return "score/write-form";
	}
	
	//점수 등록을 처리하는 요청 메서드 
	@PostMapping("/register")
	public String register(ScoreVO scores) {
		System.out.println("/score/register:POST");
		System.out.println("controllerparam: " + scores); 
		//파라미터가 잘 들어갔는지 확인 -> 
		//scores 만하면 주소값만 확인 되기 때문에 toStirng 정의하기위해 scoresVO 이동 -> generate.toString
		service.insertScore(scores);
		return "score/write-result";
	}
	
	//점수 전체 조회를 처리하는 요청 메서드
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("/score/list: GET");
		 //3.서비스의 점수 전체 조회 메서드 호출 즉, dao -> Service -> Controller로 호출
//		List<ScoreVO> list = service.selectAllScores();
//		model.addAttribute("sList",list);
		model.addAttribute("sList", service.selectAllScores());// sList이름으로  해당 정보 저 장
	}
	
	//점수 삭제 요청 처리 메서드
	@GetMapping("/delete")
	public String delete(int stuNum, RedirectAttributes ra) { //삭제가 끝난후 삭제완료 문구 띄우기 위해 redirect
		System.out.println("삭제할 학번: " + stuNum);
		service.deleteScore(stuNum);
		ra.addFlashAttribute("message", "delSuccess");
		return "redirect:/score/list"; //삭제한 후 redirect해서 삭제가 완료된 list를 다시 가져온다
	}
	
	//점수 개별 조회 화면 열람 요청 메서드
	@GetMapping("/search")
	public void search() {
		System.out.println("/score/search: GET");
	}
	
	//점수 개별 조회 처리 요청 메서드
		@GetMapping("/selectOne")
		//String으로 받은 다음
		public String selectOne(String stuNum, Model model,
								RedirectAttributes ra) {
			System.out.println("/score/selectOne: GET");
			
			List<ScoreVO> list = service.selectAllScores();
			
			try {
				int n = Integer.parseInt(stuNum); //try 안에서 parseInt로 받음
				
				if(n > list.size()) {
					ra.addFlashAttribute("msg", "학번정보가 없습니다.");
					return "redirect:/score/search";
				} else {
					model.addAttribute("stu", service.selectOne(n));
					return "score/search-result";
				}
			} catch(NumberFormatException e) {
				ra.addFlashAttribute("msg", "숫자로만 입력하세요!");
				return "redirect:/score/search";
			}
			
		}

	}
