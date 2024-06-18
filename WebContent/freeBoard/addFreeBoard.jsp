<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 입력</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            border: 2px solid black;
            background-color: #ECF39E;
            width: 400px;
        }
        .form-group label {
            font-weight: bold;
            color: #333333;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }
        .form-group textarea {
            height: 150px;
            resize: none;
        }
        .btn-primary {
      		color: black;
            background-color: #92BFB1;
            border: 2px solid black;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
       		color: black;
            background-color: #ECF39E;
            border: 2px solid black;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center">게시글 작성</h2>
        <form action="./processFreeBoard.jsp" method="post">
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">작성자:</label>
                <input type="text" id="author" name="author" required>
            </div>
            <div class="form-group">
                <label for="contents">내용:</label>
                <textarea id="contents" name="contents" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
