<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Snippet&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            margin-top: 60px;
            margin-bottom: 80px;
            color: black;
            text-align: center;
            font-weight: 400;
        }
        .record {
            background-color: #ffffff;
            border-radius: 20px;
            border: 2px solid black;
            margin-bottom: 20px;
        }
        .record-header {
            background-color: #ECF39E;
            border-radius: 20px 20px 0 0;
            padding: 10px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .record-content {
            padding: 15px;
        }
        .btn-container {
            text-align: end;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #92BFB1;
            border: 2px solid #000;
            padding: 10px 20px;
            font-size: 1em;
            font-weight: 500;
            color: black;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #ECF39E;
            border: 2px solid #000;
            color: black;
        }
        .deleteBtn {
            background-color: #92BFB1 !important;
            border: 2px solid #000 !important;
            color: black !important;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .deleteBtn:hover {
            background-color: #ECF39E !important;
            color: black !important;
        }
        
        .animated-line {
            width: 0;
            height: 4px;
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
            font-size: 30px;
            color: #333;
        }

        .menu-bar .close-btn {
            position: absolute;
            top: 15px;
            right: 25px;
            font-size: 36px;
            cursor: pointer;
        }
    </style>
</head>
<body>
 	<div class="hamburger" onclick="openNav()">&#9776;</div>
    <div class="menu-bar" id="menuBar">
        <span class="close-btn" onclick="closeNav()">&times;</span>
        <a href="../Main.jsp" style="font-family: 'Snippet', sans-serif;">Main Page</a>
        <a href="freeBoard.jsp" style="font-family: 'Snippet', sans-serif;">Free Board</a>
    </div>
    <div class="container">
        <header>
            <h1 style="font-family: 'Snippet', sans-serif;">Free Board</h1>
        </header>
        <div class="btn-container">
            <button class="btn btn-primary" onclick="location.href='addFreeBoard.jsp'">글 작성</button>
        </div>
        <div class="records-container">
            <%
                // 데이터베이스 연결 설정
                String dbURL = "jdbc:oracle:thin:@//localhost:1521"; // 데이터베이스 URL, SID 대신 서비스 이름 사용
                String dbUser = "scott"; // 사용자 이름
                String dbPass = "tiger"; // 비밀번호

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // 데이터베이스 연결
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    // SQL 쿼리 작성
                    String sql = "SELECT id, title, author, contents FROM freeboard";

                    // SQL 쿼리 실행
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // 결과 처리 및 HTML div 생성
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String contents = rs.getString("contents");
            %>
            <div class="record">
                <div class="record-header">
                    <h4>제목: <%= title %></h4>
                    <form action="deleteFreeBoard.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="deleteBtn">삭제</button>
                    </form>
                </div>
                <div class="line-container">
                    <div class="animated-line"></div>
                </div> 
                <div class="record-content">
                    <p>작성자: <%= author %></p>
                    <p>내용: <%= contents %></p>
                </div>
            </div>
            <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println("데이터 조회 중 오류가 발생했습니다: " + ex.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var observer = new IntersectionObserver(function(entries) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        entry.target.classList.add("visible");
                    }
                });
            }, { threshold: 0.1 });

            document.querySelectorAll(".line-container").forEach(function(element) {
                observer.observe(element);
            });
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
