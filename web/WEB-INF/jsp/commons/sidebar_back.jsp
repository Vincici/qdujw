<%@ page import="java.text.SimpleDateFormat" %><%@ page import="java.util.Date" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="/system/styles/css/frame.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/system/styles/js/jquery.js"></script>
    <script type="text/javascript" src="/system/styles/js/changeFrame.js"></script>
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
<script type="text/javascript">
    function leftListLoadFinish() {
        window.parent.headerFrame.document.location.href = "/topbar.do";
    }
</script>
<body class="menuFrame" onload="leftListLoadFinish()">
<div class="wrap" id="wrap">
    <div id="date">
        <p><%SimpleDateFormat df2 = new SimpleDateFormat("yyyy年MM月dd日  E");Date now2 = new Date();%><%=df2.format(now2)%><br><span>2016秋     第17周</span></p>
    </div>
    <div id="slideMenu">
        <div class="menuWrap" id="menuWrap">
            <ul id="menu">
                <li id="li0">
                    <script type="text/javascript">
                        var moduleStatus210 = true;
                    </script>
                    <s:a onClick="showInfo(210)" action="changepw" target="mainFrame"><span>修改密码</span></s:a>
                </li>
                <li id="li2">
                    <script type="text/javascript">
                        var moduleStatus155 = true;
                    </script>
                    <s:a onClick="showInfo(155)" href="/system/help/systemSet.html" target="mainFrame">
                        <span>系统设置</span></s:a>
                    <ul>
                        <li><s:a action="characterManage" target="mainFrame"><span>角色管理</span></s:a></li>
                        <li><s:a action="powerManage" target="mainFrame"><span>权限管理</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>用户管理</span></s:a></li>
                        <%//TODO  管理员设置 %>
                        <li><s:a action="systeminfo" target="mainFrame"><span>系统基本信息设置</span></s:a></li>
                        <%//TODO  学年学期设置，教学周设置%>
                        <li><s:a action="#" target="mainFrame"><span>教师维护</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>学生维护</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>教研组维护</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>备课组维护</span></s:a></li>
                        <li><s:a action="classroomManage" target="mainFrame"><span>教室维护</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>统计分析</span></s:a></li>
                    </ul>
                </li>
                <li id="li3">
                    <script type="text/javascript">
                        var moduleStatus1070 = true;
                    </script>
                    <a onClick="showInfo(1070)" href="/system/help/studentInfo.html" target="mainFrame"><span>学籍管理</span></a>
                    <ul>
                        <li><s:a action="importStudentInfo" target="mainFrame"><span>导入新生学籍</span></s:a></li>
                        <li><s:a action="studentInfoMaintancejump" target="mainFrame"><span>学籍维护</span></s:a></li>
                        <li><s:a action="classChange" target="mainFrame"><span>调整分班</span></s:a></li>
                        <li><s:a action="studentAnalysisjump" target="mainFrame"><span>统计分析</span></s:a></li>
                    </ul>
                </li>
                <li id="li4">
                    <script type="text/javascript">
                        var moduleStatus2060 = true;
                    </script>
                    <a onClick="showInfo(2060)" href="/system/help/leave.html" target="mainFrame">
                        <span>请假管理</span></a>
                    <ul>
                        <li><s:a action="studentleave" target="mainFrame">
                            <span>学生请假</span></s:a></li>
                        <li><s:a action="teacherleave" target="mainFrame">
                            <span>教师请假</span></s:a></li>
                        <li><s:a action="analysisforleave" target="mainFrame">
                            <span>统计分析</span></s:a></li>
                    </ul>
                </li>
                <li id="li22">
                    <script type="text/javascript">
                        var moduleStatus2060 = true;
                    </script>
                    <s:a onClick="showInfo(2060)" action="#" target="mainFrame">
                        <span>值班管理</span></s:a>
                    <ul>
                        <li><s:a action="#" target="mainFrame">
                            <span>教师自习靠班表</span></s:a></li>
                        <li><s:a action="#" target="mainFrame">
                            <span>值班请假申请</span></s:a></li>
                    </ul>
                </li>
                <li id="li5">
                    <script type="text/javascript">
                        var moduleStatus2060 = true;
                    </script>
                    <a onClick="showInfo(2060)" href="/system/help/arrangeCourse.html" target="mainFrame">
                        <span>排课管理</span></a>
                    <ul>
                        <li><s:a action="worktimelist" target="mainFrame"><span>作息时间管理</span></s:a></li>
                        <li><s:a action="courseArrangeLimitSet" target="mainFrame"><span>排课限制</span></s:a></li>
                        <li><s:a action="autoArrangeCourse" target="mainFrame"><span>自动排课</span></s:a></li>
                        <li><s:a action="resultfix" target="mainFrame"><span>排课结果维护</span></s:a></li>
                        <li><s:a action="courseoutput" target="mainFrame"><span>输出课表</span></s:a></li>
                    </ul>
                </li>
                <li id="li6">
                    <script type="text/javascript">
                        var moduleStatus2000 = true;
                    </script>
                    <a onClick="showInfo(2000)" href="/system/help/arrangeExam.html" target="mainFrame">
                        <span>考试管理</span></a>
                    <ul>
                        <li><s:a action="examArrangeSet" target="mainFrame"><span>考试安排</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>考场安排</span></s:a></li>
                        <li><s:a action="classroomSchedulequery" target="mainFrame"><span>考场维护</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>监考安排</span></s:a></li>
                        <li><s:a action="#" target="mainFrame"><span>导出维护</span></s:a></li>
                    </ul>
                </li>
                <li id="li7">
                    <script type="text/javascript">
                        var moduleStatus2050 = true;
                    </script>
                    <a onClick="showInfo(2050)" href="/system/help/courseManage.html" target="mainFrame">
                        <span>课程管理</span></a>
                    <ul>
                        <li><a onClick="showInfo(2050)" href="/system/coursetable/courseScheduleByPerson.jsp"
                               target="mainFrame">
                            <span>个人课表</span></a></li>
                        <li><a onClick="showInfo(2050)" href="/system/coursetable/courseScheduleByClass.jsp"
                               target="mainFrame">
                            <span>班级课表</span></a></li>
                        <li><a onClick="showInfo(2050)" href="/system/coursetable/swapCourse.jsp" target="mainFrame">
                            <span>调课</span></a></li>
                    </ul>
                </li>
                <li id="li8">
                    <script type="text/javascript">
                        var moduleStatus2010 = true;
                    </script>
                    <a onClick="showInfo(2010)" href="/system/teacher/teacherContact.jsp" target="mainFrame">
                        <span>教师通讯录</span></a>
                </li>
                <li id="li9">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <a onClick="showInfo(2030)" href="/system/help/studyschedule.html" target="mainFrame">
                        <span>教学计划管理</span><a>
                    <ul>
                        <li><s:a action="#" onClick="showInfo(2050)" target="mainFrame">
                            <span>课程管理</span></s:a></li>
                        <li><s:a action="#" onClick="showInfo(2050)" target="mainFrame">
                            <span>课程分组管理</span></s:a></li>
                        <li><s:a action="majorCourseList" onClick="showInfo(2050)" target="mainFrame">
                            <span>教学计划维护</span></s:a></li>
                    </ul>
                <li id="li10">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <a onClick="showInfo(2030)" href="accessModule.do?moduleId=2030&groupId=" target="mainFrame">
                        <span>教学工作量管理</span></a>
                    <ul>
                        <li><a onClick="showInfo(2050)" href="/system/wrodk.html" target="mainFrame">
                            <span>工作量设置</span></a></li>
                        <li><s:a action="#" onClick="showInfo(2050)" target="mainFrame">
                            <span>工作量维护</span></s:a></li>
                        <li><s:a action="#" onClick="showInfo(2050)" target="mainFrame">
                            <span>工作量导出</span></s:a></li>
                    </ul>
                </li>
                <li id="li12">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <s:a action="file" onClick="showInfo(2030)" target="mainFrame">
                        <span>文件管理</span></s:a>
                </li>
                <li id="li13">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <s:a action="teachNotice" onClick="showInfo(2030)"  target="mainFrame">
                        <span>教学公告</span></s:a>
                    <ul>
                        <li><s:a action="teachNotice" target="mainFrame"><span>教学运行公告</span></s:a></li>
                        <li><s:a action="noticeSet" target="mainFrame"><span>教学公告管理</span></s:a></li>
                    </ul>
                </li>
                <li id="li14">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <a onClick="showInfo(2030)" href="/system/help/score.html" target="mainFrame">
                        <span>成绩管理</span></a>
                    <ul>
                        <li>
                            <s:a action="scoreInputGroupSet" target="mainFrame">
                                <span>成绩录入设置</span></s:a>
                        </li>
                        <li>
                            <s:a action="personalScore" target="mainFrame">
                                <span>个人成绩查询</span></s:a>
                        </li>
                        <li>
                            <s:a action="scoreInputGroupSet" target="mainFrame">
                                <span>录入成绩</span></s:a>
                        </li>
                        <li>
                        <s:a action="#" target="mainFrame">
                            <span>学生成绩查询</span></s:a>
                    </li>
                        <li>
                            <s:a action="#" target="mainFrame">
                                <span>成绩导出</span></s:a>
                        </li>
                    </ul>
                </li>
                <li id="li15">
                    <script type="text/javascript">
                        var moduleStatus2030 = true;
                    </script>
                    <a onClick="showInfo(2030)" href="accessModule.do?moduleId=2030&groupId=" target="mainFrame"><span>系统维护</span></a>
                    <ul>
                        <li>
                            <s:a action="#" target="mainFrame">
                                <span>系统日志</span></s:a>
                        </li>
                        <li>
                            <s:a action="#" target="mainFrame">
                                <span>在线状态</span></s:a>
                        </li>
                        <li>
                            <s:a action="#" target="mainFrame">
                                <span>检查更新</span></s:a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="sidebar">
    <s:a action="#" title="点击收缩">sidebar</s:a>
</div>
</body>
<script type="text/javascript">
    function showInfo(moduleid) {
    }
</script>
</html>