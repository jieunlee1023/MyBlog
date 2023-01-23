
var target = document.querySelectorAll('.popup--open');
var btnPopClose = document.querySelectorAll('.popup--wrap .popup-cancel');
var targetID;

// 팝업 열기
for (var i = 0; i < target.length; i++) {
	target[i].addEventListener('click', function() {
		targetID = this.getAttribute('href');
		document.querySelector(targetID).style.display = 'block';

		$("#img--save").bind('change', function() {
			var fileName = $("#img--save").val();
			var idxDot = fileName.lastIndexOf(".") + 1;
			var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
			if (extFile != "jpg" && extFile != "jpeg" && extFile != "png") {
				alert("이미지 확장자는 png / jpg / jpeg 만 등록 가능합니다!");
			} else {
				$(".upload-name").val(fileName);
			}
		});

	});
}


// 팝업 닫기
for (var j = 0; j < target.length; j++) {
	btnPopClose[j].addEventListener('click', function() {
		this.parentNode.parentNode.style.display = 'none';
	});
}


