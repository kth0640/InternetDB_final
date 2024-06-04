<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%	
	request.setCharacterEncoding("UTF-8");
	
	String userID = null;
	String userPassword = null;
	
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	
	if(userID == null || userPassword == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	
	if(result == 1){//로그인에 성공하는 경우 세션값 설정
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../main.jsp';");
		script.println("</script>");
		script.close();
	}
	
	else if(result == 0 || result == -1){//아이디 또는 비밀번호 틀렸을 때
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
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