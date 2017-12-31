<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="/assets/css/text.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/main.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/content.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="/assets/js/common.js"></script>
    <script language="javascript" src="/assets/js/general.js"></script>
    <style>
        #title {
            width: 92%;
            border: 0px;
            margin-bottom: 10px;
        }

        #title td {
            text-align: center;
            height: 20px;
            line-height: 150%
        }

        #title div {
            background-image: url(/assets/image/dot_02.gif);
            background-position: left top;
            background-repeat: no-repeat;
            margin: 0 auto;
            padding-left: 20px;
            text-align: left;
            width: 10%;
            font-size: 15px;
            font-weight: bold;
            color: #CC0000;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
<form name="form1" method="post" action="">
    <table cellspacing="0" cellpadding="0" id="title" align="center">
        <tbody>
        <tr>
            <td nowrap="nowrap">
                <div>权限管理&nbsp;&nbsp;&nbsp;</div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <table cellspacing="0" cellpadding="0" class="subtitle">
        <tbody>
        <tr>
            <td class="subtitle">权限管理说明</td>
            <td>&nbsp;</td>
            <td id="rightbg">&nbsp;</td>
        </tr>
        </tbody>
    </table>

    <table cellpadding="0" cellspacing="0" class="explain_tab">
        <tbody>
        <tr>
            <td class="explain">
                <p align="left">权限的控制在系统中是通过权限的id来进行识别的，设置权限时一定要对应好相应权限和角色的id,若权限系统出错且无法修复时请联系系统管理员</p>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <br>
    <table cellspacing="0" cellpadding="0" id="title" align="center">
        <tbody>
        <tr>
            <td nowrap="nowrap">
                <div>菜单管理&nbsp;&nbsp;&nbsp;</div>
            </td>
        </tr>
        </tbody>
    </table>
    <table cellpadding="0" cellspacing="0" class="datalist">
        <tbody>
        <tr>
            <th name="td0">父权限id</th>
            <th name="td1">父权限名称</th>
            <th name="td1">跳转页面</th>
            <th name="td7">选项</th>
        </tr>
        <c:forEach items="${all}" var="all">
        <tr align="center">
            <td name="td0">${all.permissionId}</td>
            <td name="td1">${all.permissionName}</td>
            <td name="td2">${all.url}</td>
            <td name="td7">
                <input type="submit" class="button" value="删除该权限菜单">
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>