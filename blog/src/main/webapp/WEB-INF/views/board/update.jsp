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
	<form method="post">
		<div>글번호 : ${BoardVO.board_number}</div>
		<input type="hidden" name="board_number" value="${BoardVO.board_number}"/>
		<div>
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${BoardVO.title}"/>		
			</div>
			
			<div>
				<label for="contents">내용</label>
				<textarea name="contents" id="contents" rows="3">${BoardVO.contents}</textarea>		
			</div>
			
			<div>
				<label for="name">작성자</label>
				<input type="text" name="name" id="name" value="${BoardVO.name}" readonly="readonly"/>		
			</div>
		</div>
		
		<div>
			<button type="submit">등록</button>
			<button><a href="/board/read?board_number=${BoardVO.board_number}">취소</a></button>
		</div>
	</form>
</body>
</html>