package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.myBlog.dto.request.RequestBoardDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.CategoryRepository;
import com.example.myBlog.service.BoardService;
import com.example.myBlog.service.MainService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private MainService mainService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping("/save")
	public String boardSave(Model model) {
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		model.addAttribute("blogHeadlineDto", headlineEntity);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "board/write-form";
	}

	@PostMapping("/save-post/{categoryId}")
	public String boardSave(RequestBoardDto boardDto,@PathVariable int categoryId, Model model) {
		boardService.save(boardDto, categoryId);
		return "redirect:/category/" + categoryId;
	}
	
	
	@GetMapping("/detail/{boardId}")
	public String boardSave(@PathVariable int boardId, Model model) {
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		model.addAttribute("blogHeadlineDto", headlineEntity);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		Board boardEntity = boardService.findbyId(boardId);
		
		model.addAttribute("boardEntity",boardEntity);
		
		return "board/detail";
	}
}
