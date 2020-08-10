<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.form-control {
	width: 300;
}

#titleText {
	color : gray;
}
    </style>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/sign-in/">
	<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="signin.css" rel="stylesheet">
	
</head>
<body class="text-center">
<div class="auth-form-body">
<form method="post" autocomplete="off">
 	<img alt="brand" src="/resources/image/instagram_profile_image1.png" width="120" height="120">
 	<h1 class="h2 mb-4 font-weight-normal" id="titleText">new password</h1>
 	
 	<br />
 	<div>
 		<label for="identification" class="sr-only">아이디</label>
 		<input type="text" id="identification" name="identification" class="form-control" value="${user.identification}" readonly/>
 	</div>
 	
 	<br />
 	
 	<div>
 		<label for="password" class="sr-only">새 비밀번호</label>
 		<input type="password" id="password" class="form-control" name="password" placeholder="New Password"/>
 	</div>
 	
 	<br />
 	
 	<div>
 		<button class="btn btn-lg btn-primary btn-block" type="submit">Change Password</button>
 	</div>
 	
</form>

	<div>
		<button class="btn btn-lg btn-success btn-block" onclick ="location.href='/'">back</button>
	</div>
	<br />
	<p class="mt-5 mb-3 text-muted">&copy; 2020-jinyeanseok</p>
</div>
</body>
</html>