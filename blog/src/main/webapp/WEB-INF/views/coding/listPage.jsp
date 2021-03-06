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


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


 
	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			 a:link { color: black; text-decoration: none;}
			 a:visited { color: black; text-decoration: none;}
			 a:hover { color: blue; text-decoration: underline;}
			 
			 th { text-align: center; }
			 table { text-align: center; }
			 h1 { padding: 40px}
			 
			 .navbar-brand img {
			 	width: 65px;
			 	height: 65px;
			 	margin-top : -10px;
			 	
			 }
			 
			 #searchTypeSel {
			 	width : 85px;
			 	height : 20px;
			 	padding: 1px 5px;
				font-size: 12px;
				line-height: 1.5;
				border-radius: 3px;
			 }
			 
			 #keyword {
			 	width : 200px;
			 	height : 20px;
			 	padding: 1px 5px;
				font-size: 12px;
				line-height: 1.5;
				border-radius: 3px;
			 }
			 
			 
			 
			 
	</style>

	<script>
		var register = "${register}";
		if(register === "registerOK") {
			alert("등록 되었습니다.");
		}
		
		var result = "${result}";
		if(result === "deleteOK") {
			alert("삭제 되었습니다.");
		} else if(result === "loginOK") {
	 		alert("로그인에 성공하였습니다.");
	 	} 

		var logout = "${logout}";
		if(logout === "logoutOK") {
			alert("로그아웃 되었습니다.");
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
	
	
  <!-- <nav class="navbar navbar-default navbar-fixed-top navbar-inverse"> -->
  <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/board/listPage">
				<img alt="brand" src="/resources/image/nav3PIXER330.png"  >
	  </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/board/listPage">자유게시판</a></li>
        <li class="active"><a href="/coding/listPage">코딩게시판 <span class="sr-only">(current)</span></a></li>
        <li><a href="/fishing/listPage">낚시게시판</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/user/register"><span class="glyphicon glyphicon-off"></span> Sign Up</a></li>
            
            <c:if test="${user == null }">
          	  <li><a href="/"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </c:if>
            
            <c:if test="${user != null }">
         	   <li><a href="/user/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </c:if>
            
            <c:if test="${user != null }">
          	  <li><a href="/user/modify"><span class="glyphicon glyphicon glyphicon-pencil"></span> modify</a></li>
            </c:if>
            
            <c:if test="${user != null }">
         	   <li><a href="/user/remove"><span class="glyphicon glyphicon glyphicon-remove"></span> remove</a></li>
            </c:if>
            
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	
	 <hr />
	 <br />
	 <br />
	 <br />
	 <h1 align="center"><a href="/coding/listPage">코딩게시판</a></h1>
	 <div class="container">
			<c:if test="${user != null }">
			<div class="container">
				<a href="/coding/register"><button class="btn btn-primary btn-xs">새글 작성</button></a>
			</div>
			</c:if>
		</div>
	 <hr />
	 
	<div class="container">
		<form class="navbar-form navbar-left" role="search">
				<select id="searchTypeSel" class="form-control" name="searchType">
					<option value="">검색조건</option>
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="w">작성자</option>
					<option value="tc">제목+내용</option>
					<option value="all">전체조건</option>
				</select>
				
				<input type="text" class="form-control" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
				<button id="searchBtn" class="btn btn-default btn-xs">검색</button>
			</form>
	</div>
	
	<br />
	
	<div class="container">
		<!-- <table class="table table-bordered"> -->
		<table class="table table-striped">
		
			<tr> <!-- 한줄 -->
				<th>no</th> <!-- 첫번째 칸 -->
				<th>title</th> <!-- 두번째 칸 -->
				<th>writer</th> <!-- 세번째 칸 -->
				<th>date</th> <!-- 네번째 칸 -->
				<th>views</th>
			</tr>
			
			<c:forEach items="${list}" var="boardVO">
				<tr>
					<td>${boardVO.board_number}</td>
					<td><a href="/coding/readView${pageMaker.makeQuery(pageMaker.cri.page)}&board_number=${boardVO.board_number}">${boardVO.title }
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
		
		<br />
		<br />
		
		<!-- 페이지 번호 -->	
		<div class="text-center">
			<ul class="pagination">	
				<!-- 맨처음 버튼 -->
				<li>
					<a href="listPage${pageMaker.makeQuery(pageMaker.firstPage)}">first</a>
				</li>
				
				
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li>
						<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}">Previous</a>
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
				    	<a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">Next</a>
					</li>
				</c:if>
				
				
				<li>
					<a href="listPage${pageMaker.makeQuery(pageMaker.finalPage)}">end</a>
				</li>
				
			</ul>
		</div>
	</div>
	
	
		
	
</body>
</html>
