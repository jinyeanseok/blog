<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>게시판</title> 
</head>
<body>

<form method="post" autocomplete="off">
 	
 	<div>
 		<label for="identification">아이디</label>
 		<input type="text" id="identification" name="identification" />
 	</div>
 	
 	<div>
 		<label for="password">비밀번호</label>
 		<input type="password" id="password" name="password" />
 	</div>
 	
 	<div>
 		<label for="name">이름</label>
 		<input type="text" id="name" name="name" />
 	</div>
 	
 	<div>
 		<button type="submit">가입</button>
 	</div>
 	
</form>

	<div>
		<button onclick ="location.href='/'">처음</button>
	</div>
</body>
</html>