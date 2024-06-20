<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="java.lang.*" %>

<%
		request.setCharacterEncoding("UTF-8");
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }

    String url = request.getQueryString();
   
    int productId = Integer.parseInt(String.valueOf(url));
    ProductDAO productDAO = new ProductDAO();
    ProductDTO product = productDAO.getProductById(productId);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ECF39E; /* 연두색 배경 */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            margin-top: 50px;
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;
            border: 2px solid black;
        }

        h1 {
            margin-top: 30px;
            margin-bottom: 30px;
            color: #333333;
            text-align: center;
            font-size: 30px;
        }

        .post-detail {
            width: 100%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .post-detail h1 {
            font-size: 2em;
            margin-bottom: 10px;
            color: #333;
        }

        .post-image {
            width: 100%;
            max-width: 300px; /* 이미지 최대 너비를 300px로 설정 */
            display: block;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-info {
            margin-bottom: 10px;
            color: #333;
        }

        .product-info span {
            font-weight: bold;
            display: inline-block;
            width: 100px;
            color: #F4AC45;
        }

        .post-detail p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #555;
        }

        .comment {
            border: 2px solid black;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            background-color: white;
        }

        .comment p {
            margin: 0;
            color: #777;
        }

        form {
            margin-top: 20px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container post-detail">
        <h1><%= product.getTitle() %></h1>
        <img src="<%= request.getContextPath() + "/" + product.getImageUrl() %>" alt="상품 이미지" class="post-image"/>
        <p><%= product.getContent() %></p>

        <h2>댓글</h2>
        <%
            // 데이터베이스 연결 설정
            String dbURL = "jdbc:oracle:thin:@localhost:1522"; // 데이터베이스 URL
            String dbUser = "scott"; // 사용자 이름
            String dbPass = "tiger"; // 비밀번호

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // 데이터베이스 연결
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // SQL 쿼리 작성
                String sql = "SELECT * FROM comments WHERE productID = ?";

                // SQL 쿼리 실행
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, productId);
                rs = pstmt.executeQuery();

                // 결과 처리 및 HTML 카드 생성
                while (rs.next()) {
                    String commentID = rs.getString("commentID");
                    String productID = rs.getString("productID");
                    String content = rs.getString("content");
                    String commentUserID = rs.getString("userID");
        %>
                    <div class="comment">
                        <p><%= commentUserID %> : <%= content %></p>
                    </div>
        <%
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                // 데이터 조회 중 오류가 발생했을 때 메시지 출력 안 함
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>

        <form action="commentProcess.jsp" method="post">
            <input type="hidden" name="productID" value="<%= productId %>" readonly>
            <label for="comment">댓글:</label>
            <textarea id="comment" name="content" required></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>
</body>
</html>
