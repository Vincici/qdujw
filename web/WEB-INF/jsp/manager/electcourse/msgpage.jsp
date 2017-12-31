<%@ page import="com.model.StudentInfo" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%StudentInfo student = (StudentInfo) session.getAttribute("student");if (student == null) {response.sendRedirect("http://jw.mioko.cn/index.jsp");} else {%>
<!DOCTYPE HTML>
<html>
<head>
    <title>选课</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link href="../../styles/default/css/text.css" rel="stylesheet" type="text/css">
    <link href="../../styles/default/css/main.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" language="javascript" src="../../styles/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/function.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/common.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/selectDate.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/selectTime.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/default/js/page.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/selectDateTime.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/j_common.js"></script>
    <script type="text/javascript" language="javascript" src="../../styles/js/depCommon.js"></script>
</head>
<body>
<center>
    <script type="text/javascript" src="../../styles/js/theol/theol.js"></script>
    <link href="../../styles/css/jquery.ui.all.css" rel="stylesheet" type="text/css">
    <link href="../../styles/frameV2/frame.css" rel="stylesheet" type="text/css">
    <div id="header" style="height:auto; width:100%;margin-left:auto;margin-right:auto;">
        <div class="header" style="height:auto;">
            <div id="logo" style="height:115px;position:relative;">
                <div class="topwel">
                    <span>姓名: <span class="objectom"><%=student.getUsername()%></span></span> &nbsp;&nbsp;
                    <span>学号:<span class="objectom"><%=student.getUserID()%></span> </span> &nbsp;&nbsp;
                    <span>班级:<span class="objectom"><%=student.getRwclass()%></span> </span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../../common/security/electiveLogout.jsp">退出</a>
                </div>
            </div>
            <div id="slowup" style="height:11px;text-align:center">
                <div id="slowleft">
                    <div id="slowright"><a class="up" id="updown"></a></div>
                </div>
            </div>
        </div>
    </div>
    <div id="container" style="min-height:768px;">
        <div id="bodycer" style="min-height:768px;">
            <div class="titlewrap"><div class="title">2017春选课</div></div>
            <div class="subtitle"><div class="titletext">选课提示</div></div>
            <table cellspacing="0" cellpadding="0" class="form" id="scinfo">
                <tr>
                    <td style="width:150px;">本次选课<br></td>
                    <td colspan="2">正选阶段&nbsp;&nbsp;当前选课状态:<span style="color:#339900;text-decoration:underline;font-weight:bold;">开启</span>&nbsp;&nbsp;开始时间:2016-12-07 09:00&nbsp;&nbsp;结束时间:2016-12-08 08:00&nbsp;&nbsp;禁止跨校区选课</td>
                </tr>
                <tr>
                    <td>选课人</td>
                    <td colspan="2">学号:
                        <%=student.getUserID()%>&nbsp;&nbsp;
                        姓名:
                        <%=student.getUsername()%>&nbsp;&nbsp;
                        班级:
                        <%=student.getRwclass()%>
                    </td>
                </tr>
                <tr>
                    <td>选课学分、门数限制</td>
                    <td>考试性质:全部&nbsp;&nbsp;选课属性:任选&lt;= <span style="color:#ca0000;"> 4.0 </span>学分<br></td>
                    <td>考试性质: 全部&nbsp;&nbsp;选课属性:任选&lt;= <span style="color:#ca0000;"> 2</span>门<br></td>
                </tr>
                <tr>
                    <td>已选课程</td>
                    <td>必修&nbsp;&nbsp;已选学分
                           <span><img src="../../styles/default/image/icoexplain.gif" id="mcredit" class="img"></span><span id="mcr" class="txt" style="color:#ca0000;display: none"></span><br>
                        限选&nbsp;&nbsp;已选学分
                        <span><img src="../../styles/default/image/icoexplain.gif" id="rcredit" class="img"></span><span id="rcr" class="txt" style="color:#ca0000;display: none"></span>
                        <br>
                        任选&nbsp;&nbsp;已选学分
                        <span><img src="../../styles/default/image/icoexplain.gif" id="fcredit" class="img"></span><span id="fcr" class="txt" style="color:#ca0000;display: none"></span>
                        <br>
                    </td>
                    <td>
                        必修&nbsp;&nbsp;已选门数
                        <span><img src="../../styles/default/image/icoexplain.gif" id="mcount" class="img"></span><span id="mco" class="txt" style="color:#ca0000;display: none"></span><br>
                        限选&nbsp;&nbsp;已选门数
                        <span><img src="../../styles/default/image/icoexplain.gif" id="rcount" class="img"></span><span id="rco" class="txt" style="color:#ca0000;display: none"></span>
                        <br>
                        任选&nbsp;&nbsp;已选门数
                        <span><img src="../../styles/default/image/icoexplain.gif" id="fcount" class="img"></span><span id="fco" class="txt" style="color:#ca0000;display: none"></span>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>选课控制说明</td>
                    <td colspan="2"><input name="b2" type="button" value=" 查看选课说明" class="mybutton1" onclick="location.href='selectcoursehelp.doc'"/>&nbsp;</td>
                </tr>
            </table>
            <br>
            <input name="b1" type="button" value="限选选课" style="_display:inline;" class="button" onclick="location.href='electScheduleCourseList.jsp'"/> &nbsp;
            <input style="_display:inline;" name="b2" type="button" value="已选课程" class="button" onclick="location.href='stusced.jsp'"/>&nbsp;
            <input style="_display:inline;" name="b2" type="button" value="快速选课" class="button" onclick="location.href='stusced.jsp#fastsc'"/>&nbsp;
            <input name="b2" style="_display:inline;" type="button" value="选课提示" class="button" onclick="location.href='mgspage.jsp'"/> &nbsp;
            <input type="button" name="button" value="全校开课查询" class="button" onclick="location.href='findcc.jsp'">
        </div>
    </div>
</center>
</body>
</html>
<%}%>