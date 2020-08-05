<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	
	<c:if test="${result == null}"> <!-- controller에서 loginFalse를 넘겼기 떄문에 loginfalse가 아닌 값은 정상적으로 로그인 된것임 -->
	<form method="post">
		<div>
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요."/>		
			</div>
			
			<div>
				<label for="contents">내용</label>
				<textarea name="contents" id="contents" rows="3" placeholder="내용을 입력하세요."></textarea>		
			</div>
			
			<div>
				<label for="identification">아이디</label>
				<input type="text" name="identification" id="identification" value="${user.identification}" readonly="readonly" required/>		
			</div>
			
			<div>
				<label for="name">작성자</label>
				<input type="text" name="name" id="name" value="${user.name}" readonly="readonly" required/>		
			</div>
			
			
		</div>
		
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
	</c:if>
</body>
</html>