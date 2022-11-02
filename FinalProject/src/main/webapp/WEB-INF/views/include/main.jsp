<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img {
		width: 33%;
	}
</style>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.adminCk == 1}">
<%@ include file="../include/admin_menu.jsp" %>
</c:when>
<c:otherwise>
<%@ include file="../include/menu.jsp" %>
</c:otherwise>
</c:choose>
<img src="${path}/images/니트.jpg">
<img src="${path}/images/후드집업.jpg">
<img src="${path}/images/조거팬츠.jpg">

</body>
</html>