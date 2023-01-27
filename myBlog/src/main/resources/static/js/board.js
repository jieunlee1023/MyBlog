let boardInit = {
	init: function() {
		$("#board--detail--btn--update").bind("click", () => {
			location.href = "/board/update/" + $('#board--id').val();
		});
		$("#board--detail--btn--delete").bind("click", () => {
			this.delete();
		});

	},

	update: function() {
		let boardId = $("#board--id").val();
		let sendData = {
			id: boardId,
			title: $('#title').val(),
			content: $('#content').val()
		}

		$.ajax({
			type: 'PUT',
			url: '/api/board/update/' + boardId,
			data: JSON.stringify(sendData),
			contentType: "application/json;charset=UTF-8",
			dataType: "json"
		}).done(function(data, textStatus, xhr) {
			alert("글 수정 완료");
			console.log(data);
			location.href = "/board/list"
		}).fail(function(error) {
			console.log(error);
			alert("글 수정 실패");
		});

	},

}

boardInit.init();


$("#board--img--save").bind('change', function() {
	var fileName = $("#board--img--save").val().split("\\").pop();;
	var idxDot = fileName.lastIndexOf(".") + 1;
	var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
	if (extFile != "jpg" && extFile != "jpeg" && extFile != "png") {
		alert("이미지 확장자는 png / jpg / jpeg 만 등록 가능합니다!");
	} else {
		$(".board--upload-name").val(fileName);
		$("#board--trashcan--img")[0].style.display = 'block';

		$("#board--trashcan--img").bind("click", function() {
			$("#board--img--save").val(null);
			$(".board--upload-name").val("");
			$("#board--trashcan--img")[0].style.display = 'none';
		});

	}
});


function trashcan() {
	$("#board--img--save").val(null);
	$(".board--upload-name").val("");
	$("#board--trashcan--img")[0].style.display = 'none';
	
}