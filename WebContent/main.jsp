<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    
    <meta charset="UTF-8">
    <title>중고마트</title>
    <link rel="stylesheet" href="css/Main.css">
</head>
<body>
    <header>
        <h1>중고마트</h1>
        <div class="nav-buttons">
            <button onclick="location.href='login&register/userLogin.jsp'">로그인</button>
            <button onclick="location.href='login&register/userRegister.jsp'">회원가입</button>
            <button onclick="location.href='VR.jsp'">메타버스</button><br><br>
            <button onclick="location.href='showUserInfo/showMyPage.jsp'">내정보</button><br><br>
        </div>
    </header><br><br><br><br>
    <div class="button-container" style="display: flex; justify-content: center; align-items: center; flex-grow: 1;">
        <button style="color: white; border-radius: 50%; width: 300px; height: 300px; border: none; font-size: 48px; cursor: pointer; margin: 20px; background-color: lightgreen; margin:100px;" onclick="location.href='addProduct/addProduct.jsp'">상품 등록</button>
        <button style="color: white; border-radius: 50%; width: 300px; height: 300px; border: none; font-size: 48px; cursor: pointer; margin: 20px; background-color: lightblue; margin:100px;" onclick="location.href='showProduct/showProduct.jsp'">상품 보기</button>
    </div>
</body>
</html>
