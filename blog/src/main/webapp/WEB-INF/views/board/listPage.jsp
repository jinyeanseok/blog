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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

 
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
		
		$(function(){
			setSearchTypeSelect();
		})
		
		function setSearchTypeSelect(){
			var $searchTypeSel = $('#searchTypeSel');
			var $keyword = $('#keyword');
			
			//검색 버튼이 눌리면
			$('#searchBtn').on('click',function(){
				var searchTypeVal = $searchTypeSel.val();
				var keywordVal = $keyword.val();
				
				if(!searchTypeVal){
					alert("검색 조건을 선택하세요!");
					return;
				}else if(!keywordVal){
					alert("검색어를 입력하세요!");
					return;
				}
				
				var url = "listPage?page=1"
					+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal);
				window.location.href = url;
			})
		}
		</script>
</head>
<body>

	<h1 align="center"><a href="/">게시판</a></h1><hr />
		
	<c:if test="${result == null }">
	<div class="container">
		<a href="/board/register"><button class="btn btn-primary">새글 작성</button></a>
	</div>
	</c:if>
	
	<div class="container">
		<select id="searchTypeSel" name="searchType">
			<option value="">검색조건</option>
			<option value="t">제목</option>
			<option value="c">내용</option>
			<option value="w">작성자</option>
			<option value="tc">제목+내용</option>
			<option value="all">전체조건</option>
		</select>
		
		<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
		<button id="searchBtn" class="btn btn-primary">검색</button>
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
					<td><a href="/board/readView${pageMaker.makeQuery(pageMaker.cri.page)}&board_number=${boardVO.board_number}">${boardVO.title }
						<c:if test="${boardVO.reply_count ne 0}">
							<small><b>[&nbsp;<c:out value="${boardVO.reply_count}"/>&nbsp;]</b></small>
						</c:if>
					</a></td>
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
