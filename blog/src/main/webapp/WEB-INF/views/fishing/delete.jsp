<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<br />
	<br />
	<br />
	<a href="/fishing/listPage"><h1 align="center">게시글 삭제</h1><hr /></a>
	
		
	<div class="container">
		<form method="post">
			<div>글번호 : ${BoardVO.board_number}</div>
			<br />
			<input type="hidden" name="board_number" value="${BoardVO.board_number}"/>
			
			<!-- page와 perPageNum  추가 -->
			<input type="hidden" name="page" value="${cri.page}" />
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
			
			<div>
				<div>
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" name="title" value="${BoardVO.title}" readonly/>		
				</div>
				
				<div>
					<label for="contents">내용</label>
					<textarea name="contents" class="form-control" id="contents" rows="3" readonly>${BoardVO.contents}</textarea>		
				</div>
				
				<div>
					<label for="name">작성자</label>
					<input type="text" class="form-control" name="name" id="name" value="${BoardVO.name}" readonly="readonly"/>		
				</div>
			</div>
			
			<br />
			
			<div>
				<button type="submit" class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-info" onclick="history.back()">취소</button>
			</div>
		</form>
		
		
	</div>
</body>
</html>