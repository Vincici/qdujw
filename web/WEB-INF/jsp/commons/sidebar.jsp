<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/assets/css/frame.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/changeFrame.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function () {
                menu("menu", "cur", "cur", "slide");
                var heightVal = (document.body.clientHeight - 53) + "px";
                $('#menuWrap').css('height', heightVal);
                window.onresize = function () {
                    var heightVal = (document.body.clientHeight - 53) + "px";
                    $('#menuWrap').css('height', heightVal);
                }
            }
        );
    </script>
    <style type="text/css">
        html, body {
            scrollbar-3d-light-color: #FFF;
            scrollbar-arrow-color: #fff;
            scrollbar-base-color: #fff;
            scrollbar-dark-shadow-color: #fff;
            scrollbar-face-color: #6D5589;
            scrollbar-highlight-color: #FFF;
            scrollbar-shadow-color: #FFF;
        }
    </style>
</head>
<body class="menuFrame" onload="leftListLoadFinish()">
<div class="wrap" id="wrap">
    <div id="date">
        <p>
            <br><span>导航菜单</span></p>
    </div>
    <div id="slideMenu">
        <div class="menuWrap" id="menuWrap">
            <ul id="menu">
                <c:forEach items="${pmenu}" var="pm">
                <li id="pmenu">
                    <a href="${pm.url}" target="mainFrame">
                        <span>${pm.permissionName}</span>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<div class="sidebar">
    <a action="#" title="点击收缩">sidebar</a>
</div>
</body>

</html>