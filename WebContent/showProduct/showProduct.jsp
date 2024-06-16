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
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .product-card {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-info {
            margin-bottom: 5px;
        }
        .product-info span {
            font-weight: bold;
            display: inline-block;
            width: 80px;
        }
        .product-card:not(:last-child) {
            border-bottom: 2px solid #ddd;
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
                    String dbURL = "jdbc:oracle:thin:@localhost:1521"; // 데이터베이스 URL
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
                        String sql = "SELECT product_id, product_name, price, description FROM products";

                        // SQL 쿼리 실행
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // 결과 처리 및 HTML 카드 생성
                        while (rs.next()) {
                            String productName = rs.getString("product_name");
                            double productPrice = rs.getDouble("price");
                            String productDescription = rs.getString("description");
                %>
                            <div class="col-md-12">
                                <div class="product-card">
                                    <div class="product-info">
                                        <span>상품 이름:</span> <%= productName %>
                                    </div>
                                    <div class="product-info">
                                        <span>가격:</span> <%= productPrice %> 원
                                    </div>
                                    <div class="product-info">
                                        <span>설명:</span> <%= productDescription %>
                                    </div>
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
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
