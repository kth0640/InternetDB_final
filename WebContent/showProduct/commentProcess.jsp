<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="comment.CommentDTO" %>   
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
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

int productID = Integer.parseInt(request.getParameter("productID"));
String content = request.getParameter("content");


if (content == null || content.isEmpty()) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('댓글을 입력해주세요.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
}
System.out.println(productID + content + userID);
CommentDAO commentDAO = new CommentDAO();
int result = commentDAO.addComment(new CommentDTO(0, productID, content, userID));

if (result == -1) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('댓글등록에 실패했습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
} else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("window.location.href ='postDetail.jsp?productID"+ productID +"';");
    script.println("</script>");
    script.close();
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>