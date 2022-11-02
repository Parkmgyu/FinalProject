<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script async src="//cfa-js.cafe24.com/cfa.js?v=1666327917646"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#btnUpdate")
				.click(
						function() {
							//회원정보 수정으로 이동
							location.href = "${path}/member/view.do?userid=${sessionScope.userid}";

						});
		$("#btnOrderlist").click(function() {
			//주문목록으로 이동
			location.href = "${path}/shop/order/list.do";

		});
	});
</script>
<style type="text/css">
.main {
	width: 100%;
	margin-top: 50px;
	margin-bottom: 30px;
}

.main h2 {
	clear: both;
	width: 218px;
	margin: auto;
	text-align: center;
	border: 1px solid #e5e5e5;
	height: 30px;
	line-height: 30px;
}

.main span {
	color: #000;
	font-size: 11px;
	font-weight: normal;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	display: block;
}

.info {
	overflow: hidden;
	margin: 0 0 10px;
	padding: 20px;
	width: 100%;
	border: 0px solid #d7d7d7;
	background: #fff;
}

.info .myInfo {
	float: left;
	width: 100%;
	padding: 0 0 0 10px;
	font-size: 11px;
}

.myshop-box {
	clear: both;
	overflow: hidden;
	padding: 15px 40px 15px 40px;
	border: 1px solid #d7d7d7;
	background: #fff;
	width: 1000px;
	height: 220px;
	margin: auto;
}

.myshop-box li {
	display: inline-block;
	position: relative;
	overflow: hidden;
	width: 90%;
	margin: 0 0 0 0;
	font-size: 11px;
	line-height: 24px;
	vertical-align: top;
}

.myshop-box li .title {
	float: left;
	width: 30%;
	padding: 0 0 0 0;
	font-weight: normal;
}

.myshop-box li .data {
	float: right;
	width: 30%;
	padding: 0 0 0 0px;
	text-align: right;
	color: #d7d7d7;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.recent-box {
	clear: both;
	overflow: hidden;
	padding: 15px 40px 15px 40px;
	border: 1px solid #d7d7d7;
	background: #fff;
	width: 1000px;
	height: 220px;
	margin: auto;
}

.center-box {
	clear: both;
	overflow: hidden;
	padding: 0px 40px 15px 0px;
	background: #fff;
	width: 1000px;
	height: 220px;
	margin: auto;
}

.up {
	text-align: center;
	padding: 100px 0;
}

.center-box .cart {
	color: #000;
	font-size: 30px;
	font-weight: bolder;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	text-align: center;
	padding: 115px;
}

.center-box .wishlist {
	color: #000;
	font-size: 30px;
	font-weight: bolder;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	text-align: center;
	padding: 85px;
}

.center-box .notice {
	color: #000;
	font-size: 30px;
	font-weight: bolder;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	text-align: center;
	padding: 100px;
}

.center-box p {
	color: #000;
	font-size: 12px;
	font-weight: bolder;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	text-align: center;
}

.center-box span {
	color: #000;
	font-size: 11px;
	font-weight: normal;
	letter-spacing: 1px;
	font-family: 'Arial', '돋움', 'Dotum', sans-serif;
	text-align: center;
	padding: 90px 0;
}

tr, td, th {
	border: none;
	font-size: 11px;
	font-weight: normal;
}

footer#footer {
	background: #eee;
	padding: 2%;
}

footer#footer {
	margin-top: 100px;
	border-radius: 50px 50px 0 0;
}

footer#footer div#footer_box {
	padding: 0 20px;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<div class="main">
		<h2>
			<span>MY PAGE</span>
		</h2>
	</div>



	<div class="info">
		<div class="myInfo">
			<p align="center">
				<strong style="font-weight: bold;">${dto.name}(ID:${dto.userid})</strong>
				님 안녕하세요 ! 저희 쇼핑몰을 이용해주셔서 감사합니다 !
			</p>
		</div>
	</div>

	<div class="myshop-box">
		<div style="display: flex; flex-direction: row; height: 180px;">
			<div
				style="flex-grow: 1; width: 50%; border-right: 1px solid #d7d7d7;">
				<ul>
					<li><strong class="Info" style="font-weight: bold;">내정보</strong>
						<strong class="data"></strong></li>
					<li><strong class="title">email</strong> <strong class="data">${dto.email}</strong>
					</li>
					<li><strong class="title">주소</strong> <strong class="data">${dto.zipcode}</strong>
					</li>
					<li><strong class="title"></strong> <strong class="data">${dto.address1}</strong>
					</li>
					<li><strong class="title"></strong> <strong class="data">${dto.address2}</strong>
					</li>
					<li><button type="button" id="btnUpdate">정보 수정 및 삭제</button></li>
				</ul>

			</div>
			<div style="flex-grow: 1;">
				<ul>
					<li><strong class="Info" style="font-weight: bold;">나의
							주문 상태</strong> <strong class="data"></strong></li>
					<li><strong class="title">주문완료</strong> <strong class="data">${myorderCnt.suc_cnt}
							건</strong></li>
					<li><strong class="title">배송중</strong> <strong class="data">${myorderCnt.shipping_cnt}
							건</strong></li>
					<li><strong class="title">배송완료</strong> <strong class="data">${myorderCnt.complete_cnt}
							건</strong></li>
					<li><strong class="title">주문취소</strong> <strong class="data">${myorderCnt.cancel_cnt}
							건</strong></li>
					<li><strong class="title"></strong> <strong class="data"></strong>
					</li>
					<li><button type="button" id="btnOrderlist">주문 목록 보기</button>
					</li>
				</ul>

			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="center-box">
		<div style="display: flex; flex-direction: row; height: 180px;">
			<div style="flex-grow: 1; width: 33%; border-right: 1px solid #d7d7d7;">
				<div style="display: flex; flex-direction: column; height: 180px;">
					<div style="flex-grow: 1; width1: 50%; padding-top: 60px;">
						<a href="${path}/shop/cart/list.do" class="cart">CART</a></div>
					<div style="flex-grow: 1;"><p>장바구니</p></div>
				</div>
			</div>

			<div style="flex-grow: 1; width: 33%; border-right: 1px solid #d7d7d7;">
				<div style="display: flex; flex-direction: column; height: 180px;">
					<div style="flex-grow: 1; width1: 50%; padding-top: 60px;">
						<a href="${path}/shop/wish/list.do" class="wishlist">WISHLIST</a></div>
					<div style="flex-grow: 1;"><p>관심상품</p></div>
				</div>
			</div>
			<div style="flex-grow: 1; width: 33%;">
				<div style="display: flex; flex-direction: column; height: 180px;">
					<div style="flex-grow: 1; width1: 50%; padding-top: 60px;">
						<a href="#" class="notice">NOTICE</a></div>
					<div style="flex-grow: 1;"><p>공지사항</p></div>
				</div>
			</div>
			
		</div>
 </div>

	<br>
	<br>
	<div class="recent-box">
		<h3 style="font-size: 11px; color: #7d7d7d;">
			<strong
				style="font-weight: bolder; font-size: 18px; font-family: 'Arial', '돋움', 'Dotum', sans-serif; color: #7d7d7d;">product</strong>
			최근 본 상품
		</h3>
		<p>

			<c:choose>
				<c:when test="${list == null}">
				최근 본 상품이 없습니다. 
			</c:when>
				<c:otherwise>
					<table border="0" cellspacing="1" cellpadding="3"
						style="width: 100%; text-align: center;">
						<tr>
							<c:forEach var="rcp" items="${list}">
								<td><img src="${path}/images/${rcp.picture_url}"
									width="100px" height="100px"></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="rcp" items="${list}">
								<td><a href="${path}/shop/product/detail/${rcp.product_id}">${rcp.product_name}</a>
								</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="rcp" items="${list}">
								<td>가격 : ${rcp.price}</td>
							</c:forEach>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
		</p>
	</div>
</body>
<footer id="footer">

	<div id="footer_box">
		<%@ include file="../include/footer.jsp"%>
	</div>

</footer>

</html>