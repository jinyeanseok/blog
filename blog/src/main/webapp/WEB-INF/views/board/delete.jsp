<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

</head>
<body>
	<div>글번호 : ${BoardVO.board_number}</div>
	<br/>
	정말로 삭제하시겠습니까?
	<br />
	
	<div>
		<form method="post">
			<a><button type="submit">예 삭제합니다</button></a>
		</form>
		<button><a href="/board/read?board_number=${BoardVO.board_number}">취소</a></button>	
	</div>
	
</body>
</html>