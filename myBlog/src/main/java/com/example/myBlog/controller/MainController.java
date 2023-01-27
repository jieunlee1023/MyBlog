package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.myBlog.dto.request.RequestBlogHeadlineDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.BoardRepository;
import com.example.myBlog.repository.CategoryRepository;
import com.example.myBlog.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping({ "", "/" })
	public String main(Model model) {
		
		List<Category> categories = categoryRepository.findAll();
		BlogHeadLine headlineEntity  = mainService.findByLastDto();
		List<Board> boardList = boardRepository.findAll();

		model.addAttribute("blogHeadlineDto", headlineEntity);
		model.addAttribute("categories", categories);
		model.addAttribute("boardList", boardList);
		
		return "index";
	}

	@PostMapping("/blog-headline")
	public String blogHeadLineSave(RequestBlogHeadlineDto blogHeadlineDto, Model model) {
		mainService.blogHeadLineSave(blogHeadlineDto);
		
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		
		return "redirect:/";
	}
}
