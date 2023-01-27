package com.example.myBlog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.myBlog.dto.request.RequestBoardDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.entity.Reply;
import com.example.myBlog.repository.CategoryRepository;
import com.example.myBlog.repository.ReplyRepository;
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
	@Autowired
	private ReplyRepository replyRepository;

	@GetMapping("/save")
	public String boardSave(Model model) {
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		model.addAttribute("blogHeadlineDto", headlineEntity);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "board/write-form";
	}

	@PostMapping("/save-post/{categoryId}")
	public String boardSave(RequestBoardDto boardDto, @PathVariable int categoryId, Model model) {
		boardService.save(boardDto, categoryId);
		return "redirect:/category/" + categoryId;
	}

	@GetMapping("/detail/{boardId}")
	public String boardSave(@PathVariable int boardId, Model model) {
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		List<Category> categories = categoryRepository.findAll();
		Board boardEntity = boardService.findbyId(boardId);
		
		Category categoryEntity = categoryRepository.findById(boardEntity.getCategory().getId()).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 카테고리가 없습니다.");
		});
		
		List<Board> prevNextBoards = boardService.findbyPrevNext(boardId);
		List<Reply> replyList =  replyRepository.findAll();
		List<Reply> replyListByBoardId = replyRepository.findbyBoardId(boardId);
		List<Reply> replyOnedayCheck = replyRepository.oneDayCheck();

		model.addAttribute("prevNextBoards", prevNextBoards);
		model.addAttribute("blogHeadlineDto", headlineEntity);
		model.addAttribute("boardEntity", boardEntity);
		model.addAttribute("categories", categories);
		model.addAttribute("categoryEntity", categoryEntity);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyListByBoardId", replyListByBoardId);
		model.addAttribute("replyOnedayCheck", replyOnedayCheck);

		return "board/detail";
	}

	@GetMapping("/update/{boardId}")
	public String boardUpdateForm(@PathVariable int boardId, Model model) {

		Board boardEntity = boardService.findbyId(boardId);
		BlogHeadLine headlineEntity = mainService.findByLastDto();
		List<Category> categories = categoryRepository.findAll();

		model.addAttribute("blogHeadlineDto", headlineEntity);
		model.addAttribute("categories", categories);
		model.addAttribute("boardEntity", boardEntity);

		return "board/update-form";
	}

	@PostMapping("/update/{boardId}/{categoryId}")
	public String boardUpdate(RequestBoardDto boardDto, @PathVariable int boardId, @PathVariable int categoryId) {

		boardService.updateBoardId(boardDto, boardId, categoryId);

		return "redirect:/board/detail/" + boardId;
	}

	@GetMapping("/delete/{boardId}")
	public String boardDelete(@PathVariable int boardId) {
		boardService.deleteBoardId(boardId);
		return "redirect:/";
	}
}
