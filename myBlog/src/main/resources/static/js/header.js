
var target = document.querySelectorAll('.popup--open');
var btnPopClose = document.querySelectorAll('.popup--wrap .popup-cancel');
var targetID;

// 팝업 열기
for (var i = 0; i < target.length; i++) {
	target[i].addEventListener('click', function() {
		targetID = this.getAttribute('href');
		document.querySelector(targetID).style.display = 'block';

		$("#img--save").bind('change', function() {
			var fileName = $("#img--save").val().split("\\").pop();;
			var idxDot = fileName.lastIndexOf(".") + 1;
			var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
			if (extFile != "jpg" && extFile != "jpeg" && extFile != "png") {
				alert("이미지 확장자는 png / jpg / jpeg 만 등록 가능합니다!");
			} else {
				$(".upload-name").val(fileName);
				$("#trashcan--img")[0].style.display = 'block';

				$("#trashcan--img").bind("click", function() {
					$("#img--save").val(null);
					$(".upload-name").val("");
					$("#trashcan--img")[0].style.display = 'none';
				});

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

// 특수문자 입력 불가
function characterCheck(obj) {
	var characterKey = /[~!@#$%^&*()_+|<>?:{}]/;
	if (characterKey.test(obj.value)) {
		alert("블로그명을 정확히 입력 해주세요. \n특수문자는 입력하실수 없습니다.");
		obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
	}
	if (obj.value.length > 25) {
		alert("블로그명을 정확히 입력 해주세요. \n블로그명은 최대 25자 이내로 입력 가능합니다.");
	}
}

function socialCheck(obj) {
	var characterKey = /[~!@#$%^&*()+|<>?:{}]/;
	var koreaKey = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크


	if (characterKey.test(obj.value) || koreaKey.test(obj.value)) {
		alert("SNS ID을 정확히 입력 해주세요. \n영어, 숫자, 언더바(_)만 입력 가능합니다.");
		obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
	}

}




