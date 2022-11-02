<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:100%; margin:0 auto; }
		header#header {}
		nav#nav {}
		section#container { }
			section#content { float:right; width:90%; padding-left: 10%;}
			aside#aside { float:left; width:10%; }
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:2%; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center; }
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px;  text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }
		
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:#000; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:180px; }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
	</style>
	<style>
		div.goods div.goodsImg { float:left; width:350px; }
		div.goods div.goodsImg img { width:350px; height:auto; }
		
		div.goods div.goodsInfo { float:right; width:50%; font-size:22px; }
		div.goods div.goodsInfo p { margin:0 0 20px 0; }
		div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; } 
		
		
		div.goods div.goodsInfo p.addToCart input { font-size:22px; padding:5px 15px; margin-top: 20px; border:1px solid #eee; background:#eee;}
		div.goods div.goodsInfo p.addWishlist input { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
	</style>	

</head>
<body>

<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/menu.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<div id="container_box">
			<section id="content">

<div class="goods">
					<div class="goodsImg">
						<img src="${path}/images/${dto.picture_url}">
					</div>
					
					<div class="goodsInfo">
						<p class="gdsName"><span>상품명</span>${dto.product_name}</p>
						
						<p class="gdsPrice">
							<span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${dto.price}" /> 
						</p>	
				
				
				<form name="form1" method="post"
							action="${path}/shop/cart/insert.do">
							<input type="hidden" name="product_id"
								value="${dto.product_id}">
							<select name="amount">
								<c:forEach begin="1" end="10" var="i"><!--상품갯수 선택 (1~10개)-->
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<p class="addToCart"><input type="submit" value="장바구니에 담기"></p>
						</form>
					<c:if test="${sessionScope.admin_userid == null}">
						<br>
						
						<form name="form2" method="post" action="${path}/shop/wish/insert.do">
							<input type="hidden" name="product_id"
								value="${dto.product_id}">
							<p class="addWishlist"><input type="submit" value="찜하기">
						</form>		
					<p class="addWishlist"><input type="button" value="찜목록" 
						onclick="location.href='${path}/shop/wish/list.do'"></p>
						
					</c:if>	

					</div>
						<div class="gdsDes">${dto.description}</div>
</div>
</section>
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>

</body>
</html>
						