<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>教师通讯录</title>
    <link href="/system/styles/css/text.css" rel="stylesheet" type="text/css">
    <link href="/system/styles/css/main.css" rel="stylesheet" type="text/css">
    <link href="/system/styles/css/title.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" language="javascript" src="/system/styles/js/selectTime.js"></script>
    <script type="text/javascript" language="javascript" src="/system/styles/js/page.js"></script>
</head>
<body>
<center>
    <table cellspacing="0" cellpadding="0" id="title" align="center">
    <tbody><tr>
        <td nowrap="nowrap"><div>教师通讯录</div></td>
    </tr>
    </tbody></table>
    <form name="form1" method="post" action="">
        <table class="form" cellspacing="0" cellpadding="0">
            <tr>
                <td width="35%">
                    查询条件： 组别：
                    <select name="jyz">
                        <option value="36" selected>全部</option>
                        <option value="30">语文教研组</option>
                        <option value="30">数学教研组</option>
                        <option value="30">英语教研组</option>
                        <option value="30">物理教研组</option>
                        <option value="30">化学教研组</option>
                        <option value="30">生物教研组</option>
                        <option value="30">政治教研组</option>
                        <option value="30">历史教研组</option>
                        <option value="30">地理教研组</option>
                        <option value="30">信息技术教研组</option>
                        <option value="30">体育教研组</option>
                        <option value="30">美术教研组</option>
                        <option value="30">音乐教研组</option>
                    </select>
                    <select name="grade" >
                        <option value=""selected>全部</option>
                        <option value="1">高一</option>
                        <option value="2" >高二</option>
                        <option value="3" >高三</option>
                    </select>
                <td>
                    <input type="submit" name="Submit" class="button" value="查询">
                </td>
            </tr>
        </table>
    </form>
    <br>
    <table width="100%" class="datalist" align="center">
        <tr align="center">
            <th>年级</th><th>教研组</th><th>教师姓名</th><th>手机号</th><th>家庭电话</th>
        </tr>
        <tr align="center">
            <td>高二</td><td>英语</td><td>常建秀</td><td>15064696067</td><td>无</td>
        </tr>
        <tr align="center">
            <td>高二</td><td>化学</td><td>吕咸森</td><td>15253629217</td><td>无</td>
        </tr>
    </table>

</center>
</body>
</html>
