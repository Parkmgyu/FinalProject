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
<%@ include file="../include/menu.jsp" %>
<h2>주문조회</h2>
<table class="table">
<thead class="table-dark">
<tr>
<th>주문번호</th>
<th>이미지</th>
<th>상품정보</th>
<th>수량</th>
<th>주문처리상태</th>
<th>운송장</th>
</tr>
</thead>
<tbody>
<c:forEach var="row" items="${list}">
<tr>
<td>${row.order_id}</td>
<td><img src="${path}/images/${row.picture_url}"
	width="100px" height="100px"></td>
<td><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a></td>
<td>${row.order_amount}</td>
<td>
<c:if test="${row.delivery_status == null }">
	주문완료
	<button onclick="location='${path}/shop/order/cancel.do?order_id=${row.order_id}'">주문취소</button>
	</c:if>
	<c:if test="${row.delivery_status == 'shipping'}">
	배송중
	</c:if>
	<c:if test="${row.delivery_status == 'complete'}">
	배송완료
	</c:if>
	<c:if test="${row.delivery_status == 'cancel'}">
	취소완료
	</c:if>
</td>
<td>
<c:if test="${row.trackingNum == null}">
-
	</c:if>
<c:if test="${row.trackingNum != null}">
	운송장번호 : ${row.trackingNum}
	</c:if>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>