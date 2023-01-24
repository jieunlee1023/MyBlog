package com.example.myBlog.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	
	@Id
	@Column(nullable = false)
	private int id;
	
	@Column(nullable = true)
	private String categoryName;
	
	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER) 
	private List<Board> board;

	@CreationTimestamp 
	private Timestamp createDate;

}
