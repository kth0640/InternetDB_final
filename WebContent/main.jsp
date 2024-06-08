<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<%	//로그인 정보 세션에서 가져오기
	String userID=(String)session.getAttribute("userID");
	
	if(userID==null || userID==""){
		
	%>
	<button type="button" onclick="location.href='./login&register/userLogin.jsp'">로그인</button>
	
	<% }else{
		out.println(userID);
	
	%><button type="button" onclick="location.href='./login&register/userLogout.jsp'">로그아웃 </button>
	
	<%} %>
	
	
	
	
</body>
</html>