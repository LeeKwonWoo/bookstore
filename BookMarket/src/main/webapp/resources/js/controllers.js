function addToCart(action) {
	document.addForm.action = action;
	document.addForm.submit();
	alert("도서가 장바구니에 추가되었습니다!");
}

function removeCart(action) {
	document.removeForm.action = action;
	document.removeForm.submit();
	window.location.reload();
}

function clearCart() {
	document.clearform.submit();
	window.location.reload();
}