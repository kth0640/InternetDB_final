<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>

<%
    // 이미지 저장 경로를 웹 서버의 접근 가능한 디렉토리로 설정
    String path = application.getRealPath("/upload");
    File uploadDir = new File(path);
    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }

    MultipartRequest multi = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요');");
        script.println("location.href='../login&register/userLogin.jsp';");
        script.println("</script>");
        script.close();
        return;
    }

    String title = multi.getParameter("title");
    String price = multi.getParameter("price");
    String content = multi.getParameter("content");
    String imageUrl = null;
    String file = null;
    String filename = null;

    if (title == null || title.isEmpty() || price == null || price.isEmpty() || content == null || content.isEmpty()) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    // 이미지 파일명 추출
    Enumeration<?> files = multi.getFileNames();
    file = (String) files.nextElement();
    filename = multi.getFilesystemName(file);
    imageUrl = "upload/" + filename;

    ProductDAO productDAO = new ProductDAO();
    int result = productDAO.addProduct(new ProductDTO(0, userID, title, price, content, 0, imageUrl));

    if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('상품등록에 실패했습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href='../main.jsp';");
        script.println("</script>");
        script.close();
    }
%>
