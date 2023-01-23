package com.example.myBlog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 30)
	private String username;
	
	@Column(nullable = false, length = 30)
	private String password;
	
	@Column(nullable = false, length = 50)
	private String email;
	
	@ColumnDefault(enum) //문자라는 것을 알려주어야 한다.
	private String role; //admin, user, manager
	
	@CreationTimestamp //시간이 자동으로 입력된다.
	private Timestamp createDate;

	
}
