<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<html>
<head>
 <title>게시판</title> 
 
 <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
 <script>
		
 	var result = '${result}'; // 쌍따음표 말고 따음표로 해야 데이터를 가져옴
 	
 	if(result === "registerFalse") {
 		alert("회원가입에 실패하였습니다.");
 	} 
 	
 </script>
 	
 	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      html,
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #ffffff;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 6px;  <!-- 이쪽을 높여야 전체적인 크기가 커짐 -->
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
      
.auth-form-body {
	padding: 10px;
	font-size: 18px;
	background-color : #fff;
	border: 1px solid #d8dee2;
	box-sizing : border-box;
	margin: 0 auto
}

#titleText {
	color : gray;
}
    </style>
    
 
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
					$("#submit").attr("disabled", "disabled");
				} else if(data == 0) {
					alert("사용가능한 아이디 입니다.");
					$("#submit").removeAttr("disabled");
				}
			}
		})
	}

 </script>
 
 <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">
 <link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link href="signin.css" rel="stylesheet">
	
</head>



<body class="text-center">
	<div class="auth-form-body">
    <form method ="post" autocomplete="off" class="form-signin">
	  <img alt="brand" src="/resources/image/instagram_profile_image1.png" width="120" height="120">
	  <h1 class="h2 mb-4 font-weight-normal" id="titleText">Please sign up</h1>
	  
	  <br />
	  
	  <div class="input-group">
	  	<label for="identification" class="sr-only">id</label>
	  	<input type="text" id="identification" name="identification" class="form-control" placeholder="identification" required autofocus>
	  	<span class="input-group-btn">
	  		<button type="button" id="idOverlap" class="btn btn btn-success" onclick="fn_idOverlap();">중복확인</button>
	  	</span>
	  </div>
	  
	  <br />
	  	
	  	
	
	  <label for="password" class="sr-only">Password</label>
	  <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
	  
	  
	  <label for="name" class="sr-only">name</label>
	  <input type="text" id="name" name="name" class="form-control" placeholder="name" required>
	  
	  <br />
	  
	  <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit" disabled="disabled">Sign up</button>
	  <br />
	  <p class="mt-5 mb-3 text-muted">&copy; 2020-jinyeanseok</p>
	</form>
	</div>
</body>
</html>