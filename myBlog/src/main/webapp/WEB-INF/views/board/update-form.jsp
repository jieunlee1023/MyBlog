<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<div id="category--option">
	<select id="category--select" name="category">
		<c:forEach var="category" items="${categories }">
			<c:choose>
				<c:when test="${boardEntity.category.id eq category.id }">
					<option value="${category.id }" selected>${category.categoryName }</option>
				</c:when>
				<c:otherwise>
					<option value="${category.id }">${category.categoryName }</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</select>
</div>

<form action="/" method="post" enctype="multipart/form-data" id="write--form">
	<input type="hidden" value="" id="categoryId" name="catagory">
	<input type="hidden" value="${boardEntity.id }" id="boardId" name="boardId">
	<div id="board--write">
		<div>
			<input id="board--write--title" type="text" value="${boardEntity.title }"
				required name="title">
		</div>
		<div>
			<div style="display: flex;">
				<label for="board--img--save" id="board--img--save--label">메인 이미지등록</label>
				 <input type="file" id="board--img--save" name="file"> 
				 <input class="board--upload-name" readonly value="${boardEntity.boardImg }"> 
				 <c:choose>
				 	<c:when test="${empty boardEntity.boardImg}">
					 <img src="/images/trashcan.png" id="board--trashcan--img" alt="휴지통"
						style="display: none;">
				 	</c:when>
				 	<c:otherwise>
					 <img src="/images/trashcan.png" id="board--trashcan--img" alt="휴지통"
						style="display: block;" onclick="trashcan();">
				 	</c:otherwise>
				 </c:choose>
			</div>
		</div>
		<br>
		
		<textarea id="summernote" name="content">${boardEntity.content }</textarea>
	</div>
	<div id="board--write--btn">
		<button id="board--write--cancel" type="button"
			onclick="history.back();">취소</button>
		<button id="board--write--update" type="button" onclick="category()">수정</button>
	</div>
</form>

<br>
<br>
<br>
<script>
	$('#summernote').summernote({
		placeholder : "",
		tabsize : 3,
		height : 500,

	});

	function category() {
		if ($("#category--select").val() == null) {
			alert("게시할 카테고리를 선택해주세요!");
		} else {
			$('#board--write--update').prop("type", "submit");
			$('#categoryId').prop("value", $("#category--select").val());
			$('#write--form').prop("action", "/board/update/"+$("#boardId").val()+"/"+$("#category--select").val());
		}
	}
	
	
</script>

<script type="text/javascript" src="/js/board.js"></script>
</body>
</html>