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
	<legend>등록된 정보로 아이디 찾기</legend>
	<form method="post" action="./findUserIDAction.jsp">
			
			
			
		<div class="form-group">
			<lable>이메일</lable>
			<input type="text" name="userEmail" class="form-control">
		</div>
			
		
				<div class="phone-div">
				<lable>전화번호</lable>
					<input type="text" class="form-control" name="phone" oninput="oninputPhone(this)" maxlength="14">
				</div>
			
			
			<button type="submit" class="btn btn-primary" style="margin-top:5px; width:100%">아이디 찾기</button>
			<div class="links" style="text-align:center; margin-top:5px">
          

        </div>
		</form>
		</fieldset>
	</section>
	<script>
		function oninputPhone(target) {
		    target.value = target.value
		        .replace(/[^0-9]/g, '')
		        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
		}
	</script>-
</body>
</html>