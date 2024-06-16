<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String userID = null;
	String userEmail =null;
	String phone = null;
	String adress = null;
	
	if(session.getAttribute("userID")!=null){//로그인 한 상태라면
		userID = (String)session.getAttribute("userID");
	}
	
	
	
	ArrayList<String> userInfo = UserDAO.showUserInfo(userID);
	userEmail = userInfo.get(1);
	phone = userInfo.get(2);
	adress = userInfo.get(3);
	System.out.println(Arrays.deepToString(userInfo.toArray()));
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<section class="container" style="max-width:400px; " >
	
			<form action="./userRegisterAction.jsp" method="post" >
			<div class="form-group">
				<lable>아이디</lable>
				<input type="text" id="userID" name="userID" value=<%=userID%> class="form-control">
			</div>
			
			<div class="form-group">
				<lable>이메일</lable>
				<input type="text" id="userEmail" name="userEmail"  value=<%=userEmail%> class="form-control">
			</div>
			
			<lable>전화번호</lable>
				<div class="phone-div">
					<input type="text" class="form-control" name="phone" value=<%=phone %> oninput="oninputPhone(this)" maxlength="14">
				</div>
			
			<div class="form-group">
				<lable>주소</lable>
				<input type="text" name="adress" value=<%=adress%> class="form-control">
			</div>
			
			<input type="button" class="btn btn-primary" onClick='history.back();'style="margin-top:10px;border:none" value="확인">
			
		</form>
	</section>
</body>
</html>