<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

	<script>
		var result = '${result}';
		if(result === 'updateOK') {
			alert("수정되었습니다.");
		}
	</script>
	
</head>
<body>
	
		<div>글번호 : ${BoardVO.board_number}</div>
	
		<div>
			<button><a href="/board/listPage${cri.makeQuery()}" class="btn btn-primary">목록</a></button>
			<button><a href="/board/update${cri.makeQuery()}&board_number=${BoardVO.board_number}" class="btn btn-warning">수정</a></button>
			<button><a href="/board/delete?board_number=${BoardVO.board_number}">삭제</a></button>
			
		</div>
		
		<div>
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${BoardVO.title}" readonly="readonly"/>		
			</div>
			
			<div>
				<label for="contents">내용</label>
				<textarea name="contents" id="contents" rows="3" readonly="readonly">${BoardVO.contents}</textarea>		
			</div>
			
			<div>
				<label for="name">작성자</label>
				<input type="text" name="name" id="name" value="${BoardVO.name}" readonly="readonly"/>		
			</div>
		</div>
		
		
		
</body>
</html>