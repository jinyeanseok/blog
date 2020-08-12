<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


  <style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			
			 a:link { color: white; text-decoration: none;}
			 a:visited { color: white; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
			 .comment{font-size: 2em;}
			 h1 { padding: 40px}
			 
			 .parent { 
			 	  border: 1px;
				  display: grid; 
				  grid-template-areas:
				    "i1 i2 i3"
				    "i4 i4 i4";
				    
				}
				.item-1 {
				  grid-area: i1;
			
				}
				.item-2 {
				  grid-area: i2;
				}
				.item-3 {
				  grid-area: i3;
				  text-align: right;	
				}
				.item-4 {
				  grid-area: i4;
				  
				}
				
				.item-1, .item-2, .item-3, .item-4 {
			        padding: 1rem;
			        border: 2px solid #aaa;
			    }
			    

									 
				
			
	</style>
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
				formObj.attr("action", "/fishing/replyWrite");
				formObj.submit();
			});
		}
		
		function updateReply() {
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/fishing/replyUpdateView?board_number=${BoardVO.board_number}"
								+ "&page=${cri.page}"
								+ "&perPageNum=${cri.perPageNum}"
								+ "&reply_number="+$(this).attr("data-reply_number");
			});
		}
		
		function deleteReply() {
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/fishing/replyDeleteView?board_number=${BoardVO.board_number}"
								+ "&page=${cri.page}"
								+ "&perPageNum=${cri.perPageNum}"
								+ "&reply_number="+$(this).attr("data-reply_number");
			});
		}
		
		
	</script>
	
</head>
<body>

		<h1 align="center">3PIXER</h1><hr />
	
		<div class="container">
			<div>글번호 : ${BoardVO.board_number}</div>
			<br />
			<c:if test="${user.identification == BoardVO.identification }">
			<button class="btn btn-danger"><a href="/fishing/delete${cri.makeQuery()}&board_number=${BoardVO.board_number}">삭제</a></button>
			<hr />
			</c:if>
		</div>
		
		
			<div>
				<div class="form-group">
					<div class="container">
						<label for="title">제목</label>
						<input type="text" class="form-control" id="title" name="title" value="${BoardVO.title}" readonly="readonly"/>		
					</div>
				</div>
				
				<div class="form-group">
					<div class="container">
						<label for="contents">내용</label>
						<textarea name="contents" class="form-control" id="contents" rows="10" readonly="readonly">${BoardVO.contents}</textarea>		
					</div>
				</div>
				
				<div class="form-group">
					<div class="container">
						<label for="name">작성자</label>
						<input type="text" class="form-control" name="name" id="name" value="${BoardVO.name}" readonly="readonly"/>		
					</div>
				</div>
			</div>
		
		
		
		<div class="form-group">
			<div class="container">	
					<div>
						<a href="/fishing/listPage${cri.makeQuery()}"><button class="btn btn-primary">목록</button></a> 
						
						<c:if test="${user.identification == BoardVO.identification }">
							<a href="/fishing/update${cri.makeQuery()}&board_number=${BoardVO.board_number}" ><button class="btn btn-success">수정</button></a>
						</c:if>
						
						<a href="/fishing/listPage"><button class="btn btn-info">취소</button></a>
						<br />
					</div>				
			</div>
		</div>
		
		<br />
		<br />
		<br />
		<br />
		
		<div class="container">
			
			<label class="comment">comment</label>
			
			<c:if test="${user.identification != null }">
				<form name="replyForm" method="post">
				
				  <input type="hidden" id="board_number" name="board_number" value="${BoardVO.board_number}" />
				  <input type="hidden" id="page" name="page" value="${cri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"> 
				
				  <div class="input-group">
				     <input type="hidden" id="replyer" name="replyer" value="${user.name}" readonly="readonly"/>
				     <input type="text" id="replytext" class="form-control" name="replytext" placeholder="내용을 입력하세요" />
				  
				  <span class="input-group-btn">
				 	 <button type="button" class="replyWriteBtn btn btn-success">작성</button>
				  </span>
				  </div>
				  
				</form>
			</c:if>
			<hr />
		</div>
		
		
		
		
		<div>  
			
		    <c:forEach items="${replyList}" var="replyList">
		      
		        <!-- <div class="container">
		  	                 작성자 : ${replyList.replyer}<br />
		  	      	   작성 날짜 :  <fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" /> <br />
		  	      	   댓글 : ${replyList.replytext}
		        </div> -->
		    
		        <div class="container">
			        <div class="parent">   	
						  <div class="item-1">${replyList.replyer}</div> 
						  <div class="item-2"><fmt:formatDate value="${replyList.create_date}" pattern="yyyy-MM-dd" /></div> 
						  <div class="item-3">
							  <c:if test="${user.name == replyList.replyer }"> <!-- boardVO.identification는 글작성한 사람 아이디, user.identification는 로그인한 사람 아이디 -->
							  	<button type="button" class="replyUpdateBtn btn btn-success" data-reply_number="${replyList.reply_number}">수정</button>
								<button type="button" class="replyDeleteBtn btn btn-danger" data-reply_number="${replyList.reply_number}">삭제</button>
						   	  </c:if>
						</div>	
						  <div class="item-4">${replyList.replytext}</div> 
					
					</div>
				</div>
			
						        
		        
		               
		               <br />
		       <div>
		       		<!-- <div>로그인한 이용자 : ${user.identification } </div> -->
		       		<!-- <div>댓글 작성자 : ${replyList.replyer}</div> -->
		       		
				   <!-- <c:if test="${user.identification == replyList.replyer }"> 
					 <div class="container">
						 <button type="button" class="replyUpdateBtn btn btn-success" data-rno="${replyList.reply_number}">수정</button>
						 <button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.reply_number}">삭제</button>
						 <hr />
					 </div>
				   </c:if> -->
				</div>
				<br />
				<br />
				<br />
		    </c:forEach>   
		  
		  <br />
	</div>
		
		
		
</body>
</html>