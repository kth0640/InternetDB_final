<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%	
	request.setCharacterEncoding("UTF-8");
	
	String userID = null;
	String userEmail = null;
	

	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	
	if(request.getParameter("userEmail") != null){
		userEmail = request.getParameter("userEmail");
	}
	
	if(userID == null || userID.isEmpty() || userEmail == null || userEmail.isEmpty() ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.existChangePassword(userID, userEmail);
	
	if(result == -1){//존재하지 않는 정보인 경우 
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('일치하는 정보가 없습니다.');");
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
	<section class="container" style="max-width:400px; " >
		<form method="post" action="./resetPasswordAction.jsp">
			<div>
				<input type="hidden" name="userID" class="form-control" value=<%=userID%> readonly>
			</div>
			
			<div class="form-group">
				<lable>변경할 비밀번호</lable>
				<input type="password" name="changePassword" class="form-control">
			</div>
			
			<div class="form-group">
				<lable>비밀번호확인</lable>
				<input type="password" name="changePasswordCheck" class="form-control">
			</div>
			
			<button type="submit" class="btn btn-primary" style="margin-top:5px; width:100%">확인</button>
		
		</form>
		
	</section>
	
</body>
</html>