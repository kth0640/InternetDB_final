<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   
    if(userEmail == null || userEmail.isEmpty() || phone == null || phone.isEmpty() ){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }
   
    System.out.println(userEmail + " " + phone);
   
    UserDAO userDAO = new UserDAO();
    String result = userDAO.findID(userEmail, phone);
   
    if(result.equals("no ID")) { //존재하지 않는 정보인 경우 
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('일치하는 정보가 없습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else if(result.equals("DB error")) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else {
        userID = result;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
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
        .alert {
            margin-bottom: 10px;
        }
        .btn-primary {
            background-color: #92BFB1;
            border: 2px solid black;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-primary:hover {
            background-color: #7da89e;
        }
    </style>
</head>
<body>
    <section class="container">
        <div class="alert alert-success mt-4" role="alert">
            <p>회원님의 아이디는 <%= userID %> 입니다.</p>
        </div>
        <div>
            <button type="submit" class="btn btn-primary" onclick="location.href='../login&register/userLogin.jsp'">로그인</button>
        </div>
    </section>
</body>
</html>
