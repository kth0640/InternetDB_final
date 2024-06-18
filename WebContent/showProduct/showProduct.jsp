<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page isErrorPage="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
            width: 80%;
            max-width: 800px;
            background-color: #ECF39E;
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

        .product-card {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-left: 5px solid #92BFB1;
            border-radius: 5px;
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

        .product-card:not(:last-child) {
            border-bottom: 2px solid #92BFB1;
        }

        .nav-buttons {
            text-align: center;
            margin-bottom: 20px;
        }

        .nav-buttons button {
            background-color: #92BFB1;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 5px;
        }

        .nav-buttons button:hover {
            background-color: #76a69a;
        }

        .product-info img {
            max-width: 200px; /* 이미지의 최대 너비를 200px로 설정 */
            max-height: 200px; /* 이미지의 최대 높이를 200px로 설정 */
            display: block;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="text-center">
            <h1>상품 목록</h1>
        </header>
        <div class="product-list">
            <div class="row">
                <%
                    // 데이터베이스 연결 설정
                    String dbURL = "jdbc:oracle:thin:@localhost:1522"; // 데이터베이스 URL
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
                        String sql = "SELECT productID, userID, title, price, product_content, createdAt, imageUrl FROM product";
							
                        // SQL 쿼리 실행
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // 결과 처리 및 HTML 카드 생성
                        while (rs.next()) {
                        	 String productID = rs.getString("productID");
                             String userID = rs.getString("userID");
                             String title = rs.getString("title");
                             String price = rs.getString("price");
                             String productContent = rs.getString("product_content");
                             Date createdAt = rs.getDate("createdAt");
                             String imageUrl = rs.getString("imageUrl");
                 %>
                
                			
                            <div class="col-md-12">
                                <div class="product-card" onclick="postDetail('<%= productID %>')">
                                    <div class="product-info">
                                        <span>제목:</span> <%= title %>
                                    </div>
                                    <div class="product-info">
                                        <span>가격:</span> <%= price %> 원
                                    </div>
                                    <div class="product-info">
                                        <span>내용:</span> <%= productContent %>
                                    </div>
                                    <div class="product-info">
                                        <span>등록일:</span> <%= createdAt %>
                                    </div>
                                    <div class="product-info">
                                        <span>이미지:</span> <img src="<%= request.getContextPath() + "/" + imageUrl %>" alt="Product Image">
                                    </div>
                                </div>
                            </div>
                            <script>
                            	function postDetail(productId) {
                            		window.location.href ='postDetail.jsp?productID' + productId;
                            	}
                            </script>
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
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
