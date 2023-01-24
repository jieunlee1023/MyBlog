
var target = document.querySelectorAll('.popup--cateogry--open');
var btnPopClose = document.querySelectorAll('.popup--category--wrap .popup-category-cancel');
var targetID;
var count = 1;


// 팝업 열기
for (var i = 0; i < target.length; i++) {
	target[i].addEventListener('click', function() {
		targetID = this.getAttribute('href');
		document.querySelector(targetID).style.display = 'block';

		$("#category--add").bind("click", function() {
			if (count < 20) {
				count++;
				$('#category-index').append(
					'<input type="text" id="category--input"onkeyup="characterCheck(this);" name="categoryName"> ' +
					'<button type="button" class="category--minus" ' +
					' onclick="deleteIndex(this);"> ─ </button><br><br>'
				);
			} else {
				alert("카테고리는 최대 20개 까지만 설정 가능합니다.");
			}
		});


	});
}
function deleteIndex(element) {
	if (count == 1) {
		alert("카테고리는 최소 1개 이상이어야합니다.");
	} else {
		$(element).prev().remove();
		$(element).next().remove();
		$(element).next().remove();
		$(element).remove();
		count--;
	}
}

function characterCheck(obj) {
	if (obj.value.length > 20) {
		alert("카테고리명은 최대 20자 이내로 입력 가능합니다.");
	}
}

// 팝업 닫기
for (var j = 0; j < target.length; j++) {
	btnPopClose[j].addEventListener('click', function() {
		this.parentNode.parentNode.style.display = 'none';
		location.href = "/";
	});
}
