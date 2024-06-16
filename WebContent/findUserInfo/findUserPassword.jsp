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


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
	<fieldset>
	<legend>등록된 정보로 비밀번호 찾기</legend>
	<form method="post" action="./findUserPasswordAction.jsp">
			
			
			
		<div class="form-group">
			<lable>아이디</lable>
			<input type="text" name="userID" class="form-control">
		</div>
			
		
			<div class="form-group">
				<lable>이메일</lable>
				<input type="text" id="userEmail" name="userEmail" class="form-control">
			</div>
			
			
			<button type="submit" class="btn btn-primary" style="margin-top:5px; width:100%">확인</button>
			<div class="links" style="text-align:center; margin-top:5px">
          

        </div>
		</form>
		</fieldset>
	</section>

</body>
</html>