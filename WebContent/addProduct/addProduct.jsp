<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 입력 폼</title>
    <link rel="stylesheet" href="../css/addProduct.css">
</head>
<body>
    <form action="./processProduct.jsp" method="post">
        <label for="productName">상품 이름:</label>
        <input type="text" id="productName" name="productName" required><br><br>
        
        <label for="productPrice">상품 가격:</label>
        <input type="number" id="productPrice" name="productPrice" required><br><br>
        
        <label for="productDescription">상품 설명:</label>
        <textarea id="productDescription" name="productDescription" required></textarea><br><br>
        
        <input type="submit" value="제출">
    </form>
</body>
</html>
