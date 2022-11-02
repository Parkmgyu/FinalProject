<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#chart_div{
	color: #000;
    font-size: 11px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'Arial','돋움','Dotum',sans-serif;

}

#admin {
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
<div style="text-align: center;" id="admin">
<br>
<h1 class="title">
	BAON
</h1>
<br>
	<a href="${path}/member/main.do" class="btn btn-success">Home</a> | 
	<a href="${path}/admin/write.do" class="btn btn-success">상품등록</a> | 
	<a href="${path}/admin/list.do" class="btn btn-success">상품목록</a> | 
	<a href="${path}/member/list.do" class="btn btn-success">회원목록</a> |
	<a href="${path}/shop/detail/list.do" class="btn btn-success">주문관리</a> |
	<a href="${path}/sell/chart.do" class="btn btn-success">판매통계</a> |
	<a href="${path}/receipt/list.do" class="btn btn-success">회원구매내역</a>
	<div style="text-align: right;">
		<c:choose>
			<c:when test="${sessionScope.name == 'null' }">
				<!-- 로그인하지 않은 상태 -->
				<a href="${path}/member/write.do" class="btn btn-success">회원가입</a> |
	     		<a href="${path}/member/login.do" class="btn btn-success">일반 로그인</a> |
	   </c:when>
			<c:otherwise>
				<!-- 로그인한 상태 -->
	     ${sessionScope.name}님이 로그인 중입니다.
	     <a href="${path}/member/logout.do" class="btn btn-success">로그아웃</a>&nbsp
	   </c:otherwise>
		</c:choose>
	</div>
</div>
<hr>
