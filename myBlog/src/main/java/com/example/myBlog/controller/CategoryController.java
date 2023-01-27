package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.myBlog.dto.request.CategoryDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.BoardRepository;
import com.example.myBlog.repository.CategoryRepository;
import com.example.myBlog.service.CategoryService;
import com.example.myBlog.service.MainService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private MainService mainService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private BoardRepository boardRepository;

	@PostMapping("/save")
	public String categorySave(CategoryDto categoryDto, Model model) {
		
		categoryService.save(categoryDto);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "redirect:/";
	}

	@GetMapping("/{categoryId}")
	public String categorySave(@PathVariable int categoryId, Model model) {
		List<Category> categories = categoryRepository.findAll();

		BlogHeadLine headlineEntity = mainService.findByLastDto();

		Category categoryEntity = categoryRepository.findById(categoryId).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 카테고리가 없습니다.");
		});

		List<Board> boardList = boardRepository.findbyCategoryId(categoryId);

		
		model.addAttribute("categories", categories);
		model.addAttribute("categoryEntity", categoryEntity);
		model.addAttribute("blogHeadlineDto", headlineEntity);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardListSize", boardList.size());

		return "index";
	}
	


}
