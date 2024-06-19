<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
    request.setCharacterEncoding("utf-8");
    String userID = null;
    String userEmail = null;
    String phone = null;
    String adress = null;

    if (session.getAttribute("userID") != null) { // 로그인 한 상태라면
        userID = (String) session.getAttribute("userID");
    }
    
		UserDAO userDAO = new UserDAO();
    UserDTO userInfo = UserDAO.showUserInfo(userID);
    userEmail = userInfo.getUserEmail();
    phone = userInfo.getPhone();
    adress = userInfo.getAdress();
    
%>
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
<title>마이페이지</title>
</head>
<body>
    <section>
        <fieldset id="IDform">
            <legend>마이페이지</legend>
            <form action="./userRegisterAction.jsp" method="post">
                <div class="form-group">
                    <label>아이디</label>
                    <input type="text" id="userID" name="userID" value="<%=userID%>" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label>이메일</label>
                    <input type="text" id="userEmail" name="userEmail" value="<%=userEmail%>" class="form-control"readonly>
                </div>
                <div class="form-group">
                    <label>전화번호</label>
                    <input type="text" class="form-control" name="phone" value="<%=phone%>" oninput="oninputPhone(this)" maxlength="14"readonly>
                </div>
                <div class="form-group">
                    <label>주소</label>
                    <input type="text" name="adress" value="<%=adress%>" class="form-control" readonly>
                </div><br>
                <input type="button" class="btn btn-primary" onClick='history.back();' style="margin-top:10px;" value="확인">
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
