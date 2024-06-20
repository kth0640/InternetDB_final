<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page isErrorPage="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메타버스</title>
  <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
  <script src="https://cdn.rawgit.com/donmccurdy/aframe-extras/v6.1.1/dist/aframe-extras.min.js"></script>
  <style>
    body {
      margin: 0;
      overflow: hidden;
    }
  </style>
</head>
<body>
  <a-scene>
    <a-sky color="#ECECEC"></a-sky>

    <!-- 3D 무료 모델 (크기,위치설정) -->
    <a-entity 
      id="palace" 
      gltf-model="#palaceModel" 
      position="0 0 -5" 
      scale="5 5 5"
      geometry="primitive: box"
      material="opacity: 0; transparent: true">
    </a-entity>

    <!-- 카메라 -->
    <a-entity 
      id="camera" 
      camera 
      wasd-controls 
      look-controls
      position="0 0 15" 
      boundary-constraint="minX: -5; maxX: 5; minZ: -50; maxZ: 25"
      jump="height: 2; duration: 500">
    </a-entity>

    <!-- Assets -->
    <a-assets>
      <a-asset-item id="palaceModel" src="<%= request.getContextPath() %>/assets/palace.glb"></a-asset-item>
          <%
                    // 데이터베이스 연결 설정
                    String dbURL = "jdbc:oracle:thin:@localhost:1522"; // 데이터베이스 URL
                    String dbUser = "scott"; // 사용자 이름
                    String dbPass = "tiger"; // 비밀번호
                    int i=1;

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
                   			    <img id=<%=i %> src="<%= request.getContextPath() + "/" + imageUrl %>" alt="Product Image" onclick="postDetail('<%= productID %>')">			
                        <script>
                            	function postDetail(productId) {
                            		var url = '<%= request.getContextPath() %>/showProduct/postDetail.jsp?productID=' + productId;
                            		window.location.href = url;
                            	}
                            </script>
                <%
                     i++;   }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                        out.println("데이터 조회 중 오류가 발생했습니다: " + ex.getMessage());
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
    </a-assets>

    <!-- Image entity -->
    <a-image src="#1" position="14 2 1" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#2" position="-14 2 1" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#3" position="14 2 -15" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#4" position="-14 2 -15" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#5" position="14 2 -45" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#6" position="-14 2 -45" width="6" height="8" rotation="0 90 0"></a-image>

    <a-image src="#7" position="14 2 -59" width="6" height="8" rotation="0 90 0"></a-image>
    <a-image src="#8" position="-14 2 -59" width="6" height="8" rotation="0 90 0"></a-image>
  </a-scene>
  <script src="<%= request.getContextPath() %>/js/vr.js"></script>
</body>
</html>
