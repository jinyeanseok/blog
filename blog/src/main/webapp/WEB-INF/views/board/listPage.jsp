<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			 a:link { color: black; text-decoration: none;}
			 a:visited { color: black; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
			 th { text-align: center; }
			 table { text-align: center; }
			 h1 { padding: 40px}
			 
	</style>

	<script>
		var register = "${register}";
		if(register === "registerOK") {
			alert("등록 되었습니다.");
		}
		
		var result = "${result}";
		if(result === "deleteOK") {
			alert("삭제 되었습니다.");
		}
	</script>
	
		

</head>
<body>

	<h1 align="center"><a href="/">게시판</a></h1><hr />
		
	<div class="container">
		<a href="/board/register"><button class="btn btn-primary">새글 작성</button></a>
	</div>
	
	<div class="container">
		<table class="table table-bordered">
		
			<tr> <!-- 한줄 -->
				<th>번호</th> <!-- 첫번째 칸 -->
				<th>제목</th> <!-- 두번째 칸 -->
				<th>작성자</th> <!-- 세번째 칸 -->
				<th>작성일자</th> <!-- 네번째 칸 -->
				<th>조회수</th>
			</tr>
			
			<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.board_number}</td>
					<td><a href="/board/read${pageMaker.makeQuery(pageMaker.cri.page)}&board_number=${boardVO.board_number}">${boardVO.title }</a></td>
					<td>${boardVO.name}</td>
					<td><fmt:formatDate pattern="YYYY-MM-dd" value="${boardVO.create_date}"/></td>
					<td>${boardVO.view_count}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이지 번호 -->	
	<div class="text-center">
		<ul class="pagination">	
			<!-- 맨처음 버튼 -->
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.firstPage)}">맨처음</a>
			</li>
			
			
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}">이전</a>
				</li>
			</c:if>
			
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var ="idx">
					<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
						<a href="/board/listPage${pageMaker.makeQuery(idx)}">
					
							<span>${idx}</span>
						</a>
					</li>
				</c:forEach>
			
			<!-- next 버튼 -->
			<c:if test="${pageMaker.next}">
				<li>
			    	<a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
				</li>
			</c:if>
			
			
			<li>
				<a href="listPage${pageMaker.makeQuery(pageMaker.finalPage)}">맨끝</a>
			</li>
			
		</ul>
	</div>
	
</body>
</html>
