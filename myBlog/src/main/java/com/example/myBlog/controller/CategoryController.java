package com.example.myBlog.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.myBlog.dto.request.CategoryDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.IBoardRepository;
import com.example.myBlog.repository.ICategoryRepository;
import com.example.myBlog.service.BoardService;
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
	private ICategoryRepository categoryRepository;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private IBoardRepository boardRepository;

	@PostMapping("/save")
	public String categorySave(CategoryDto categoryDto, Model model) {
		
		categoryService.save(categoryDto);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "redirect:/";
	}

	@GetMapping("/{categoryId}")
	public String categorySave(@PathVariable int categoryId, Model model,
			@PageableDefault(size = 16, sort = "id", direction = Direction.DESC) Pageable pageable) {
		
		List<Category> categories = categoryRepository.findAll();
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		Category categoryEntity = categoryRepository.findById(categoryId).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 카테고리가 없습니다.");
		});

		Page<Board> boards = boardService.getBoardList(pageable);
		
		
		int PAGENATION_BLOCK_COUNT =4;
		
		int nowPage = boards.getPageable().getPageNumber() + 1;
		int startPageNumber = Math.max(nowPage - PAGENATION_BLOCK_COUNT, 1);
		int endPageNumber = Math.min(nowPage+PAGENATION_BLOCK_COUNT, boards.getTotalPages());

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}
		
		List<Board> oneDayCheck =  boardRepository.oneDayCheck();

		
		model.addAttribute("oneDayCheck",oneDayCheck);
		model.addAttribute("boards",boards);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("startPage",startPageNumber);
		model.addAttribute("endPage",endPageNumber);
		model.addAttribute("pageNumbers",pageNumbers);
		
		model.addAttribute("categories", categories);
		model.addAttribute("categoryEntity", categoryEntity);
		model.addAttribute("blogHeadlineDto", headlineEntity);

		return "index";
	}
	


}
