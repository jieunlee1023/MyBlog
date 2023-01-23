package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.myBlog.dto.request.RequestBlogHeadlineDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@GetMapping({ "", "/" })
	public String main(Model model) {
		BlogHeadLine headlineEntity  = mainService.findByLastDto();
		model.addAttribute("blogHeadlineDto", headlineEntity);
		return "index";
	}

	@PostMapping("/blog-headline")
	public String blogHeadLineSave(RequestBlogHeadlineDto blogHeadlineDto, Model model) {
		mainService.blogHeadLineSave(blogHeadlineDto);
		model.addAttribute("blogHeadlineDto", blogHeadlineDto);
		return "redirect:/";
	}
}
