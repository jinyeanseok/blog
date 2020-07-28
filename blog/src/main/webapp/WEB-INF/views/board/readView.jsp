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
	
		
		var result = '${result}';
		if(result === 'updateOK') {
			alert("수정되었습니다.");
		}
		
		$(function () {
			createReply();
			updateReply();
			deleteReply();
		})
		
		function createReply() {
			$(".replyWriteBtn").on("click", function() {
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/board/replyWrite");
				formObj.submit();
			});
		}
		
		function updateReply() {
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?board_number=${BoardVO.board_number}"
								+ "&page=${cri.page}"
								+ "&perPageNum=${cri.perPageNum}"
								+ "&reply_number="+$(this).attr("data-reply_number");
			});
		}
		
		function deleteReply() {
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?board_number=${BoardVO.board_number}"
								+ "&page=${cri.page}"
								+ "&perPageNum=${cri.perPageNum}"
								+ "&reply_number="+$(this).attr("data-reply_number");
			});
		}
		
		
	</script>
	
</head>
<body>
	
		<div>글번호 : ${BoardVO.board_number}</div>
	
		<div>
			<button><a href="/board/listPage${cri.makeQuery()}" class="btn btn-primary">목록</a></button>
			<button><a href="/board/update${cri.makeQuery()}&board_number=${BoardVO.board_number}" class="btn btn-warning">수정</a></button>
			<button><a href="/board/delete${cri.makeQuery()}&board_number=${BoardVO.board_number}">삭제</a></button>
			
			
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
		
		<!-- 댓글 -->
		<div id="reply">
		  <ol class="replyList">
		    <c:forEach items="${replyList}" var="replyList">
		      <li>
		        <p>
		        작성자 : ${replyList.replyer}<br />
		        작성 날짜 :  <fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" />
		        </p>
		
		        <p>${replyList.replytext}</p>
		        <div>
		        	  <button type="button" class="replyUpdateBtn" data-reply_number="${replyList.reply_number}">수정</button>
 					  <button type="button" class="replyDeleteBtn" data-reply_number="${replyList.reply_number}">삭제</button>
		        </div>
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		
		<form name="replyForm" method="post">
		  <input type="hidden" id="board_number" name="board_number" value="${BoardVO.board_number}" />
		  <input type="hidden" id="page" name="page" value="${cri.page}"> 
		  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
		  <input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
		  <input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
		
		  <div>
		    <label for="replyer">댓글 작성자</label><input type="text" id="replyer" name="replyer" />
		    <br/>
		    <label for="replytext">댓글 내용</label><input type="text" id="replytext" name="replytext" />
		  </div>
		  <div>
		 	 <button type="button" class="replyWriteBtn">작성</button>
		  </div>
		</form>
		
		
</body>
</html>