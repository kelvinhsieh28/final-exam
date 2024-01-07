<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.* "%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>
    <div class="form">
        <div class="back">
            <a href="index.html"><button class="button02">返回首頁</button></a>
        </div>
        
        <div class="title">
            <p>會員登入 login</p>
        </div>
        <form action="log.jsp" method="get">
            <div class="text1">
                <input type="text" name="Account" placeholder="請輸入帳號">
            </div>
            <div class="text1">
                <input type="password" name="Password" placeholder="請輸入密碼">
            </div>
            <div class="button">
                <div class="button01">
                    <input type="submit" class="button02" value="登入">
                </div>
                <div class="button01">
                    <a href="create.html"><button class="button02">註冊</button></a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>