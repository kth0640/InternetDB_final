<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="java.lang.*" %>

	
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
	  userID = (String) session.getAttribute("userID");
	}

	String url = request.getQueryString();
	char id = url.charAt(url.length()-1);
    int productId = Integer.parseInt(String.valueOf(id));
    ProductDAO productDAO = new ProductDAO();
   	ProductDTO product = productDAO.getProductById(productId);
	
%>

<!DOCTYPE html>
<html>	
	
<head>
	
    <title>게시물 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .post-detail {
            width: 80%;
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
            max-width: 600px;
            display: block;
            margin: 20px 0;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-info {
            margin-bottom: 10px;
            color: #333;
        }

        .post-detail p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #555;
        }

        .comment {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
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

    <div class="post-detail">
        <h1><%= product.getTitle() %></h1>
        
        <img src="<%= request.getContextPath() + "/" +product.getImageUrl()%>" alt="상품 이미지" class="post-image"/>
        <p><%= product.getContent() %></p>
        
        <h2>댓글</h2>
        <!— 댓글 표시 영역 —>
        
        <%
                    // 데이터베이스 연결 설정
                    String dbURL = "jdbc:oracle:thin:@localhost:1522"; // 데이터베이스 URL
                    String dbUser = "scott"; // 사용자 이름
                    String dbPass = "tiger"; // 비밀번호

                    Connection conn = null;
                    PreparedStatement pstmt = null;
                   // Statement stmt = null;
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
                       // stmt = conn.createStatement();
                       // stmt.setInt(1, productId);
                        //rs = stmt.executeQuery(sql);
						
                        // 결과 처리 및 HTML 카드 생성
                        while (rs.next()) {
                        	 String commentID = rs.getString("commentID");
                             String productID = rs.getString("productID");
                             String content = rs.getString("content");                           
                             String commentuserID = rs.getString("userID");
                            // Date createdAt = rs.getDate("createdAt");
                     
                 %>
					  <div class="col-md-12">
                                <div class="product-card" onclick="postDetail('<%= productId %>')">
                                    <div class="product-info" style="margin-top:5px;">
                                        <span><%=commentuserID %> : <%=content%> </span>
                                        <hr>
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
                        if(pstmt!=null) pstmt.close();
                        //if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
        <form action="commentProcess.jsp" method="post">
            <input type="hidden" name="productID" value="<%=productId%>" readonly>
            <label for="comment">댓글:</label>
            <textarea id="comment" name="content" required></textarea>
            <button type="submit">댓글 작성</button>
        </form>
    </div>
    
   	
</body>
</html>
