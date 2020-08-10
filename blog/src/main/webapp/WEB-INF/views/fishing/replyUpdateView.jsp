<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function() {
				location.href = "/fishing/readView?board_number=${replyUpdate.board_number}"
					   + "&page=${cri.page}"
					   + "&perPageNum=${cri.perPageNum}";
			})
		})
	</script>
	
	
</head>
<body>
		<div class="container">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<br />
				<br />
				<h1 align="center" class="title">댓글 수정</h1>
				<br />
			</div>
			
			<div class="col-sm-6 col-md-offset-3">
					<form name="updateForm" role="form" method="post" action="/fishing/replyUpdate">
						<input type="hidden" name="board_number" value="${replyUpdate.board_number}" readonly="readonly"/>
						<input type="hidden" id="reply_number" name="reply_number" value="${replyUpdate.reply_number}" />
						<input type="hidden" id="page" name="page" value="${cri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
						<div class = "form-group">
							<div>글번호 : ${replyUpdate.board_number}</div>
							<br />
							<label for="replytext">댓글 내용</label>
							<textarea class="form-control" id="replytext" name="replytext" rows="10" >${replyUpdate.replytext}</textarea>
						</div>
						<div>
							<button type="submit" class="update_btn btn btn-success">수정</button>
							<button type="button" class="cancel_btn btn btn-info">취소</button>
						</div>
					</form>
			</div>
		
		</div>
</body>
</html>