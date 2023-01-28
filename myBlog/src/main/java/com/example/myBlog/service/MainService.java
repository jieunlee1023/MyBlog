package com.example.myBlog.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.RequestBlogHeadlineDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.repository.IBlogHeadLineRepository;

@Service
public class MainService {

	@Autowired
	private IBlogHeadLineRepository blogHeadLineRepository;

	@Transactional
	public void blogHeadLineSave(RequestBlogHeadlineDto blogHeadlineDto) {
		// UUID 사용법
		UUID uuid = UUID.randomUUID();

		String imageFileName = uuid + "_" + blogHeadlineDto.getFile().getOriginalFilename();

		Path imageFilePath = Paths.get("C:\\MyBlog\\image\\blog-headLine\\" + imageFileName);

		// 파일 만들기 하는 방법
		try {
			Files.write(imageFilePath, blogHeadlineDto.getFile().getBytes());
			// DB 저장 로직 추가
			BlogHeadLine blogHeadLine = blogHeadlineDto.toEntitiy(imageFileName);
			blogHeadLineRepository.save(blogHeadLine);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	public BlogHeadLine findByLastDto() {
		BlogHeadLine headlineEntity = blogHeadLineRepository.findByLastId();
		return headlineEntity;
	}

}
