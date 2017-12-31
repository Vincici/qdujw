<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>修改密码</title>
    <link href="/assets/css/content.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="/assets/js/common.js"></script>
    <script language="javascript" src="/assets/js/general.js"></script>
    <script type="text/javascript">
        function meterPasswordStrength(password) {
            var isEasy = false;
            if (password.length < 6)
                isEasy = true;
            if (!((password.match(/[a-z]/ig)) && ((password.match(/[0-9]/ig)))))
                isEasy = true;
            if (isEasy) {
                alert("密码必须大于等于6个字符，并且包含字母和数字！");
                return false;
            }
            else
                return true;
        }
        function checkForm(jw_password, jw_confirmedpasswd) {
            if (jw_password != jw_confirmedpasswd) {
                alert("密码不一致！");
                return false;
            }
            if (jw_password == "${sessionScope.user.userName}") {
                alert("密码不能与用户名相同！");
                return false;
            }
            else
                return meterPasswordStrength(jw_password);
        }
    </script>
<style>
    #title{
        width:92%;
        border:0px;
        margin-bottom:10px;
    }
    #title td{
        text-align:center;
        height:20px;
        line-height:150%
    }
    #title div{
        background-image: url(/assets/image/dot_02.gif);
        background-position:left top;
        background-repeat:no-repeat;
        margin:0 auto;
        padding-left:20px;
        text-align:left;
        width:10%;
        font-size: 15px;
        font-weight: bold;
        color: #CC0000;
        letter-spacing: 2px;
    }
</style>
</head>
<body>
<center>

    <table cellspacing="0" cellpadding="0" id="title">
        <tbody>
        <tr>
            <td nowrap="nowrap">
                <div>修改密码</div>
            </td>
        </tr>
        </tbody>
    </table>

    <form action="/api/modifypassword" method="post" onsubmit="return checkForm(this.jw_password.value,this.jw_confirmedpasswd.value)">
        <table cellpadding="0" cellspacing="0" class="broken_tab">
            <tbody>
            <tr>
                <td nowrap="nowrap">新密码</td>
                <td><input type="password" name="jw_password" value="">
                </td><td rowspan="2" class="center" width="15%"><input type="submit" name="ff" value="修 改" class="button"></td>
            </tr>
            <tr>
                <td nowrap="nowrap">确认新密码</td>
                <td><input type="password" name="jw_confirmedpasswd" value=""></td>
            </tr>
            </tbody>
        </table>
        <br>
        <table cellpadding="0" cellspacing="0" class="explain_tab">
            <tbody>
            <tr>
                <td>
                    <div>
                        <div id="explain_title">说明：</div>
                        <div id="explain_content">密码不能包含大于符号、小于符号、引号、中文、全角字符，前后也不能有空格！密码必须大于等于6个字符，并且包含字母和数字！</div>

                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</center>
</body>
</html>