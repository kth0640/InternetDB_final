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

    .form-group label, .phone-div label {
        display: block;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    .btn-primary {
        background-color: #92BFB1;
        border: 2px solid black;
        border-radius : 10px;
        color: black;
        cursor: pointer;
        padding : 10px;
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
            <legend>등록된 정보로 아이디 찾기</legend>
            <form method="post" action="./findUserIDAction.jsp">
                <div class="form-group">
                    <label>이메일</label>
                    <input type="text" name="userEmail" class="form-control">
                </div>
                <div class="phone-div">
                    <label>전화번호</label>
                    <input type="text" class="form-control" name="phone" oninput="oninputPhone(this)" maxlength="14">
                </div><br><br>
                <button type="submit" class="btn btn-primary">아이디 찾기</button>
            </form>
        </fieldset>
    </section>
    <script>
        function oninputPhone(target) {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
        }
    </script>
</body>
</html>
