<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%	
	request.setCharacterEncoding("UTF-8");
	
	String userEmail = null;
	String phone = null;
	String userID = null;

	if(request.getParameter("userEmail") != null){
		userEmail = request.getParameter("userEmail");
	}
	
	if(request.getParameter("phone") != null){
		phone = request.getParameter("phone");
	}
	
	if(userEmail == null || phone == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	String result = userDAO.findID(userEmail, phone);
	
	if(result == "no ID"){//존재하지 않는 정보인 경우 
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('일치하는 정보가 없습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	

	else if(result == "DB error"){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
	else{
		userID = result;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container" style="max-width:400px; " >
		<div class="alert alert-success mt-4" role="alert">
			<p>회원님의 아이디는 <%=userID %> 입니다.
		</div>
		<div style="text-align:center;">
		
		<button type="submit" class="btn btn-primary" style="margin-top:10px;border:none" onclick="location.href='../login&register/userLogin.jsp'">로그인</button>
		</div>
	</section>
</body>
</html>