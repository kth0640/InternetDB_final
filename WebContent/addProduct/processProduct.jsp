<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page isErrorPage="false" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
    // 데이터베이스 연결 설정
    String dbURL = "jdbc:oracle:thin:@localhost:1521"; // 데이터베이스 URL
    String dbUser = "scott"; // 사용자 이름
    String dbPass = "tiger"; // 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
    	request.setCharacterEncoding("UTF-8");
        // 폼 데이터 받기
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productDescription = request.getParameter("productDescription");

        // 데이터베이스 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // 자동 커밋 비활성화
        conn.setAutoCommit(false);

        // 시퀀스를 사용하여 PRODUCT_ID 자동으로 생성
        String getProductIdSQL = "SELECT PRODUCT_SEQ.NEXTVAL FROM dual";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(getProductIdSQL);
        rs.next();
        int productId = rs.getInt(1);

        // SQL 쿼리 작성
        String sql = "INSERT INTO products (product_id, product_name, price, description) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // 파라미터 설정
        pstmt.setInt(1, productId);
        pstmt.setString(2, productName);
        pstmt.setDouble(3, Double.parseDouble(productPrice));
        pstmt.setString(4, productDescription);

        // 데이터 삽입
        pstmt.executeUpdate();

        // 커밋
        conn.commit();

        // 메인 페이지로 리다이렉트
        response.sendRedirect("../Main.jsp");
    } catch (SQLException sqle) {
        sqle.printStackTrace();
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        out.println("상품 추가 중 오류가 발생했습니다: " + sqle.getMessage());
    } catch (ClassNotFoundException cnfe) {
        cnfe.printStackTrace();
        out.println("상품 추가 중 오류가 발생했습니다: " + cnfe.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) {
            conn.setAutoCommit(true); // 자동 커밋 모드 복원
            conn.close();
        }
    }
%>
