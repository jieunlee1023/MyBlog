package com.example.myBlog.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.RequestBoardDto;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.BoardRepository;
import com.example.myBlog.repository.CategoryRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Transactional
	public void save(RequestBoardDto boardDto, int categoryId) {
	
		
		Category categoryEntity = categoryRepository.findById(categoryId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 카테고리가 존재하지 않습니다.");
		});
		
		
		if (boardDto.getFile().getOriginalFilename() == "") {
			Board board = boardDto.toEntitiy(null);
			categoryEntity.getBoard().add(board);
			board.setCategory(categoryEntity);
			boardRepository.save(board);
			
		} else {
			UUID uuid = UUID.randomUUID();
			String imageFileName = uuid + "_" + boardDto.getFile().getOriginalFilename();
			Path imageFilePath =  Paths.get("C:\\MyBlog\\image\\board\\" + imageFileName);
			try {
				Files.write(imageFilePath, boardDto.getFile().getBytes());
				// DB 저장 로직 추가
				Board board = boardDto.toEntitiy(imageFileName);
				categoryEntity.getBoard().add(board);
				board.setCategory(categoryEntity);
				boardRepository.save(board);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}





	}

}
