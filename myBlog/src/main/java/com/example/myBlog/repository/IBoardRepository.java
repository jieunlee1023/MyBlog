package com.example.myBlog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Reply;

public interface IBoardRepository extends JpaRepository<Board, Integer> {

	@Query(value = " SELECT * FROM board "
						+ " WHERE categoryId = ?1 ",
				nativeQuery = true)
	List<Board> findbyCategoryId(int categoryId);

	
	@Query(value = " SELECT * FROM board "
						+ " WHERE id = ?1 "
						+ " AND categoryId = ?2 "
						+ " UNION ALL ( "
						+ " SELECT * FROM board WHERE id > ?1 AND id <= ?1 + 2 AND categoryId = ?2 ORDER BY id DESC LIMIT 2) "
						+ " UNION ALL (\r\n"
						+ " SELECT * FROM board WHERE id < ?1 AND categoryId = ?2 ORDER BY id DESC LIMIT 2) " ,
			nativeQuery = true)
	List<Board> findPrevNextBoards(int boardId, int categoryId);


	@Query(value = " SELECT * FROM board "
			+ " WHERE createDate > now() - INTERVAL 1 DAY ",
	nativeQuery = true)
	List<Board> oneDayCheck();


	
	@Query(value = " SELECT * FROM board  "
						+ " WHERE id = ?1 "
						+ " AND categoryId = ?2 "
						+ " UNION ALL ("
						+ "SELECT * FROM board WHERE id < ?1 AND categoryId = ?2 ORDER BY id DESC LIMIT 4) ",
				nativeQuery = true)
	List<Board> findPrevBoards(int boardId, int categoryId);

	@Query(value = " SELECT * FROM board "
						+ " WHERE id = ?1 "
						+ " AND categoryId = ?2 "
						+ " UNION ALL ( "
						+ " SELECT * FROM board WHERE id > ?1 AND id <= ?1 + 4 AND categoryId = ?2 ORDER BY id DESC LIMIT 4) ",
							nativeQuery = true)
	List<Board> findNextBoards(int boardId, int categoryId);
}
