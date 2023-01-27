package com.example.myBlog.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.myBlog.dto.response.ResponseDto;
import com.example.myBlog.entity.Reply;
import com.example.myBlog.service.BoardService;

@RestController
@RequestMapping("/api/board")
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/reply/save/{boardId}")
	public ResponseDto<?> replySave(@RequestBody Reply reply ,@PathVariable int boardId){
		boardService.replySave(reply, boardId);
		return new ResponseDto<>(HttpStatus.OK, "댓글 작성 완료!");
	}

}
