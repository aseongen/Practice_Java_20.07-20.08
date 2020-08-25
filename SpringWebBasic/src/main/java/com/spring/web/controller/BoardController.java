package com.spring.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.web.model.BoardVO;
import com.spring.web.service.IBoardService;

@Controller
@RequestMapping("/board")
@Repository
public class BoardController {

	@Autowired
	private IBoardService service;

	//글 작성 화면 요청
	@GetMapping("/write")
	public void write() {
		System.out.println("/board/write : GET요청 발생!");		
	}

	//글 작성 처리 요청
	@PostMapping("/write")
	public String write(BoardVO article) {
		System.out.println("/board/write : POST요청 발생!");
		service.insertArticle(article);
		return "redirect:/board/list";
	}

	//글 목록 화면 요청
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("/board/list : GET요청 발생!");
		model.addAttribute("articles", service.getArticles());		
	}

	//글 삭제 요청
	@GetMapping("/delete")
	public String delete(int boardNo) {
		System.out.println("/board/delete?boardNo="+boardNo+" : GET요청 발생!");
		service.deleteArticle(boardNo);
		return "redirect:/board/list";
	}

	//글 내용보기 요청
	@GetMapping("/content")
	public void content(@ModelAttribute("boardNo") int boardNo
			, Model model) {
		System.out.println("/board/content?boardNo="+boardNo+" : GET요청 발생!");

		model.addAttribute("article", service.getContent(boardNo));
		
	}

	//글 수정하기 화면요청
	@GetMapping("/modify")
	public void modify(@ModelAttribute("boardNo") int boardNo
			, Model model) {
		System.out.println("/board/modify?boardNo="+boardNo+" : GET요청 발생!");

		model.addAttribute("article", service.getContent(boardNo));
		//article: 글제목 글 내용을 갖고 옴.
		
	}

	//글 수정 처리요청
	@PostMapping("/modify")
	public String modify(BoardVO article, int boardNo) {
		System.out.println("/board/modify?boardNo="+boardNo+" : POST요청 발생!");
		service.modifyArticle(article, boardNo);
		return "redirect:/board/content?boardNo="+boardNo;
	}

}
