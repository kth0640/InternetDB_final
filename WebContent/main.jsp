<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>secondhand_market</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Snippet&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/Main.css">
    <style>
        @keyframes backgroundColorTransition {
            0% { background-color: #D3D3D3; }
            50% { background-color: #FFFFFF; }
            100% { background-color: #D3D3D3; }
        }

        body {
            animation: backgroundColorTransition 10s infinite;
        }

        header {
            background-color: #ECF39E;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .button-container button {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .button-container button.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .menu-bar {
            position: fixed;
            top: 0;
            left: -250px;
            width: 250px;
            height: 100%;
            background-color: #DAD6D6;
            color: white;
            overflow: auto;
            transition: left 0.3s;
            padding-top: 60px;
        }

        .menu-bar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 22px;
            font-weight: 500;
            color: black;
            display: block;
            transition: 0.3s;
        }

        .menu-bar a:hover {
            background-color: #575757;
        }

        .hamburger {
            position: fixed;
            top: 15px;
            left: 15px;
            cursor: pointer;
            font-size: 40px;
            color: #333;
        }

        .menu-bar .close-btn {
            position: absolute;
            top: 15px;
            right: 25px;
            font-size: 36px;
            cursor: pointer;
        }

        .animated-line {
            width: 0;
            height: 6px;
            background-color: #92BFB1;
            margin: 0 auto;
            transition: width 2s ease;
        }

        .line-container {
            width: 100%;
            text-align: center;
        }

        .line-container.visible .animated-line {
            width: 100%;
        }

        .wavy-line {
            width: 100%;
            height: 10px;
            background: linear-gradient(to right, #A9DDD6 50%, transparent 50%);
            background-size: 20px 10px;
            animation: wave 1s linear infinite;
        }

        @keyframes wave {
            from {
                background-position: 0 0;
            }
            to {
                background-position: 20px 0;
            }
        }

        #addBtn, #showBtn {
            margin: 100px;
            background-color: #A9DDD6;
            color: black;
            font-weight: 500;
            font-size: 40px;
            padding: 60px 60px;
            border-radius: 60px;
            transition: transform 0.3s;
            border: 2px solid black;
        }

        #addBtn:hover, #showBtn:hover {
            transform: scale(1.1);
        }

        header h1 {
            margin-top: 100px;
            margin-bottom: 60px;
            font-size: 60px;
            color: #132A13;
            font-weight: 100;
        }
    </style>
    <%
        String userID = null;
        userID = (String) session.getAttribute("userID");
    %>
</head>
<body>

    <div class="hamburger" onclick="openNav()">&#9776;</div>
    <div class="menu-bar" id="menuBar">
        <span class="close-btn" onclick="closeNav()">&times;</span>
        <a href="Main.jsp" style="font-family: 'Snippet', sans-serif;">Main Page</a>
        <a href="freeBoard/freeBoard.jsp" style="font-family: 'Snippet', sans-serif;">Free Board</a>
    </div>
    <header style="height: 350px;">
        <h1 style="font-family: 'Snippet', sans-serif;">Secondhand Market</h1>
        <div class="nav-buttons">
            <%
                if (userID == null) {
            %>
                <button onclick="location.href='login&register/userLogin.jsp'">로그인</button>
                <button onclick="location.href='login&register/userRegister.jsp'">회원가입</button>
            <%
                } else {
            %>
                <button onclick="location.href='showUserInfo/showMyPage.jsp'">내 정보</button>
                <button onclick="location.href='login&register/userLogout.jsp'">로그아웃</button>
            <%
                }
            %>
            <button onclick="location.href='VR.jsp'">메타버스</button><br><br>
        </div>
    </header>
    <div class="line-container">
        <div class="animated-line"></div>
    </div>
    <div class="wavy-line"></div>
    <div class="button-container" style="display: flex; justify-content: center; align-items: center; flex-grow: 1;">
        <button onclick="location.href='addProduct/addProduct.jsp'" id="addBtn">상품 등록</button>
        <button onclick="location.href='showProduct/showProduct.jsp'" id="showBtn">상품 보기</button>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var buttons = document.querySelectorAll('.button-container button');
            buttons.forEach(function(button, index) {
                setTimeout(function() {
                    button.classList.add('visible');
                }, 700 + index * 500);
            });

            var lineContainer = document.querySelector('.line-container');
            setTimeout(function() {
                lineContainer.classList.add('visible');
            }, 500);
        });

        function openNav() {
            document.getElementById("menuBar").style.left = "0";
        }

        function closeNav() {
            document.getElementById("menuBar").style.left = "-250px";
        }
    </script>
</body>
</html>
