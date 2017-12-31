<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>综合教务管理系统</title>
    <link href="/assets/css/frame.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/changeFrame.js"></script>
</head>
<body>
<div id="header">
    <div class="header">
        <div id="logo">
            <div id="subMenu">
                <ul>
                    <li><a href="/index" target="_top">首页</a></li>
                    <li><a href="/logout_security_check" target="_top">退出</a></li>
                    <li><a href="/showPersonalInfo" target="mainFrame">我的信息</a></li>
                    <li><a href="/changepw" target="mainFrame">修改密码</a></li>
                </ul>
            </div>
            <div id="greeting" align="right">您好！<span id="userinfo">${userName}</span>，欢迎登录 </div>
        </div>
        <div class="topSidebar"><a href="#" title="点击收缩">sideBar</a></div>
        <div class="nav_left"></div>
    </div>
</div>
</body>
</html>