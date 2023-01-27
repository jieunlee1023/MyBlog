package com.example.myBlog.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.RequestBoardDto;
import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;
import com.example.myBlog.entity.Reply;
import com.example.myBlog.repository.BoardRepository;
import com.example.myBlog.repository.CategoryRepository;
import com.example.myBlog.repository.ReplyRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ReplyRepository replyRepository;

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
			Path imageFilePath = Paths.get("C:\\MyBlog\\image\\board\\" + imageFileName);
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

	@Transactional
	public Board findbyId(int boardId) {
		Board boardEntity = boardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("찾으시는 게시글이 없습니다.");
		});
		return boardEntity;
	}

	public void updateBoardId(RequestBoardDto boardDto, int boardId, int categoryId) {

		Board boardEntity = boardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 게시글이 존재하지 않습니다.");
		});

		Category categoryEntity = categoryRepository.findById(categoryId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 카테고리가 존재하지 않습니다.");
		});

		if (boardDto.getFile().getOriginalFilename() == "") {
			Board board = boardDto.toEntitiy(null);
			categoryEntity.getBoard().add(board);
			boardEntity.setBoardImg(null);

		} else {
			System.out.println("이미지 수정 저장");
			UUID uuid = UUID.randomUUID();
			String imageFileName = uuid + "_" + boardDto.getFile().getOriginalFilename();
			System.out.println(imageFileName);
			Path imageFilePath = Paths.get("C:\\MyBlog\\image\\board\\" + imageFileName);
			try {
				Files.write(imageFilePath, boardDto.getFile().getBytes());
				// DB 저장 로직 추가
				Board board = boardDto.toEntitiy(imageFileName);
				categoryEntity.getBoard().add(board);
				boardEntity.setBoardImg(imageFileName);

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		boardEntity.setCategory(categoryEntity);
		boardEntity.setTitle(boardDto.getTitle());
		boardEntity.setContent(boardDto.getContent());

		boardRepository.save(boardEntity);
	}

	@Transactional
	public void deleteBoardId(int boardId) {
		boardRepository.deleteById(boardId);
	}

	@Transactional
	public Page<Board> getBoardList(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Transactional
	public List<Board> findbyPrevNext(int boardId) {
		return boardRepository.findPrevNextBoards(boardId);
	}

	@Transactional
	public void replySave(Reply reply, int boardId) {

		Board boardEntity = boardRepository.findById(boardId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 게시글이 존재하지 않습니다.");
		});
		
		reply.setBoard(boardEntity);
		replyRepository.save(reply);

	}

}
