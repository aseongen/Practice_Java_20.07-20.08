package com.spring.database.score.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.database.jdbc.score.model.ScoreVO;
import com.spring.database.score.service.IScoreService;

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
		System.out.println("/score/register: POST");
		System.out.println("Controller param: " + scores);
		service.insertScore(scores);
		return "score/write-result";
	}
	
	//점수 전체 조회를 처리하는 요청 메서드
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("/score/list: GET");
		//List<ScoreVO> list = service.selectAllScores();
		//model.addAttribute("sList", list);
		model.addAttribute("sList", service.selectAllScores());
	}
	
	//점수 삭제 요청 처리 메서드
	@GetMapping("/delete")
	public String delete(int stuId, RedirectAttributes ra) {
		System.out.println("삭제할 학번: " + stuId);
		service.deleteScore(stuId);
		ra.addFlashAttribute("message", "delSuccess");
		return "redirect:/score/list";
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
