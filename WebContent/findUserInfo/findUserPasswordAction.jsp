<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   
    if(result == -1){ //존재하지 않는 정보인 경우 
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('일치하는 정보가 없습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else if(result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            text-align: center;
            border: 2px solid black;
            background-color: #ECF39E;
            border-radius: 10px;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-control {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-primary {
            background-color: #92BFB1;
            border: solid 2px black;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #7da89e;
        }
    </style>
</head>
<body>
    <section class="container">
        <form method="post" action="./resetPasswordAction.jsp">
            <div>
                <input type="hidden" name="userID" class="form-control" value="<%=userID%>" readonly>
            </div>
            <div class="form-group">
                <label>변경할 비밀번호</label>
                <input type="password" name="changePassword" class="form-control">
            </div>
            <div class="form-group">
                <label>비밀번호 확인</label>
                <input type="password" name="changePasswordCheck" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">확인</button>
        </form>
    </section>
</body>
</html>
