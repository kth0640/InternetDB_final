<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    section {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    #IDform {
        font-size: 1em;
        font-weight: 500;
        padding: 50px;
        background-color: #ECF39E;
        border: 2px solid black;
        border-radius: 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #000; /* 테두리 스타일 추가 */
        border-radius: 4px;
    }

    .btn-primary {
        background-color: #92BFB1;
        border: 2px solid black;
        border-radius: 10px;
        color: black;
        cursor: pointer;
        padding: 10px;
        width: 60%;
        font-size: 1em;
        font-weight: 500;
    }

    .links {
        text-align: center;
        margin-top: 5px;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <section>
        <fieldset id="IDform">
            <legend>등록된 정보로 비밀번호 찾기</legend>
            <form method="post" action="./findUserPasswordAction.jsp">
                <div class="form-group">
                    <label>아이디</label>
                    <input type="text" name="userID" class="form-control">
                </div>
                <div class="form-group">
                    <label>이메일</label>
                    <input type="text" id="userEmail" name="userEmail" class="form-control">
                </div><br>
                <button type="submit" class="btn btn-primary">확인</button>
            </form>
        </fieldset>
    </section>
</body>
</html>
