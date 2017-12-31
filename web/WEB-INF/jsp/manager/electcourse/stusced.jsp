<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选课名单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <!-- Mimic Internet Explorer 7 -->
    <link href="../../styles/default/css/text.css" rel="stylesheet" type="text/css">
    <link href="../../styles/default/css/main.css" rel="stylesheet" type="text/css">
    <link href="../../styles/frameV2/frame.css" rel="stylesheet" type="text/css">
    <center>
        <link href="../../styles/default/css/jquery.ui.all.css" rel="stylesheet" type="text/css">
        <link href="../../styles/default/css/frame.css" rel="stylesheet" type="text/css">

        <style type="text/css">
            table.from {
                border: 1px solid #c49760;
            }
        </style>
        <script type="text/javascript">


            $(function () {
                $("#updown").click(function () {

                    $("#logo").toggle();
                    $(this).toggleClass("down");
                    $(this).toggleClass("up");
                });
                initalert();
            });

            function checkform() {
                var mytrue = true;
                if ($("input[name='seq']").val() == "") {
                    alert("格式不对");
                    mytrue = false;
                }
                else if ($("input[name='pcourseid']").val() != "" && isNaN($("input[name='seq']").val())) {
                    alert("格式不对");
                    mytrue = false;
                }
                else if ($("input[name='pcourseid']").val() == "") {
                    alert("格式不对");
                    mytrue = false;
                }
                else {
                    mytrue = true;
                }

                if (mytrue)
                    showLoading("\u8BF7\u60A8\u8010\u5FC3\u7B49\u5F85...", false);
                return mytrue;

            }
            $(function () {
                initalert('', 0);
            });
        </script>
        </center>
    </head>
<body>
        <div id="header" style="height:auto; width:100%;margin-left:auto;margin-right:auto;">
            <div class="header" style="height:auto;">
                <div id="logo" style="height:115px;">
                    <div class="topwel">


                        <span>姓名: <span class="objectom">王树文</span></span> &nbsp;&nbsp;
                        <span>学号:<span class="objectom">201540705001</span> </span> &nbsp;&nbsp;
                        <span>班级:<span class="objectom"> 15软件（Java）10</span> </span>
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


        <div id="container" style="min-height:768px;">
            <div id="bodycer" style="min-height:768px;">

                <div class="titlewrap">
                    <div class="title">学生选课</div>
                </div>


                <div class="subtitle">
                    <div class="titletext">
                        已选课程
                    </div>
                </div>
                <table width="100%" class="datalist">

                    <tbody>
                    <tr class="">
                        <th>
                            课程号
                        </th>
                        <th>
                            课程名称
                        </th>
                        <th>
                            课序号
                        </th>
                        <th>学分</th>
                        <th>选课属性</th>
                        <th>考核方式</th>
                        <th>
                            课程安排
                        </th>
                        <th>&nbsp; </th>
                    </tr>


                    <tr class="">

                        <td>C07080900607
                        </td>
                        <td>计算机操作系统基础
                        </td>
                        <td class="center">7
                        </td>

                        <td>4.5
                        </td>

                        <td class="center">
                            必修
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;302008591&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr class="">

                        <td>C07080902606
                        </td>
                        <td>数据库系统及开发
                        </td>
                        <td class="center">5
                        </td>

                        <td>3.5
                        </td>

                        <td class="center">
                            必修
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;302036064&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr class="">

                        <td>C07080902607
                        </td>
                        <td>用HTML5设计富界面
                        </td>
                        <td class="center">12
                        </td>

                        <td>3
                        </td>

                        <td class="center">
                            必修
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;301981849&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr class="">

                        <td>C23000101005
                        </td>
                        <td>毛泽东思想和中国特色社会主义理论体系概论（下）
                        </td>
                        <td class="center">5
                        </td>

                        <td>3
                        </td>

                        <td class="center">
                            必修
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;301852157&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr>

                        <td>C07080902620
                        </td>
                        <td>NIIT学期项目III
                        </td>
                        <td class="center">10
                        </td>

                        <td>1
                        </td>

                        <td class="center">
                            必修
                        </td>
                        <td class="center">考查
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;301980180&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr class="">

                        <td>C25000105010
                        </td>
                        <td>轮滑（男生A类下）
                        </td>
                        <td class="center">2
                        </td>

                        <td>1
                        </td>

                        <td class="center">
                            限选
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;301806099&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    <tr class="">

                        <td>C24000102006
                        </td>
                        <td>大学英语Ⅵ
                        </td>
                        <td class="center">27
                        </td>

                        <td>3
                        </td>

                        <td class="center">
                            限选
                        </td>
                        <td class="center">考试
                        </td>
                        <td><img src="./stusced_files/see.gif" alt="课程安排"
                                 onmouseover="getDetailInfo(&#39;301962267&#39;,&#39;3&#39;,this)" class="center">
                        </td>

                        <form action="http://211.64.164.72/academic/manager/electcourse/removestusc.do"
                              method="post"></form>
                        <td class="center">


                        </td>


                    </tr>


                    </tbody>
                </table>
                <br>

                <div class="subtitle">
                    <div class="titletext">
                        <a name="fastsc" id="fastsc"></a>快速选课
                    </div>
                </div>

                <form action="http://211.64.164.72/academic/manager/electcourse/scaddaction.do" method="post">
                    <table cellspacing="0" cellpadding="0" class="form">
                        <tbody>
                        <tr>
                            <td width="65%" align="left">

                                课程号
                                <input type="text" name="pcourseid" class="input">
                                &nbsp;&nbsp;
                                课序号
                                <input name="seq" type="text" size="4" class="input">


                                <input type="hidden" name="checkUserid" value="565540">
                                &nbsp;&nbsp; <input type="submit" name="Submit" value="选课" class="button"
                                                    onclick="return checkform()">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>

                <br>


                <input name="b1" type="button" value="限选选课" style="_display:inline;" class="button"
                       onclick="location.href=&#39;./electScheduleCourseList.do?propSc=1&#39;"> &nbsp;


                <input style="_display:inline;" name="b2" type="button" value="已选课程" class="button"
                       onclick="location.href=&#39;./stusced.do&#39;">&nbsp;


                <input style="_display:inline;" name="b2" type="button" value="快速选课" class="button"
                       onclick="location.href=&#39;./stusced.do#fastsc&#39;">&nbsp;


                <input name="b2" style="_display:inline;" type="button" value="选课提示" class="button"
                       onclick="location.href=&#39;./mgspage.do&#39;"> &nbsp;


                <input type="button" name="button" value="全校开课查询" class="button"
                       onclick="window.open(&#39;./prefindcc.do&#39;)">


            </div>
        </div>
        <div id="alertdiv" style="display:none;"></div>
        <div id="successdiv" style="display:none;"></div>

        <script type="text/javascript">
            $(function () {
                $("div#overlay,div#loading").hide();//隐藏页面等待提示遮罩
            });

        </script>

    </center>


    <div id="overlay" style="width: 1349px; height: 934px; opacity: 0.5; display: none;"></div>
    <div id="loading" style="display: none;"><p><span class="description">页面加载中，请稍候。。。</span></p></div>
    </body>
</html>