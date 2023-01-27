<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%@include file="layout/nav.jsp" %>

<div id="main--body--right">
	<div id="body--right--top">

		<c:choose>
			<c:when test="${empty categoryEntity }">
					<div id="body--right--title">
						<h3>전체보기</h3>
						<h3 style="color: #5cbeb6">${boardList.size() } </h3>
					</div>
				
			</c:when>
			<c:otherwise>
					<div id="body--right--title">
						<h3>${categoryEntity.categoryName }</h3>
						<h3 style="color: #5cbeb6">${boardListSize } </h3>
					</div>
			</c:otherwise>
		</c:choose>


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
							<div id="board--title--img"><div>${board.title }</div></div>
						</c:when>
						<c:otherwise>
							<img class="board--img" src="http://localhost:9999/image/${board.boardImg}">
						</c:otherwise>
					</c:choose>
					<div id="board--title">
						<a href="/board/detail/${board.id }" >${board.title }</a>
						<br>
						<div id="board--createDate">${board.createDate }</div>
					</div>
					
				</div>
			
	</c:forEach>
		</div>

</div>
<br><br><br>

</body>
</html>

<script type="text/javascript" src="/js/category.js"></script>
