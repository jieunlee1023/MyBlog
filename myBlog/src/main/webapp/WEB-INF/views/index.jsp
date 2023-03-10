<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
<%@include file="layout/nav.jsp"%>

<div id="main--body--right">
	<div id="body--right--top">

		<c:choose>
			<c:when test="${empty categoryEntity }">
				<div id="body--right--title">
					<h3>전체보기</h3>
					<h3 style="color: #5cbeb6">${categoryEntity.board.size() }</h3>
				</div>

			</c:when>
			<c:otherwise>
				<div id="body--right--title">
					<h3>${categoryEntity.categoryName }</h3>
					<h3 style="color: #5cbeb6">${categoryEntity.board.size()}</h3>
				</div>
			</c:otherwise>
		</c:choose>


		<a href="/board/save"><img id="main--right--img"
			src="/images/write.png" alt="글쓰기"></a>

	</div>
	<br>
	<div id="main--board--item">
		<input type="hidden" value="${categoryEntity.board.size()}"	id="board--size">
		
		
		
			
		<c:choose>
			<c:when test="${empty categoryEntity }">
			<c:forEach var="board" items="${boards.content}">
				<div class="main--board--items">
				
				<c:forEach var="oneDayCheck" items="${oneDayCheck }">
				<c:if test="${oneDayCheck.id eq board.id }">
				<img id="new--bedge" src="/images/new.png">
				</c:if>
				</c:forEach>
				
				
				<c:choose>
					<c:when test="${empty board.boardImg }">
						<div id="board--title--img">
							<div>${board.title }</div>
						</div>
					</c:when>
					<c:otherwise>
						<img class="board--img"
							src="http://localhost:9999/image/${board.boardImg}">
					</c:otherwise>
				</c:choose>
				<div id="board--title">
					<a href="/board/detail/${board.id }">${board.title }</a> <br>
					<div id="board--createDate">${board.createDate }</div>
				</div>

			</div>
			</c:forEach>
			</c:when>
			
			<c:otherwise>
			<c:forEach var="board" items="${categoryBoards.content}">
				<div class="main--board--items">
				
				<c:forEach var="oneDayCheck" items="${oneDayCheck }">
				<c:if test="${oneDayCheck.id eq board.id }">
				<img id="new--bedge" src="/images/new.png">
				</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${empty board.boardImg }">
						<div id="board--title--img">
							<div>${board.title }</div>
						</div>
					</c:when>
					<c:otherwise>
						<img class="board--img"
							src="http://localhost:9999/image/${board.boardImg}">
					</c:otherwise>
				</c:choose>
				<div id="board--title">
					<a href="/board/detail/${board.id }">${board.title }</a> <br>
					<div id="board--createDate">${board.createDate }</div>
				</div>

			</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		



	
	</div>

	<!--페이징 처리-->
	
	<c:choose>
		<c:when  test="${board.category.id eq categoryEntity.id  }">
			<div class="page-link">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>

		<div class="${boards.first ? isDisabled : isNotDisabled }">
			<a class="page-item" id="page--previous" href="?page=${boards.number-1}"> ＜ 이전</a>
		</div>
	
	
		<c:forEach var="num" items="${pageNumbers}">
			<c:choose>
				<c:when test="${nowPage eq num }">
					<a class="page-item" href="?page=${num -1}" style="font-weight: bold; color: #07beb8">${num}</a>
				</c:when>
				<c:otherwise>
					<a class="page-item" href="?page=${num -1 }">${num}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<div class="${boards.last ? isDisabled : isNotDisabled }" >
			<a class="page-item"  id="page--next" href="?page=${boards.number+1}">  다음 ＞</a>
		</div>
		
	</div>
		
		</c:when>
		
		
		<c:otherwise>
			
	<c:if test="${categoryBoardsEmpty eq false}">
			<div class="page-link">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotDisabled" value=""></c:set>

		<div class="${categoryBoards.first ? isDisabled : isNotDisabled }">
			<a class="page-item" id="page--previous" href="?page=${categoryBoards.number-1}"> ＜ 이전</a>
		</div>

		<c:forEach var="num" items="${categoryPageNumbers}">
			<c:choose>
				<c:when test="${categoryNowPage eq num }">
					<a class="page-item" href="?page=${num -1}" style="font-weight: bold; color: #07beb8">${num}</a>
				</c:when>
				<c:otherwise>
					<a class="page-item" href="?page=${num -1 }">${num}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<div class="${categoryBoards.last ? isDisabled : isNotDisabled }" >
			<a class="page-item"  id="page--next" href="?page=${categoryBoards.number+1}">  다음 ＞</a>
		</div>
		
	</div>
	</c:if>	
		
		</c:otherwise>
	</c:choose>
	
	<br> <br> <br>
</div>




</body>
</html>

<script type="text/javascript" src="/js/category.js"></script>
