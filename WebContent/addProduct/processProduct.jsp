<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page isErrorPage="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.oreilly.servlet.*" %> 
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>

<%
	

	MultipartRequest multi = new MultipartRequest(request, "D:\\upload", 5*1024*1024, 
			"utf-8",new DefaultFileRenamePolicy());
	
	String userID = null;

	
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href='../login&register/userLogin.jsp';");
		script.println("</script>");
		script.close();
	}
	
	String title = null;
	String price = null;
	String content = null;
	String imageUrl =null;
	String file = null;
	String filename = null;
	String path = "D:\\upload\\";
	
	title  = multi.getParameter("title");
	price  = multi.getParameter("price");
	content  = multi.getParameter("content");
	
	if(title == null||title.isEmpty()  || price == null || price.isEmpty()|| content==null || content.isEmpty()){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	//url 생성
	Enumeration files = multi.getFileNames();
	file = (String)files.nextElement();
	filename = multi.getFilesystemName(file);
	imageUrl = path.concat(filename);
	
	
	ProductDAO productDAO = new ProductDAO();
	int result = productDAO.addProduct(new ProductDTO(0, userID, title, price, content, 0, imageUrl));
	out.println(title+"<br>");
	out.println(price+"<br>");
	out.println(content+"<br>");
	out.println(file+ "<br>");
	out.println(filename+ "<br>");
	out.println(imageUrl+ "<br>");
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품등록에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='../main.jsp';");
		script.println("</script>");
		script.close();
	}
	//public ProductDTO(int productID, String userID, String title, String price, String content, String createdAt,String imageUrl)

	
	
%>
