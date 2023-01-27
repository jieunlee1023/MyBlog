<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/nav.jsp" %>

<div id="main--body--right">
	<div>
		<div id="board--detail--category">${boardEntity.category.categoryName }</div>
	</div>


	<br>
	<div>
		<div id="board--detail--title">${boardEntity.title }</div>
		<div id="board--detail--mini">
			<div id="board--detail--date">${boardEntity.createDate }</div>
			<span class="board--urlcopy">URL 복사</span> <input type="text"
				value="http://localhost:9999/board/detail/${boardEntity.id }"
				id="urlAddress" style="display: none;">

		</div>
		<hr>
		<c:choose>
			<c:when test="${empty  boardEntity.boardImg}">
				<div id="board--datail--img"></div>
			</c:when>
			<c:otherwise>
				<div id="board--datail--img">
					<img src="http://localhost:9999/image/${boardEntity.boardImg }">
				</div>
			</c:otherwise>
		</c:choose>
	</div>


	<div id="board--datail--content">${boardEntity.content }</div>
	<input type="hidden" value="${boardEntity.id }" id="board--id">
	<div id="board--detail--btn">
		<a id="board--detail--btn--update" href="/board/update/${boardEntity.id }">수정</a>
		<a id="board--detail--btn--delete"  href="/board/delete/${boardEntity.id }">삭제</a>
	</div>

	<div id="board--datail--list">
		<div id="board--datail--list--title">
			<div id="board--datail--list--title--category">'${boardEntity.category.categoryName}'</div>
			<div id="board--datail--list--title--other">카테고리의 다른 글</div>
		</div>
		<div id="board--datail--list--items">
			<div id="board--datail--list--group">
			<c:forEach var="prevNextBoard" items="${prevNextBoards }">
				<c:if test="${prevNextBoard.id != boardEntity.id }">
					<c:choose>
						<c:when test="${ prevNextBoard.id > boardEntity.id}">
							<div id="board--datail--list--group-title">
								<a href="/board/detail/${prevNextBoard.id }" style="width: 500px;">
									∧  ${prevNextBoard.title}
									<span id="board--datail--list--group-count">(${prevNextBoard.reply.size() })</span>
								</a>
								<div id="board--datail--list--group-date-div">
									<span id="board--datail--list--group-date">${prevNextBoard.createDate }</span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						
							<div id="board--datail--list--group-title">
								<a href="/board/detail/${prevNextBoard.id }"  style="width: 500px;">
									∨  ${prevNextBoard.title}
									<span id="board--datail--list--group-count">(${prevNextBoard.reply.size() })</span>
								</a>
								<div id="board--datail--list--group-date-div">
									<span id="board--datail--list--group-date">${prevNextBoard.createDate }</span>
								</div>
							</div>
						
						</c:otherwise>
					</c:choose>

					
				</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	

	<div id="board--datail--reply">
		<div id="board--detail--reply--text">
			댓글 <span>3</span>
		</div>
		<hr style="height: 3px; background: rgb(0, 0, 0, 0.1); border: none;">
		<div id="board--datail--reply--list">
			<div id="board--datail--reply--list--header">
				<div id="board--datail--reply--list--nickAndDate">
					<div id="board--datail--reply--list--nickname">닉네임</div>
					<div id="board--datail--reply--list--date">2023.02.02
						01:01:01</div>
				</div>
				<button type="button" class="category--minus" style="background-color: black;">─</button>
			</div>
			<div id="board--datail--reply--list--content">잘 보고 갑니다</div>
		</div>
	</div>
	<hr style="height: 3px; background: rgb(0, 0, 0, 0.1); border: none;">

<br><br>
	<div id="board--detail--reply--save">
		<div id="board--detail--reply--save--title">
			<input placeholder="이름"> <input placeholder="비밀번호">
		</div >
		<div id="board--detail--reply--save--content">
			<input placeholder="여러분의 소중한 댓글을 입력해주세요">
		</div>
		<div id="board--detail--reply--save--content--btn" >
			<button id="board--detail--reply--save--btn">등록</button>
		</div>
	</div>

	<br> <br> <br> <br> <br> <br> <br> <br>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".board--urlcopy").bind("click", function() {
			let urlAddress = $("#urlAddress");
			urlAddress.css('display', 'block').select();
			document.execCommand("Copy");
			urlAddress.css('display', 'none').select();
			alert("URL 주소가 복사되었습니다.");
			return false;
		});
	})
</script>

</body>
</html>