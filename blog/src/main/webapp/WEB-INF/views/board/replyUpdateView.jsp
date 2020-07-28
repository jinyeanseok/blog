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
	<script>
		$(document).ready(function() {
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function() {
				location.href = "/board/readView?board_number=${replyUpdate.board_number}"
					   + "&page=${cri.page}"
					   + "&perPageNum=${cri.perPageNum}";
			})
		})
	</script>
	
</head>
<body>
	
		<div>글번호 : ${BoardVO.board_number}</div>
	
		<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
					<input type="hidden" name="board_number" value="${replyUpdate.board_number}" readonly="readonly"/>
					<input type="hidden" id="reply_number" name="reply_number" value="${replyUpdate.reply_number}" />
					<input type="hidden" id="page" name="page" value="${cri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<label for="replytext">댓글 내용</label><input type="text" id="replytext" name="replytext" value="${replyUpdate.replytext}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
		
		
</body>
</html>