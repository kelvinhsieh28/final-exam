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
    <link rel="stylesheet" href="../assets/css/create.css">
</head>
<body>
    <div class="form">
        <div class="back">
            <a href="index.html"><button class="button02">返回首頁</button></a>
        </div>
        
        <div class="title">
            <p>會員註冊</p>
        </div>
        <form action="crat.jsp" method="post">
        <div class="mainform">
            <div class="text1">
                <input type="text" name="Account" placeholder="請輸入帳號">
            </div>
            
            <div class="text1">
                <input type="password" name="Password" placeholder="請輸入密碼">
            </div>
            
            <div class="text1">
                <input type="password" name="Repassword" placeholder="請確認密碼">
            </div>
            
            <div class="text1">
                <input type="email" name="email" placeholder="請輸入信箱">
            </div>
        </div>

        <div class="sexform">
            <div class="male">
            <input type="radio" id="male" name="sex" checked><label for="male">男生 Male</label>
            </div>

            <div class="female">
            <input type="radio" id="female" name="sex"><label for="female">女生 Female</label></p>
            </div>
        </div>
        <div class="create">
            <div class="button01">
                <input type="submit" value="註冊" class="button02">
            </div>
        </div>
    </form>
    </div>
</body>
</html>
