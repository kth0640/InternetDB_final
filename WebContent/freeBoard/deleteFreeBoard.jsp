<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String dbURL = "jdbc:oracle:thin:@//localhost:1521"; // 데이터베이스 URL, SID 대신 서비스 이름 사용
    String dbUser = "scott"; // 사용자 이름
    String dbPass = "tiger"; // 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 데이터베이스 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // 요청 파라미터로부터 ID 값 가져오기
        int id = Integer.parseInt(request.getParameter("id"));

        // SQL 쿼리 작성
        String sql = "DELETE FROM freeboard WHERE id = ?";

        // SQL 쿼리 실행
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>alert('게시글이 성공적으로 삭제되었습니다.'); location.href='freeBoard.jsp';</script>");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
        out.println("<script>alert('게시글 삭제 중 오류가 발생했습니다: " + ex.getMessage() + "'); location.href='freeBoard.jsp';</script>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
