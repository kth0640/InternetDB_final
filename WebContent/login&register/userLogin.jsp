<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		section{
			position: absolute;
 	   	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, intital-scale=1, shrink-to-fit=no">
	<title>로그인</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- custom CSS 추가하기 -->
	<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
	<section class="container" style="max-width:400px; " >
		<form method="post" action="./userLoginAction.jsp">
			
			<div class="form-group">
				<lable>아이디</lable>
				<input type="text" name="userID" class="form-control">
			</div>
			
			<div class="form-group">
				<lable>비밀번호</lable>
				<input type="password" name="userPassword" class="form-control">
			</div>
			
			<button type="submit" class="btn btn-primary" style="margin-top:5px; width:100%">로그인</button>
			<div class="links" style="text-align:center; margin-top:5px">
            <a href="../findUserInfo/findUserID.jsp">아이디 찾기</a> 
           |<a href="../findUserInfo/findUserPassword.jsp">비밀번호 찾기</a> 
           |<a href="./userRegister.jsp">회원가입</a>

        </div>
		</form>
		
	</section>
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="../js/jquery.min.js"></script>
		<!-- 파퍼자바스크립트 추가하기 -->
	<script src="../js/popper.js"></script>
		<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="../js/bootstrap.min.js"></script>

</body>
</html>