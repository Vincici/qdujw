<%@ page import="com.model.StudentInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.model.course_info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentInfo student = (StudentInfo) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("http://jw.mioko.cn/index.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选课</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <!-- Mimic Internet Explorer 7 -->
    <link href="../../styles/default/css/text.css" rel="stylesheet" type="text/css">
    <link href="../../styles/default/css/main.css" rel="stylesheet" type="text/css">
    <link href="../../styles/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <link href="../../styles/default/css/jquery.ui.all.css" rel="stylesheet" type="text/css">
    <link href="../../styles/frameV2/frame.css" rel="stylesheet" type="text/css">
    <div id="header" style="height:auto; width:100%;margin-left:auto;margin-right:auto;padding-top:0px;">
        <div class="header" style="height:auto;">
            <div id="logo" style="height:115px;position:relative;">
                <div class="topwel">
                    <span>姓名: <span class="objectom"><%=student.getUsername()%></span></span> &nbsp;&nbsp;
                    <span>学号:<span class="objectom"><%=student.getUserID()%></span> </span> &nbsp;&nbsp;
                    <span>班级:<span class="objectom"><%=student.getRwclass()%></span> </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://jw.mioko.cn/academic/common/security/electiveLogout.jsp">退出</a>
                </div>
            </div>
            <div id="slowup" style="height:11px;text-align:center">
                <div id="slowleft">
                    <div id="slowright"><a class="up" id="updown"></a></div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="titlewrap">
        <div class="title">限选</div>
    </div>
    <div class="subtitle up" style="width:92%;">
        <div class="titletext">全部已选课程
            &nbsp;&nbsp;
            其中：
            限选已选学分<label id="selectCourseCredit">?</label>;
            限选已选门数<label id="selectCourseCount">?</label>
    </div>
        </div>
    <table cellpadding="0" cellspacing="0" class="datalist" id="table1">
        <tbody>
        <tr align="center" id="t_h" class="">
            <th nowrap="">课程号</th>
            <th nowrap="">课程名称</th>
            <th>课序号</th>
            <th>课程安排</th>
            <th>退课</th>
        </tr>
        <tr class="">
            <td class="center selected_pcourseid"></td>
            <td></td>
            <td></td>
            <td><img src="../../styles/default/image/see.gif" alt="课程安排" onmouseover="getDetailInfo(301980180,3,this)" class="center">
            </td>
            <form action="http://jw.mioko.cn/academic/manager/electcourse/removestusc.do" method="post"></form>
            <td class="center">
                <input type="hidden" name="epid" value="301980180">
                <input type="hidden" name="rollId" value="332152321">
                <input type="hidden" name="propSc" value="1">
            </td>
        </tr>
        </tbody>
    </table>
    <br>
    <div id="alertdiv" style="display:none;"></div>
    <div id="successdiv" style="display:none;"></div>
    <table cellpadding="0" cellspacing="0" class="form search_condition_form">
        <tbody>
        <tr>
            <th>课程号</th>
            <td><input type="text" name="SEARCH_PCOURSEID"></td>
            <th>课程名称</th>
            <td><input type="text" name="SEARCH_COURSENAME"></td>
            <th>学分</th>
            <td><input type="text" name="SEARCH_CREDIT">
                <input type="button" onclick="searchByInput()" class="button" value="查询">
            </td>
        </tr>
        </tbody>
    </table>
    <table id="data-infor" class="datalist">
        <tbody>
        <tr>
            <th></th>
            <th>课程号</th>
            <th>课程名称</th>
            <th>课序号</th>
            <th>课组</th>
            <th>学分</th>
            <th>开课院系</th>
            <th>校区</th>
            <th>考核方式</th>
            <th>课容量</th>
            <th>选课人数</th>
            <th>课余量</th>
            <th>任课教师</th>
            <th>合班</th>
            <th>课程安排</th>
            <th></th>
        </tr>
        <jsp:useBean id="courseinfo" class="com.controller.listcourse"/>
        <%
            List cous =courseinfo.queryAllcourse();
            Iterator iter = cous.iterator();
            course_info course = null;
            while (iter.hasNext()) {
                course = (course_info) iter.next();
        %>
        <tr>
            <td align="center"><input type="button" href="" value="选课" class="button"></td>
            <td class="SEARCH_PCOURSEID"><%=course.getPcourse_id()%></td>
            <td class="SEARCH_COURSENAME"><%=course.getCourse_name()%></td>
            <td><%=course.getQcourse_id()%></td>
            <td>通识教育选修课程</td>
            <td class="SEARCH_CREDIT" align="center"><%=course.getCredit()%></td>
            <td><%=course.getAcademic_name()%></td>
            <td><%if(course.getAreaid().equals("1")){out.print("浮山校区");}else{out.print("金家岭校区");}%></td>
            <td align="center">考查</td>
            <td align="center" id="course_capability"><%=course.getCourse_capability()%></td>
            <td align="center" id="amount"><%=course.getAmount()%></td>
            <td align="center" id="remain_capability"><%=course.getRemain_capability()%></td>
            <td align="center"><%=course.getCouse_teacher()%></td>
            <td align="center" class="FLAG_AMALGAMATIVE"><%=course.getFlag_amalgamative()%></td>
            <td align="center"><%=course.getWeek()%>&nbsp;&nbsp;<%=course.getWeek_hour()%>学时&nbsp;&nbsp;星期<%=course.getWeek_day()%>&nbsp;&nbsp;<%=course.getLesson_arrange()%>节&nbsp;&nbsp;<%=course.getClassroom()%></td>
            <td align="center"><input type="button" href="scaddaction.do" class="button" value="选课"></td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <br>
    <form action="http://211.64.164.72/academic/manager/electcourse/electScheduleCourseList.do?propSc=1" name="addForm">
        <input type="hidden" name="studentId" value="s565540">
        <input type="hidden" name="propPage" value="1">
        <input type="hidden" name="showOverflowCapability" value="1.0">
        <input type="hidden" name="studentAreaId" value="1709">
        <input type="hidden" name="Electcourse_FilePath" value="/tmpfile/">
        <input type="hidden" name="canAdd" value="0">
        <input type="hidden" name="selectedCidList" value=",46364,46521,46534,53352,48364,46522,53462,46502,46505,46544,47565,47567,48701,51241,51231,47566,48191,48715,46525,46705,51230,46923,48703,46617,46446,46611,48994,47654,51242,51240,46616,46704,46529,51234,47564,46497,48709,46541,46451,46523,48702,46447,47281,46524,46530,">
    </form>
    <input name="b1" type="button" value="限选选课" style="_display:inline;" class="button" onclick="location.href='electScheduleCourseList.jsp'"/> &nbsp;
    <input style="_display:inline;" name="b2" type="button" value="已选课程" class="button" onclick="location.href='stusced.jsp'"/>&nbsp;
    <input style="_display:inline;" name="b2" type="button" value="快速选课" class="button" onclick="location.href='stusced.jsp#fastsc'"/>&nbsp;
    <input name="b2" style="_display:inline;" type="button" value="选课提示" class="button" onclick="location.href='mgspage.jsp'"/> &nbsp;
    <input type="button" name="button" value="全校开课查询" class="button" onclick="window.open('prefindcc.jsp')">
    <input type="button" name="button" value="课组统计面板" class="button" onclick="location.href='electGroupStat.jsp'">
    <br><br>
</center>
</body>
</html>
<%}%>