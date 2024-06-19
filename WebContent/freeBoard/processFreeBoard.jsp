<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page isErrorPage="false" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
    String dbURL = "jdbc:oracle:thin:@//localhost:1522"; // 데이터베이스 URL
    String dbUser = "scott"; // 사용자 이름
    String dbPass = "tiger"; // 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;

    boolean isSuccess = false;

    try {
        request.setCharacterEncoding("UTF-8");
        
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String contents = request.getParameter("contents");

        // 데이터베이스 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // 자동 커밋 비활성화
        conn.setAutoCommit(false);
     
        // SQL 쿼리 작성
        String sql = "INSERT INTO freeboard (id, title, author, contents) VALUES (freeboard_seq.NEXTVAL, ?, ?, ?)";

        // SQL 쿼리 실행
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, author);
        pstmt.setString(3, contents);
        pstmt.executeUpdate();

        // 커밋
        conn.commit();
        
        isSuccess = true;
    } catch (Exception ex) {
        ex.printStackTrace();
        out.println("<h2>게시글 등록 중 오류가 발생했습니다: " + ex.getMessage() + "</h2>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <% if (isSuccess) { %>
            <script>
                alert("게시글이 성공적으로 등록되었습니다.");
                location.href='freeBoard.jsp';
            </script>
        <% } else { %>
            <h2>게시글 등록 중 오류가 발생했습니다.</h2>
            <button class="btn btn-primary" onclick="location.href='freeBoard.jsp'">게시판으로 돌아가기</button>
        <% } %>
    </div>
</body>
</html>
