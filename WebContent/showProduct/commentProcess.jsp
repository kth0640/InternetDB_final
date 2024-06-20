<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="comment.CommentDTO" %>   

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="commentDTO" class="comment.CommentDTO"/>
<jsp:setProperty name="commentDTO" property="*"/>
<!DOCTYPE html>
<%

String isLogin = null;
if (session.getAttribute("userID") != null) {
    isLogin = (String) session.getAttribute("userID");
}

if (isLogin == null) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 해주세요');");
    script.println("location.href='../login&register/userLogin.jsp';");
    script.println("</script>");
    script.close();
    return;
}

//int productID = Integer.parseInt(request.getParameter("productID"));
//String content = request.getParameter("content");


if (commentDTO.getContent() == null ) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('댓글을 입력해주세요.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
}
System.out.println(commentDTO.getProductID() + commentDTO.getContent() + commentDTO.getUserID());

CommentDAO commentDAO = new CommentDAO();
int result = commentDAO.addComment(commentDTO);

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
    script.println("window.location.href ='postDetail.jsp?"+ commentDTO.getProductID() +"';");
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