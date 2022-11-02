<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
  <style type="text/css">
@font-face {
    font-family: 'MonoplexKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_Monoplex-kr@1.0/MonoplexKR-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

h2 {
	background-color: #98fb98;
	color: #DCB9F3;
    font-size: 15px;
    font-weight: normal;
    letter-spacing: 1px;
    font-family: 'MonoplexKR-Regular';
}

</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>${message}</h2>
</body>
</html>