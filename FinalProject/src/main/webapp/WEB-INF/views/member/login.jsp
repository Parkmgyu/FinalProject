<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

.body {
	margin: 0;
	padding: 0;
	height: 100vh;
}

.login {
	font-family: 'Noto Sans KR', sans-serif;
	width: 300px;
	padding: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.login input[type="text"], .login input[type="password"] {
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	border-radius: 24px;
}

.login input[type="button"] {
	border: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	cursor: pointer;
}
</style>
<script>
$(function(){
	$("#btnLogin").click(function(){
		var userid=$("#userid").val(); //태그의 value 속성값
		var passwd=$("#passwd").val();
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus(); //입력 포커스 이동
			return; //함수 종료
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		//폼 데이터를 서버로 제출
		document.form1.action="${path}/member/login_check.do";
		document.form1.submit();
	});
});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<form name="form1" method="post" class="login">




		<input type="text" name="userid" id="userid" placeholder="Userid">


		<input type="password" name="passwd" id="passwd"
			placeholder="Password"> <input type="button" id="btnLogin"
			value="Login">

		<c:if test="${param.message == 'nologin' }">
			<div style="color: red;">로그인 하신 후 사용하세요.</div>
		</c:if>
		<c:if test="${message == 'error' }">
			<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
		<c:if test="${message == 'logout' }">
			<div style="color: blue;">로그아웃 처리되었습니다.</div>
		</c:if>
	</form>
</body>

</html>
