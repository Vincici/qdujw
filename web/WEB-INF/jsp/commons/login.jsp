<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>综合教务管理系统</title>
    <link href="/assets/css/login.css" rel="stylesheet" type="text/css"/>
    <script src="/assets/js/jquery.min.js"></script>
    <script language="javascript" type="text/javascript">
        function showdiv() {
            document.getElementById("bg").style.display = "block";
            document.getElementById("show").style.display = "block";
        }

        function hidediv() {
            document.getElementById("bg").style.display = 'none';
            document.getElementById("show").style.display = 'none';
        }

        function myBrowser() {
            var isChrome = window.navigator.userAgent.indexOf("Chrome") > -1;
            if (isChrome) {
                return true;
            } else {

            }
        }
    </script>
    <style type="text/css">
        #bg {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.7;
            opacity: .70;
            filter: alpha(opacity=100);
        }

        #show {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 30%;
            height: 20%;
            padding: 8px;
            border: 1px solid #E8E9F7;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
    </style>
</head>
<body onload="myBrowser()">
<div class="login">
    <div class="loginbox">
        <div class="login_top"></div>
        <div class="loginmain">
            <div class="loginname">用户名：
                <input id="j_username" name="j_username" type="text">
            </div>
            <div class="loginpwd">密 &nbsp;码：
                <input id="j_password" name="j_password" type="password">
            </div>
            <div><span style="color: #9F0000" id="error"></span></div>
            <input id="btn_login" type="submit" value="" class="loginbtn">
            <input id="btn_reset" type="reset" value="" class="resetbtn"></div>
    </div>
</div>
<div id="bg"></div>
<div id="show" align="center"><img src="/assets/image/loading.gif"/></div>
<script src="/assets/js/login.js"></script>
</body>
</html>
