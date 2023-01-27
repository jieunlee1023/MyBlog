package com.example.myBlog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Reply;

public interface BoardRepository extends JpaRepository<Board, Integer> {

	@Query(value = " SELECT * FROM board "
						+ " WHERE categoryId = ?1 ",
				nativeQuery = true)
	List<Board> findbyCategoryId(int categoryId);

	
	@Query(value =  " SELECT * FROM board WHERE id = ?1 "
						+ " UNION ALL ( "
						+ " SELECT * FROM board WHERE id > ?1 AND id <= (?1 + 2) ORDER BY id DESC LIMIT 2 ) "
						+ " UNION ALL ( "
						+ " SELECT * FROM board WHERE id < ?1 ORDER BY id DESC LIMIT 2) ",
			nativeQuery = true)
	List<Board> findPrevNextBoards(int boardId);


	@Query(value = " SELECT * FROM board "
			+ " WHERE createDate > now() - INTERVAL 1 DAY ",
	nativeQuery = true)
	List<Board> oneDayCheck();
}
