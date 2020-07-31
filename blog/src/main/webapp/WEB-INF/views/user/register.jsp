<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>게시판</title> 
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 <script type="text/javascript">
 	
	function fn_idOverlap() {
		$.ajax({
			url : "/user/idOverlap",
			type : "post",
			dataType : "json",
			data : { "identification" : $("#identification").val()},
			success : function(data) {
				if(data == 1) {
					alert("중복된 아이디 입니다.");
				} else if(data == 0) {
					alert("사용가능한 아이디 입니다.");
				}
			}
		})
	}

 </script>
</head>
<body>

<form method="post" autocomplete="off">
 	
 	<div>
 		<label for="identification">아이디</label>
 		<input type="text" id="identification" name="identification" />
 		<button type="button" id="idOverlap" onclick="fn_idOverlap();">중복확인</button>
 	</div>
 	
 	<div>
 		<label for="password">비밀번호</label>
 		<input type="password" id="password" name="password" />
 	</div>
 	
 	<div>
 		<label for="name">이름</label>
 		<input type="text" id="name" name="name" />
 	</div>
 	
 	<div>
 		<button type="submit">가입</button>
 	</div>
 	
</form>

	<div>
		<button onclick ="location.href='/'">처음</button>
	</div>
</body>
</html>