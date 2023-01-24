<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../index.jsp"%>



<div id="main--body--right">
	<div id="body--right--top">

		<div id="body--right--title">
			<h3>${categoryEntity.categoryName }</h3>
			<h3 style="color: #5cbeb6">${boardListSize } </h3>
		</div>
		<a href="/board/save"><img id="main--right--img"
			src="/images/write.png" alt="글쓰기"></a>

	</div>
<br>
	<div id="main--board--item">
	<input type="hidden" value="${boardListSize }" id="board--size">
	<c:forEach var="board" items="${boardList }">
				<div class="main--board--items">
					<img id="new--bedge" src="/images/new.png">
					<c:choose>
						<c:when test="${empty board.boardImg }">
							<div id="board--title--img"><span>${board.title }</span></div>
						</c:when>
						<c:otherwise>
							<img class="board--img" src="http://localhost:9999/image/${board.boardImg}">
						</c:otherwise>
					</c:choose>
					<div id="board--title">${board.title }</div>
					<div id="board--createDate">${board.createDate }</div>
				</div>
	</c:forEach>
		</div>

</div>
</div>
<br><br><br>
<script type="text/javascript" src="/js/category-list.js"></script>
</body>
</html>

