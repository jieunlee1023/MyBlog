package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Category;
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

	@PostMapping("/save")
	public String categorySave(Category category, Model model) {
		categoryService.save(category);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "redirect:/";
	}

	@GetMapping("/{categoryId}")
	public String categorySave(@PathVariable int categoryId, Model model) {
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		
		BlogHeadLine headlineEntity  = mainService.findByLastDto();
		model.addAttribute("blogHeadlineDto", headlineEntity);
		
		Category categoryEntity =  categoryRepository.findById(categoryId).orElseThrow(()->{
			return new IllegalArgumentException("찾으시는 카테고리가 없습니다.");
		});
		model.addAttribute("categoryEntity", categoryEntity);
		return "category/category-page";
	}

	

}
