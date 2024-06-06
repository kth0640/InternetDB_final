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
	
		
		#reset_button{
		margin-top:10px;
		background-color:#F58193;
		border:none;
		
		}
		
		.phone-div{
			display:inline;
			
		}
		.phone{
			width:50px;
		}
		
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, intital-scale=1, shrink-to-fit=no">
	<title>회원가입</title>
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- custom CSS 추가하기 -->
	<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
	<section class="container" style="max-width:400px; " >
	
			<form action="./userRegisterAction.jsp" method="post" >
			<div class="form-group">
				<lable>아이디</lable>
				<input type="text" id="userID" name="userID" class="form-control">
			</div>
			
			<div class="form-group">
				<lable>비밀번호</lable>
				<input type="password" id="userPassword" name="userPassword" class="form-control">
			</div>
			<div class="form-group">
				<lable>이메일</lable>
				<input type="text" id="userEmail" name="userEmail" class="form-control">
			</div>
			
			<lable>전화번호</lable>
				<div class="phone-div">
					<input type="text" class="form-control" name="phone" oninput="oninputPhone(this)" maxlength="14">
				</div>
			
			<div class="form-group">
				<lable>주소</lable>
				<input type="text" name="adress" class="form-control">
			</div>
			
			<button type="submit" class="btn btn-primary" style="margin-top:10px;border:none">회원가입</button>
			<input type="reset" id="reset_button" class="btn btn-primary" value="재입력" >
		</form>
	</section>
	
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="../js/jquery.min.js"></script>
		<!-- 파퍼자바스크립트 추가하기 -->
	<script src="../js/popper.js"></script>
		<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="../js/bootstrap.min.js"></script>
	<script>
		function oninputPhone(target) {
		    target.value = target.value
		        .replace(/[^0-9]/g, '')
		        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
		}
	</script>

</body>
</html>