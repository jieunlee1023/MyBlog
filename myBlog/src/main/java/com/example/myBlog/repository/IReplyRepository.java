package com.example.myBlog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.Reply;

public interface IReplyRepository extends JpaRepository<Reply, Integer> {

	@Query(value = " SELECT * FROM reply "
						 + " WHERE boardId = ? ",
				nativeQuery = true)
	List<Reply> findbyBoardId(int boardId);

	
	@Query(value = " SELECT * FROM reply "
						+ " WHERE createDate > now() - INTERVAL 1 DAY " ,
						nativeQuery = true)
	List<Reply> oneDayCheck();



}
