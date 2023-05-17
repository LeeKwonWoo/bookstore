<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<title>Order</title>
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
			<h1 class="display-3">
				주문정보
			</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="order" class="form-horizontal">
			<div class="well col-md-9 col-md-offset-2" style="background:#fafafe; padding:20px">
				<div class="text-center">
					<h1>영수증</h1>
				</div>
				<div class="row">
					<div class="col-md-6">
						<address>
							<strong>배송 주소</strong><br>
							성명 : ${order.shipping.name}<br>
							우편번호 : ${order.shipping.address.zipCode}<br>
							주소 : ${order.shipping.address.addressName} ${order.shipping.address.detailName} ${order.shipping.address.country}<br> 
							
						</address>
					</div>
					<div class="col-md-6 text-right">
						<p><em>배송일: <fmt:formatDate type="date" value="${order.shipping.date}"/></em></p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-9">
						<address>
							<strong>청구주소</strong>
							성명 : ${order.customer.name}<br>
							우편번호 : ${order.customer.address.zipCode}<br>
							주소 : ${order.customer.address.addressName} ${order.customer.address.detailName} ${order.customer.address.country}<br> 
							HP : ${order.customer.phone}<br>
						</address>
					</div>
				</div>
				<div class="row">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>도서</th>
							<th>#<th>
							<th class="text-center">가격</th>
							<th class="text-center">소계</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="cartItem" items="${order.cart.cartItems}">
								<tr>
									<td><em>${cartItem.value.book.name}</em></td>
									<td style="text-ailgn: center">${cartItem.value.quantity}</td>
									<td class="text-center">${cartItem.value.book.unitPrice}</td>
									<td class="text-center">${cartItem.value.totalPrice}원</td>
								</tr>
							</c:forEach>
							<tr>
							<td> </td>
							<td> </td>
							<td class="text-right"><h5><strong>총액: </strong></h5></td>
							<td class="text-center text-danger"><h4><strong>${order.cart.grandTotal}</strong></h4></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"/>
					<button class="btn btn-default" name="_eventId_backToCustomerInfo">이전</button>
					<input type="submit" class="btn btn-primary" value="등록" name="_eventId_customerInfo"/>
					<button class="btn btn-default" name="_eventId_cancel">취소</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>