<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String changePassword = null;
	String changePasswordCheck = null;

	
	if(request.getParameter("userID")!=null){
		userID = request.getParameter("userID");
	}
	
	if(request.getParameter("changePassword")!=null){
		changePassword = request.getParameter("changePassword");
	}
	if(request.getParameter("changePasswordCheck")!=null){
		changePasswordCheck = request.getParameter("changePasswordCheck");
	}
	
	

	
	if( changePassword == null || changePassword.isEmpty() || changePasswordCheck == null || changePasswordCheck.isEmpty()){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}

	if( !(changePassword.equals(changePasswordCheck)) ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}
	
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.resetPassword(userID, changePassword);

	if(result == -1){//
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 재설정 실패 다시 시도해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 재설정 성공.');");
		script.println("location.href='../login&register/userLogin.jsp';");
		script.println("</script>");
		script.close();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>