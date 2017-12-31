<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String uid=request.getParameter("stu_id");%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <head>
        <title>修改教师信息</title>
        <!-- Mimic Internet Explorer 7 -->
        <link href="/system/styles/css/text.css" rel="stylesheet" type="text/css">
        <link href="/system/styles/css/main.css" rel="stylesheet" type="text/css">
        <link href="/system/styles/css/title.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" language="javascript" src="/system/styles/js/jquery.js"></script>
    </head>
<body>
<center>

    <table cellspacing="0" cellpadding="0" id="title" align="center">
        <tbody>
        <tr>
            <td nowrap="nowrap">
                <div>修改教师信息</div>
            </td>
        </tr>
        </tbody>
    </table>
    <form name="studentModifyInfoAcquireFillForm" method="post" action="/system/admin/studentInfoModifyDo.do"
          enctype="multipart/form-data">
        <input type="hidden" name="stuUserId" value="<%=uid%>">
        <table cellspacing="0" cellpadding="0" class="datalist">
            <tr>
                <th width="12%" align="left">学号</th>
                <td width="35%"><input type="text" name="username" value="201540705001"></td>
                <th width="12%" align="left">姓名</th>
                <td><input type="text" name="realname" value="王树文"></td>
                <td width="7%" rowspan="7" align="center">
                    <img src="/showstudentImage.jsdo?stu_id=565540" width="120" hight="150" name="showimg" id="showimg">
                    <br>
                    <input type="button" class="button" value="上传图片">
                </td>
            </tr>
            <tr>
                <th width="12%" align="left">性别</th>
                <td><select>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select></td>
                <th>新生报到状态</th>
                <td><select>
                    <option selected>已报到</option>
                    <option>未报到</option>
                </select></td>
            </tr>
            <tr>
                <th width="12%" align="left">出生日期</th>
                <td><input type="text" name="birthday" value=""></td>
                <th width="12%" align="left">出生地</th>
                <td><input type="text" name="birthplace" value=""></td>
            </tr>
            <tr>
                <th width="12%" align="left">籍贯</th>
                <td><input type="text" name="nativePlace" value="诸城市"></td>
                <th width="12%" align="left">民族</th>
                <td colspan="2"><select>
                    <option>汉族</option>
                    <option>xx</option>
                    <option>xx</option>
                    <option>xx</option>
                    <option>xx</option>
                </select></td>
            </tr>
            <tr>
                <th width="12%" align="left">证件类型</th>
                <td><input type="text" name="cardtypeId" value="身份证"></td>
                <th width="12%" align="left">证件号码</th>
                <td colspan="2"><input type="text" name="idno" value="37078219960828023X"></td>
            </tr>
            <tr>
                <th width="12%" align="left">政治面貌</th>
                <td>
                    <select>
                        <option>中共党员</option>
                        <option>中共预备党员</option>
                        <option>共青团员</option>
                        <option>民革党员</option>
                        <option>民盟盟员</option>
                        <option>民建会员</option>
                        <option>民进会员</option>
                        <option>农工党党员</option>
                        <option>致公党党员</option>
                        <option>九三学社社员</option>
                        <option>台盟盟员</option>
                        <option>无党派人士</option>
                        <option>群众</option>
                        <option>港澳同胞</option>
                        <option>叛徒</option>
                        <option>反革命分子</option>
                    </select>
                </td>
                <th width="12%" align="left">外语语种</th>
                <td colspan="2"><select>
                    <option>英语</option>
                    <option>法语</option>
                    <option>俄语</option>
                    <option>日语</option>
                </select></td>
            </tr>
            <tr>
                <th width="12%" align="left">中考等级总分</th>
                <td><input type="number" min="35" max="60" name="entrExamScore" value=""></td>
                <th width="12%" align="left">入学准考证号</th>
                <td colspan="2"><input type="number" name="entranceExamNo" value="15370782154800"></td>
            </tr>
            <tr>
                <th width="12%" align="left">初级中学名称</th>
                <td><input type="text" name="regionid" value="未知"></td>
                <th width="12%" align="left">入学年级</th>
                <td colspan="2">
                    <select>
                        <option>2017</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                        <option>2027</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th width="12%" align="left">班级</th>
                <td><input type="text" name="departmentid" value=""></td>
                <th width="12%" align="left">专业方向</th>
                <td colspan="2">
                    <div id="majorChange">
                        <select>
                            <option>无</option>
                            <option>文科</option>
                            <option selected>理科</option>
                            <option>艺术文</option>
                            <option>艺术理</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <th width="12%" align="left">是否有学籍</th>
                <td>
                    <div id="is_xj">
                        <select>
                            <option selected>是</option>
                            <option>否</option>
                            <option>未知</option>
                        </select>
                    </div>
                </td>
                <th width="12%" align="left">是否在校</th>
                <td colspan="2"><select>
                    <option selected>是</option>
                    <option>否</option>
                    <option>未知</option>
                </select></td>
            </tr>
            <tr>
                <th width="12%" align="left">毕业去向</th>
                <td><input type="text" name="postGraduateId" value="未知"></td>
                <th width="12%" align="left">联系电话</th>
                <td colspan="2"><input type="tel" name="moblePhone" value=""></td>
            </tr>
        </table>
        <br>
        <div id='temp'></div>
        <table cellspacing="0" cellpadding="0" class="form">
            <tr>
                <th width="12%" align="left">父亲姓名</th>
                <td><input type="text" name="fqxm" value=""></td>
                <th width="12%" align="left">母亲姓名</th>
                <td><input type="text" name="mqxm" value=""></td>
            </tr>
            <tr>
                <th width="12%" align="left">父亲电话</th>
                <td><input type="text" name="workUnitTel" value=""></td>
                <th width="12%" align="left">母亲电话</th>
                <td><input type="text" name="workUnitPostalCode" value=""></td>
            </tr>
            <tr>
                <th width="12%" align="left">父亲工作单位</th>
                <td><input type="text" name="familyTel" value=""></td>
                <th width="12%" align="left">母亲工作单位</th>
                <td><input type="text" name="familyPostalCode" value=""></td>
            </tr>
            <tr>
                <th width="12%" align="left">家庭住址</th>
                <td colspan="6"><input type="text" name="familyAdress" value=""></td>
            </tr>
        </table>
        <br>
        <table cellspacing="0" cellpadding="0" class="form">
            <tr>
                <th width="12%" align="left">备注</th>
                <td colspan="4" row><input type="text" name="memo" value=""></td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" class="button_tab">
            <tr>
                <td>
                    <input class="button" value="保存修改" type="submit">
                    <input class="button" value="放弃" type="reset">
                </td>
            </tr>
        </table>
    </form>
</center>
<br/>
<br/>
</body>
</html>
