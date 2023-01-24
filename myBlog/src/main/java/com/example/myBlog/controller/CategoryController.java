package com.example.myBlog.controller;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.myBlog.entity.Category;
import com.example.myBlog.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("/category")
	public String categorySave(Category category, Model model) {
		String categoryName = category.getCategoryName();
		StringTokenizer stringTokenizer = new StringTokenizer(categoryName, ",");

		System.out.println(">>>>>>>>>>>" + stringTokenizer.countTokens());
		for (int i=0; i<stringTokenizer.countTokens(); i++) {
			System.out.println(stringTokenizer.nextToken());
		}
		
		//		categoryService.save(category);
//		model.addAttribute("blogHeadlineDto", blogHeadlineDto);
		return "redirect:/";
	}

}
