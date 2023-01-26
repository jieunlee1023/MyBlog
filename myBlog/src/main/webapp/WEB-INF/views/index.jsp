<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>

<br>
<div id="main--body">

	<div id="main--body--left">
		<div id="main--left--title">
			<a href="/" id="category--all">전체보기</a>
			<a class="popup--cateogry--open" id="header--setting" href="#category--pop--up"> 
				<img  id="body--setting--img" src="/images/setting.png" alt="설정">
			</a>
			<!-- 설정 -->
			<form action="/category/save" method="post" >
					<div id="category--pop--up" class="popup--category--wrap" style="display: none;">
						<div class="popup--category--inner" >
							<div class="popup--item">
								<button type="button" id="category--add">+ 추가</button>
							</div>
							<div id="category--main">
								<div id="category-index" > 
								<input type="hidden" value="${categories.size() }" id="category--size">
									<c:forEach var="category" items="${categories }">
									<input type="hidden" value="${category.id }" id="category--id">
								 	<input type="text" id="category--input" onkeyup="characterCheck(this);" 
								 			   name="categoryName" value="${category.categoryName}">
								 		
									<button type="button" class="category--minus" id ="category--minus"
												 onclick="deleteIndex(this, ${category.id}, ${category.board.size() });" > ─ </button>
									<br> <br> 
									</c:forEach>
								</div>
							</div>
							<div id="category--text">
								<div>-카테고리는 최대 20개 까지만 설정 가능</div>
								<div>-글자 수는 20자 이내 (공백 포함)</div>
							</div>

								<button class="popup-category-cancel" id="popup-category-cancel" type="button">취소</button>
								<button class="popup-category-btn" id="popup-category-save" type="submit">완료</button>
							
						</div>
					</div>
				</form>
			
			
		</div>
		<br>
		<c:forEach var="category" items="${categories }">
			<input type="hidden" value="${category.id}" id="categoryId" >
			<a href="/category/${category.id}" id="category--name" >${category.categoryName} (${category.board.size() })</a><br>
		</c:forEach>

	</div>


<script type="text/javascript" src="/js/category.js"></script>
