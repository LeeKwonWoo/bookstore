<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/controllers.js"></script>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>

	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./home">Home</a>
			</div>
		</div>
	</nav>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	
	<div class="container">
		<div>
			<a href="#" class="btn btn-success float-right">주문하기</a>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
			<tr>
				<th>도서</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<form:form name="removeForm" method="put">
				<c:forEach items="${cart.cartItems}" var="item">
					<tr>
						<td>${item.value.book.bookId}-${item.value.book.name}</td>
						<td>${item.value.book.unitPrice}</td>
						<td>${item.value.book.quantity}</td>
						<td>${item.value.book.totalPrice}</td>
					</tr>
				</c:forEach>	
			</form:form>
			
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th>${cart.grandTotal}</th>
				<th></th>
			</tr>
			</table>
			<a href="<c:url value="/books"/>" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
		<footer>
			<p>&copy; BookMarket</p>
		</footer>
	</div>
</body>
</html>