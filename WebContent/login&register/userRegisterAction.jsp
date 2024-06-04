<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String userEmail = null;
	String phone = null;
	String adress = null;
	
	if(request.getParameter("userID")!=null){
		userID = request.getParameter("userID");
	}
	
	if(request.getParameter("userPassword")!=null){
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail")!=null){
		userEmail = request.getParameter("userEmail");
	}
	if(request.getParameter("phone")!=null){
		phone = request.getParameter("phone");
	}
	if(request.getParameter("adress")!=null){
		adress = request.getParameter("adress");
	}
	System.out.println("userID: "+userID);
	System.out.println("userPassword: "+userPassword);
	System.out.println("userEmail: "+userEmail);
	System.out.println("phone: "+phone);
	System.out.println("adress: "+adress);
	
	if(userID == null || userPassword == null || userEmail == null || phone == null || adress == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, phone, adress));
	if(result == -1){//이미 존재하는 아이디인 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else{
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../main.jsp';");
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