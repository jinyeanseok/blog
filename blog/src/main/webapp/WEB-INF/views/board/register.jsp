<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	a:link { color: black; text-decoration: none;}
</style>
</head>
<body>
	<br />
	<br />
	<br />
	<a href="/board/listPage"><h1 align="center">게시글 작성</h1></a><hr />
	
	<br />
	<br />
	<br />
	
	<div class="container">
		<c:if test="${result == null}"> <!-- controller에서 loginFalse를 넘겼기 떄문에 loginfalse가 아닌 값은 정상적으로 로그인 된것임 -->
		<form method="post">
			<div>
				<div class="form-group">
					<div class="container">
						<label for="title">제목</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요."/>		
					</div>
				</div>
					
				<div class="form-group">
					<div class="container">
						<label for="contents">내용</label>
						<textarea name="contents" class="form-control" id="contents" rows="10" placeholder="내용을 입력하세요."></textarea>		
					</div>
				</div>
				
				<div class="form-group">
					<div class="container">
						<label for="identification">아이디</label>
						<input type="text" class="form-control" name="identification" id="identification" value="${user.identification}" readonly="readonly" required/>		
					</div>
				</div>	
					
				<div class="form-group">	
					<div class="container">
						<label for="name">작성자</label>
						<input type="text" class="form-control" name="name" id="name" value="${user.name}" readonly="readonly" required/>		
					</div>
				</div>
				
			</div>
			
			<br />
			
			<div class="form-group">
				<div class="container">
					<button type="submit" class="btn btn-success">등록</button>
					<button type="button" class="btn btn-info" onclick="history.back()">취소</button>
				</div>
				
				
			</div>
			
		</form>
		</c:if>
	</div>
</body>
</html>