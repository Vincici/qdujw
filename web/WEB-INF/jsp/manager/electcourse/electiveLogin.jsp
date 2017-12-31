<%@ page import="com.model.StudentInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentInfo student = (StudentInfo) session.getAttribute("student");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户登录</title>
    <link href="../../styles/css/info.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../../styles/js/jQuery1.7.1.js"></script>
</head>
<body class="login">
<div class="login">
    <div class="top">&nbsp;</div>
    <div class="middle">
        <div class="error">
            <% String errorcode=request.getParameter("login_error");if(errorcode=="1"){%>
            <div id="error">错误提示：用户"<%=student.getUserID()%>"有误，请重新输入!</div>
            <%} else {%>
            <div id="error">&nbsp;</div>
            <%}%>        </div>
        <div id="login">
            <form name="form1" method="post" action="http://jw.mioko.cn/academic/common/security/validate.jsp">
                <table cellspacing="0" cellpadding="0" class="login">
                    <tbody>
                    <tr>
                        <th class="title" colspan="2"><span>用户登录</span></th>
                    </tr>
                    <tr>
                        <th class="uname">用户名</th>
                        <td>&nbsp;<input name="userID" id="userID" type="text" class="input"></td>
                    </tr>
                    <tr>
                        <th class="password">密码</th>
                        <td>&nbsp;<input name="password" id="password" type="password" class="input"></td>
                    </tr>
                    <tr>
                        <th class="button" colspan="2" align="center">
                            <input name="button1" type="submit" class="button" value="登录">
                        </th>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="bottom">
    </div>
</div>
</body>
</html>