let reply = {
	init: function() {
		$("#board--detail--reply--save--btn").bind("click", () => {
			this.replySave();
		});
	},

	replySave: function() {
		let boardId = $("#board--id").val();
		let sendData = {
			replyName: $('#reply--Name').val(),
			content: $('#reply--content').val(),
			password: $('#reply--password').val()
		}

		$.ajax({
			type: 'POST',
			url: '/api/board/reply/save/' + boardId,
			data: JSON.stringify(sendData),
			contentType: "application/json;charset=UTF-8",
			dataType: "json"
		}).done(function(data, textStatus, xhr) {
			alert(data.body);
			location.href = `/board/detail/${boardId}`
		}).fail(function(error) {
			alert("댓글 작성 실패!");
		});

	},

}

reply.init();



function replyCheck(obj) {
	var characterKey = /[~!@#$%^&*()_+|<>?:{}]/;
	if (characterKey.test(obj.value)) {
		alert("한글 / 숫자 / 영어만 입력 가능합니다.");
		obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
	}
}
var i = 0;
function replyPassword() {

	$('.board--password')[i].style.display = 'inline';
	i++;

}