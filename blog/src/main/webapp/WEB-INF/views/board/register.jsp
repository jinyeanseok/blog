<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
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
				<label for="name">작성자</label>
				<input type="text" name="name" id="name"/>		
			</div>
		</div>
		
		<div>
			<button type="submit">등록</button>
		</div>
		
	</form>
</body>
</html>