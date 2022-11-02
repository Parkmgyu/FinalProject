<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/shop/cart_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnList").click(function(){
		//상품 목록으로 이동
		location.href="${path}/shop/product/list.do";
		
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/shop/wish/deleteAll.do";
			
		}
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
    font-family: 'Arial','돋움','Dotum',sans-serif;
    display: block;
}

td, th, tr {
	color: #000;
    font-size: 11px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'Arial','돋움','Dotum',sans-serif;

}

p {
	color: #000;
    font-size: 11px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'Arial','돋움','Dotum',sans-serif;
    
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
<%@ include file="../include/menu.jsp" %>
 <div class="main">
<h2><span>WISHLIST</span></h2>
</div>
<div style="display: flex; justify-content: center; align-items: center;">

<c:choose>
	<c:when test="${list.isEmpty()}">
		위시리스트가 비었습니다. <br>
	</c:when>
	<c:otherwise>
		<form name="form1" method="post" 
			action="${path}/shop/wish/list.do">
			<table style="width: 600px; height:300px; margin-left: auto; margin-right: auto;" border="0" cellspacing="1" cellpadding="3">
				
			<c:forEach var="row" items="${list}">
				<tr>
					<td><img src="${path}/images/${row.picture_url}"
					width="100px" height="100px"></td>
					<td>${row.product_name}</td>
					<td>${row.price} 원</td>
					<td>
        <c:if test="${sessionScope.userid != null}">
		     <a href="${path}/shop/wish/delete.do?product_id=${row.product_id}">
           삭제</a>
         </c:if>          
           	</td>
           	<td>
         <c:if test="${sessionScope.userid != null}">
			<a href="${path}/shop/wish/cartinsert.do?product_id=${row.product_id}">
           장바구니로 이동</a>
        </c:if>					
					</td> 
				</tr> 
			</c:forEach>
				<tr>

				</tr>
			</table>
			
			<button type="button" id="btnDelete">위시리스트 비우기</button>
		</form>
	</c:otherwise>
</c:choose>
</div>
<br>
<br>

<div style="display: flex; justify-content: center; align-items: center;">
<button type="button" id="btnList">상품목록</button>
</div>



</body>

<footer id="footer">

	<div id="footer_box">
		<%@ include file="../include/footer.jsp"%>
	</div>

</footer>
</html>
				