<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
h2 {
	text-align: center;
	margin: 2%;
}
table {
	text-align: center;
	width: 100%;
}
</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>주문내역</h2>
<table  class="table table-hover">
<thead class="table-dark">
<tr>
	<th>주문번호</th>
	<th>이미지</th>
	<th>상품정보</th>
	<th>수량</th>
	<th>주문 상태</th>
	<th>운송장</th>
</tr>
</thead>
<tbody>
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.order_id}</td>
	<td><img src="${path}/images/${row.picture_url}" 
		width="100px" height="100px"></td>
	<td>${row.product_name}</td>
	<td>${row.order_amount}</td>
	<td>
	<c:if test="${row.delivery_status == null }">
	주문완료
	</c:if>
	<c:if test="${row.delivery_status == 'shipping'}">
	배송중<br>
	<button class="btn btn-outline-dark flex-shrink-0" onclick="location='${path}/shop/detail/change.do?order_id=${row.order_id}'">배송완료</button>
	</c:if>
	<c:if test="${row.delivery_status == 'complete'}">
	배송완료
	</c:if>
	</td>
	<form name="form1" method="post" action="${path}/shop/detail/add.do">
	<td>
	<c:if test="${row.trackingNum == null}">
	운송장번호 : <input name="trackingNum" id="trackingNum"><input type="submit" value="변경">
	</c:if>
	<c:if test="${row.trackingNum != null}">
	운송장번호 : ${row.trackingNum}
	</c:if>
	</td>
	<input type="hidden" name="order_id" value="${row.order_id}">
	</form>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>