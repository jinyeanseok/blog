<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<html>
<head>
	<title>Home</title>
 
 	<script>
		
 	var result = '${result}'; // 쌍따음표 말고 따음표로 해야 데이터를 가져옴
 	
 	if(result === "loginFalse") {
 		alert("로그인에 실패했습니다.");
 	} else if(result === "updateOK") {
 		alert("회원정보가 변경되었습니다.");
 	} else if(result === "loginOK") {
 		alert("로그인에 성공하였습니다.");
 	} else if(result === "removeOK") {
 		alert("회원 탈퇴를 성공하였습니다.");
 	} else if(result === "registerOK") {
 		alert("회원가입에 성공하였습니다.");
 	} 
 	
 	</script>
</head>


<body>
	
	<c:if test="${user == null}">
	<form method ="post" autocomplete="off" action="/user/login">
		
		<div>
			<label for="identification">아이디</label>
			<input type="text" id="identification" name="identification" />
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password" />
		</div>
		
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
	</c:if>
	
	<c:if test="${user == null}">
	<button type="button" onclick="location.href='/user/register'">회원가입</button>
	</c:if>
	
	<c:if test="${user != null}">
	<div>
	<button type="button" onclick="location.href='/user/logout'">로그아웃</button>
	<button type="button" onclick="location.href='/user/modify'">회원정보 수정</button>
	<button type="button" onclick="location.href='/user/remove'">회원탈퇴</button>
	</div>
	</c:if>
	
	<c:if test="${user != null }">
	<div>
		${user.name} 님 환영합니다.
	</div>
	</c:if>
</body>
</html>