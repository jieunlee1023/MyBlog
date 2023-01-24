<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>

<br>
<div id="main--body">

	<div id="main--body--left">
		<div id="main--left--title">
			<h3>전체보기</h3>
			<a class="popup--cateogry--open" id="header--setting" href="#category--pop--up"> 
				<img  id="body--setting--img" src="/images/setting.png" alt="설정">
			</a>
			<!-- 설정 -->
			<form action="/category" method="post" enctype="multipart/form-data">
					<div id="category--pop--up" class="popup--category--wrap" style="display: none;">
						<div class="popup--category--inner" >
							<div class="popup--item">
								<button type="button" id="category--add">+ 추가</button>
							</div>
							<div id="category--main">
								<div id="category-index" > 
								 	<input type="text" id="category--input" onkeyup="characterCheck(this);" 
								 			   name="categoryName">
									<button type="button" class="category--minus"
												 onclick="deleteIndex(this);" > ─ </button>
									<br> <br> 
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
		<div>Python (12)</div>
		<div>Java (2)</div>
		<div>IOS (8)</div>
		<div>소프트웨어 자료 (26)</div>
		<div>자료구조 (8)</div>
		<div>리눅스 (8)</div>
		<div>Git (4)</div>
		<div>자기계발 (3)</div>
		<div>경영전략 (20)</div>
		<div>리더쉽 (7)</div>
	</div>
	
	
	<div id="main--body--right">
		<div	id="body--right--top">
			
			<div 	id="body--right--title" > 
				<h3>경영전략</h3> 
				<h3 style="color: #5cbeb6">20</h3>
			</div>
			<img  id="main--right--img" src="/images/write.png" alt="글쓰기">
			
		</div>
		
		<div id="main--board">
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
	</div>
	
		<div id="main--board">
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
	</div>
	
		<div id="main--board">
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
	</div>
	
		<div id="main--board">
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
		<div class="main--board--items">
			<img class="board--img" src="">
			<div>팬덤확보에 성공한 4세대 걸구룹의 차별화 전략</div>
			<span>2022.12.30</span>
		</div>
	</div>
	
	
	</div>
	
	
	
</div>




<script type="text/javascript" src="/js/category.js"></script>
</body>
</html>