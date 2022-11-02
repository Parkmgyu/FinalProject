<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
@font-face {
    font-family: 'MonoplexKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_Monoplex-kr@1.0/MonoplexKR-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: 'SANGJUGyeongcheonIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/SANGJUGyeongcheonIsland.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


#member{
	background-color: #98fb98;
    font-size: 15px;
    font-weight: normal;
    letter-spacing: 1px;
	font-family: 'MonoplexKR-Regular';
}

.title {
	font-family: 'SANGJUGyeongcheonIsland';
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;" id="member">
<br>
<h1 class="title">
	BAON
</h1>
<br>
	<a href="${path}/" class="btn btn-success">Home</a> |
	<a href="${path}/review/list.do" class="btn btn-success">후기</a> |
	<a href="${path}/notice/list.do" class="btn btn-success">공지사항</a> |
	<a href="${path}/question/list.do" class="btn btn-success">질문</a> |
	<a href="${path}/shop/product/list.do" class="btn btn-success">상품목록</a>
	<c:if test="${sessionScope.userid != null}">
	<a href="${path}/shop/order/list.do" class="btn btn-success">주문내역</a> |
	 <a href="${path}/shop/cart/list.do" class="btn btn-success">장바구니</a> |
	 <a href="${path}/shop/wish/list.do" class="btn btn-success">관심상품</a> 
	</c:if>
	
	<div style="text-align: right;">
	 <c:choose>
	   <c:when test="${sessionScope.userid == null }">
	     <!-- 로그인하지 않은  상태 -->
	     <a href="${path}/member/write.do" class="btn btn-success">회원가입</a> |
	     <a href="${path}/member/login.do" class="btn btn-success">로그인</a>&nbsp
	   </c:when>
	   <c:otherwise>
	     <!-- 로그인한 상태 -->
	     ${sessionScope.name}님이 로그인 중입니다.
	     <a href="${path}/member/myPage.do?userid=${sessionScope.userid}" class="btn btn-success">마이페이지</a> |
	     <a href="${path}/member/logout.do" class="btn btn-success">로그아웃</a>&nbsp
	   </c:otherwise>
	 </c:choose>
  </div>
</div>
<hr>
