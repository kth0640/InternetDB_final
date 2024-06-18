<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 입력 폼</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #ECF39E;
            padding: 60px;
            border-radius: 50px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            border: 2px solid black;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333333;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #92BFB1;
            color: black;
            border: 2px solid black;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #ECF39E;
        }
    </style>
</head>
<body>
    <form action="./processProduct.jsp" method="post">
        <label for="productName">상품 이름:</label>
        <input type="text" id="productName" name="productName" required>
        
        <label for="productPrice">상품 가격:</label>
        <input type="number" id="productPrice" name="productPrice" required>
        
        <label for="productDescription">상품 설명:</label>
        <textarea id="productDescription" name="productDescription" required></textarea>
        
        <input type="submit" value="제출">
    </form>
</body>
</html>
