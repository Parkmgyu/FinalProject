<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
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
			section#content { float:right; width:90%; padding-left: 10px;}
			aside#aside { float:left; width:10%;}
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:2%; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center;}
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
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
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.picture_url img { padding:10px; width:200px; height:auto; }
 section#content div.product_name { padding:10px 0; text-align:center; }
 section#content div.product_name a { color:#000; }
 section#content div.price { padding:10px 0; text-align:center; }
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
		
			<ul>
			
			   <c:forEach var="row" items="${list}">
			   
			   <li>
			    <div class="picture_url">
			    	<a href="${path}/shop/product/detail/${row.product_id}"><img src="${path}/images/${row.picture_url}"></a>
			    </div>   
			    <div class="product_name">
			    	 <a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a>
			   		<!-- 관리자에게만 편집 버튼 표시 -->
					<c:if test="${sessionScope.admin_userid != null}">
					<br>
					<a href="${path}/shop/product/edit/${row.product_id}">[편집]</a>
					</c:if>
			    </div>
			    <div class="price">
			    	<fmt:formatNumber value="${row.price}"
					pattern="#,###" />
			    </div>
			   </li>
			   </c:forEach>
		
			</ul>
			
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
