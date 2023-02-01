<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								 	
								 	<c:choose>
								 		<c:when test="${category.board.size() ==0 }">
								 				<button type="button" class="category--minus" id ="category--minus"  style="background-color: black; "
												 onclick="deleteIndex(this, ${category.id}, ${category.board.size() });" > ─ </button>
								 		</c:when>
								 		<c:otherwise>
								 				<button type="button" class="category--minus" id ="category--minus" style="background-color: #e31740; "
												 onclick="deleteIndex(this, ${category.id}, ${category.board.size() });" > ─ </button>
								 		</c:otherwise>
								 	</c:choose>
								 	
					
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
			
			
			<c:choose>
				<c:when test="${categoryEntity.id eq category.id }">
					<a href="/category/${category.id}" id="category--name"  style="font-weight: bold; color: black;">
					${category.categoryName} (${category.board.size() })
				
				
				
				<c:forEach var="oneDayCategoryCheck" items="${oneDayCategoryCheck }">
					<c:if test="${ oneDayCategoryCheck != null && oneDayCategoryCheck.category.id eq category.id}">
						<img id="new--bedge--category" src="/images/new.png">
					</c:if>
				</c:forEach>
				</a><br>
				</c:when>
				<c:otherwise>
					<a href="/category/${category.id}" id="category--name" >
					${category.categoryName} (${category.board.size() })
				
				<c:forEach var="oneDayCategoryCheck" items="${oneDayCategoryCheck }">
					<c:if test="${ oneDayCategoryCheck != null && oneDayCategoryCheck.category.id eq category.id}">
						<img id="new--bedge--category" src="/images/new.png">
					</c:if>
				</c:forEach>
					</a><br>
					
				</c:otherwise>
			</c:choose>
			
			

		</c:forEach>
		

	</div>
