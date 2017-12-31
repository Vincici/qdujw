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
    <script language="JavaScript" type="text/JavaScript">
    </script>
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
            padding-left: 20px
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
                <div>角色管理</div>
            </td>
        </tr>
        </tbody>
    </table>
    <table cellspacing="0" cellpadding="0" class="subtitle">
        <tbody><tr>
            <td class="subtitle">角色管理说明</td>
            <td>&nbsp;</td>
            <td id="rightbg">&nbsp;</td>
        </tr>
        </tbody></table>

    <table cellpadding="0" cellspacing="0" class="explain_tab">
        <tbody><tr>
            <td class="explain">
                <p align="left">角色的控制在系统中是通过角色的id来进行识别的，设置角色时一定要设置好相应id,系统初始化时默认添加了4个默认角色，不可删除，若角色系统出错且无法修复时请联系系统管理员</p>
            </td>
        </tr>
        </tbody></table>
    <br>
    <table cellpadding="0" cellspacing="0" class="datalist">
        <tbody>
        <tr>
            <form action="course/courseOutput.jsp" method="post">
                <td colspan="2" align="center">新建角色</td>
                <td>角色id:<input type="number" value="" min="6" style="width:60%;"></td>
                <td>角色名称：<input type="text" value=""></td>
                <td><input type="checkbox">是否继承已有角色权限<select>
                    <c:forEach items="${allrole}" var="al">
                    <option value="${al.roleId}">${al.roleName}</option>
                    </c:forEach>
                </select>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" value="确定"></td>
            </form>
        </tr>
        </tbody>
    </table>
    <table cellpadding="0" cellspacing="0" class="datalist">
        <tbody>
        <tr>
            <th name="td0">角色id</th>
            <th name="td0">角色名称</th>
            <th name="td1">删除</th>
        </tr>
        <c:forEach items="${allrole}" var="al">
            <tr align="center">
                <td name="td0">${al.roleId}</td>
                <td name="td5">${al.roleName}</td>
                <td name="td2"><a href="/api/deleterole"><img src="/assets/image/icodelete.gif"/></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>