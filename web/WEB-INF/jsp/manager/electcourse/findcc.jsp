<%@ page import="com.model.StudentInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentInfo student = (StudentInfo) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("http://jw.mioko.cn/index.jsp");
    } else {
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        选课
    </title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    
    <link href="./findcc_files/view_new.css" rel="stylesheet" type="text/css">
    <link href="./findcc_files/text.css" rel="stylesheet" type="text/css">
    <link href="./findcc_files/main.css" rel="stylesheet" type="text/css">
    <link href="./findcc_files/popwin.css" rel="stylesheet" type="text/css">
    <link href="../../styles/frameV2/frame.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" language="javascript" src="./findcc_files/function.js.下载"></script>
    <script type="text/javascript" language="javascript" src="./findcc_files/page.js.下载"></script>
    <script type="text/javascript" language="javascript" src="./findcc_files/ajax.js"></script>
    <script type="text/javascript" language="javascript" src="./findcc_files/jquery.js.下载"></script>

    <script type="text/javascript" language="javascript" src="./findcc_files/selectTime.js.下载"></script>
    <script type="text/javascript" language="javascript" src="./findcc_files/selectDateTime.js.下载"></script><style>#__calendarTime{margin:0;padding:0;background:#000}div.calendarDivTime{ margin:0;padding:0;border:1px solid #000;}div.calendarDivTime span{cursor:pointer}th,td{margin:0;padding:0px}table.calendarTableTime{ margin:0;padding:0;width:100%}table.calendarTableTime th ,table.calendarTableTime td{font:12px/20px Arial,sans-serif;text-align:center;}table.calendarTableTime thead th.week{border-top:1px solid #CCC;border-bottom:1px solid #ccc;background:#EEE;}table.calendarTableTime thead tr.function th{border:1px solid #fff}table.calendarTableTime tr{background:#fff}table.calendarTableTime thead tr.top{letter-spacing:1px;}table.calendarTableTime thead a{color:#000;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #ccc;background:#E1F1FF;}table.calendarTableTime tbody a:hover{color:#990;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #ccc;background:#E1F1FF;}table.calendarTableTime thead a.today{width:98% !important;width:100%}table.calendarTableTime thead a.today:hover{width:98% !important;width:100%}table.calendarTableTime td{width:21px;height:20px;border-bottom:1px solid #E6E6E6;color:#fff;}table.calendarTableTime th{height:21px;}table.calendarTableTime tr.com{background:#fff;}table.calendarTableTime tr.cur{background:#F0FAFF;}table.calendarTableTime tbody a{color:#000;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #fff;}table.calendarTableTime tbody a:hover{color:#990;width:19px;height:18px;text-decoration:none;border:1px solid #E6E6E6;background:#E1F1FF;display:block;}table.calendarTableTime tbody a.today{color:#c00;border:1px solid #DBDBDB;background:#CCE4FF;}table.calendarTableTime tbody a.today:hover{color:#990;border:1px solid #DBDBDB;background:#CCE4FF;}table.calendarTableTime tbody a.week{color:#c00;}div.calendarTfoot{background:#EEE;text-align:center;}div.calendarTfoot table{width:100%}table.calendarTfoot td{background:#EEE;width:auto;text-align:center}table.calendarTfoot td span{cursor:pointer;display:block;color:#000;}table.calendarTfoot td span{cursor:pointer;display:block;color:#000;}table.calendarTfoot td.maohao{text-align:center;color:#000}table.calendarTfoot td input{border:1px solid #ccc;background:#E1F1FF;}</style></head><body><div id="__calendarTime" style="width:158px;height:170px !important;height:185px;position:absolute;display:none;z-index:9998"><div id="__calendarDivTime" class="calendarDivTime"><table cellspacing="0" cellpadding="0" class="calendarTableTime"><thead><tr class="top"><th>&nbsp;</th><th colspan="5" id="sohwdateTime"><span id="showyearTime"></span>-<span id="showmonthTime"></span></th><th><a href="javascript:void(0);" title="关闭" onclick="shutTime()">C</a></th></tr><tr class="function"><th><a href="javascript:void(0);" title="上一年" onclick="preYearTime()">&lt;&lt;</a></th><th><a href="javascript:void(0);" title="上月" onclick="preMonthTime()">&lt;</a></th><th colspan="3"><a href="javascript:void(0);" class="today" title="今天" onclick="getDateTime(&#39;0&#39;)">今天</a></th><th><a href="javascript:void(0);" title="下月" onclick="nextMonthTime()">&gt;</a></th><th><a href="javascript:void(0);" title="下一年" onclick="nextYearTime()">&gt;&gt;</a></th></tr><tr><th class="week">日</th><th class="week">一</th><th class="week">二</th><th class="week">三</th><th class="week">四</th><th class="week">五</th><th class="week">六</th></tr></thead><tbody id="calendarTbodyTime"></tbody></table><div class="calendarTfoot" id="_calendarTfoot"><table><tbody><tr><td width="20%">&nbsp;</td><td id="_hourTime" width="20%"></td><td class="maohao" width="8%">:</td><td id="_minuteTime" width="20%"></td><td><input type="button" value="OK" onclick="calCloseTime()"></td></tr></tbody></table></div></div></div><iframe id="__calframeTime" src="javascript:false;" scrolling="no" frameborder="0" style="position:absolute;display:none;background-color:#FFF" src="./findcc_files/saved_resource.html">&amp;nbsp;</iframe>
     <script type="text/javascript" language="javascript" src="./findcc_files/selectDate.js.下载"></script><div id="__calendarPanel" style="position:absolute;visibility:hidden;z-index:9999;background-color:#FFFFFF;border:1px solid #666666;width:200px;height:216px;">
<iframe name="__calendarIframe" id="__calendarIframe" width="100%" height="100%" scrolling="no" frameborder="0" style="margin:0px;" src="./findcc_files/saved_resource(1).html"></iframe>
</div>


  <script type="text/javascript" language="javascript" src="./findcc_files/common.js.下载"></script>

    <script type="text/javascript" language="javascript" src="./findcc_files/export.js.下载"></script>

    <script type="text/javascript" language="javascript" src="./findcc_files/depCommon.js.下载"></script>

















<center>
    <table cellpadding="0" cellspacing="0" class="logo_tab">
        <tbody><tr>
            <td class="logo"></td>
        </tr>
    </tbody></table>
    <table cellpadding="0" cellspacing="0" class="content_tab">
        <tbody><tr>
            <td class="content">
                


















    <div class="title">
        <span class="left"><em>开课列表 </em></span>
        <span class="right">&nbsp;</span>
    </div>
    <div class="subtitle" style="width:92%;margin-left:auto;margin-right:auto;clear:both;margin-top:15px;">
        <div class="titletext">结果查询</div>
    </div>
    <form styleid="forms3" method="post" action="http://211.64.164.72/academic/manager/electcourse/findcc.do">
        <table width="100%" border="0" class="form" cellpadding="0" cellspacing="0">
            <tbody><tr>
                <script language="JavaScript">
function change(form){
form.action="/academic/styles/layout/popwindowLayout.jsdo?null";
form.submit();}
function changeDepart(form){
form.action="/academic/styles/layout/popwindowLayout.jsdo?null";
if(form.trgroupid)form.trgroupid.value=null
form.submit();}
function changeResearchGroup(form){
form.action="/academic/styles/layout/popwindowLayout.jsdo?null";
form.submit();}
</script>
<th>院系</th>
<td><select name="depid">
<option value="1">青岛大学</option>
<option value="869">--马克思主义学院</option>
<option value="18122">----QD马克思主义学院</option>
<option value="874">--师范学院通识教育选修课</option>
<option value="995">----教育类选修课</option>
<option value="996">----文化素质类选修课</option>
<option value="997">----其他类选修课</option>
<option value="876">--文学院</option>
<option value="17821">----QD文学院</option>
<option value="878">--数学与统计学院</option>
<option value="17822">----QD数学与统计学院</option>
<option value="879">--物理科学学院</option>
<option value="17823">----QD物理科学学院</option>
<option value="880">--纺织服装学院</option>
<option value="904">----纺织学院纺织系</option>
<option value="905">----纺织学院服装系</option>
<option value="6862">----纺织材料与产品设计系</option>
<option value="6863">----纺织学院服装艺术设计系</option>
<option value="6864">----纺织学院服装实验室</option>
<option value="6865">----纺织学院纺织实验室</option>
<option value="6866">----纺织学院CAD中心</option>
<option value="17824">----QD纺织服装学院</option>
<option value="881">--商学院</option>
<option value="906">----商学院国际经济贸易系</option>
<option value="907">----商学院工商管理系</option>
<option value="908">----商学院管理科学与工程系</option>
<option value="909">----商学院公共管理系</option>
<option value="910">----商学院市场学系</option>
<option value="911">----商学院会计系</option>
<option value="17825">----QD商学院</option>
<option value="18581">----QD商学院国际经济贸易系</option>
<option value="18582">----QD商学院工商管理系</option>
<option value="18583">----QD商学院管理科学与工程系</option>
<option value="18584">----QD商学院公共管理系</option>
<option value="18585">----QD商学院市场学系</option>
<option value="18586">----QD商学院会计系</option>
<option value="882">--机电工程学院</option>
<option value="912">----机电工程学院机电工程系</option>
<option value="913">----机电工程学院热能与动力工程系</option>
<option value="914">----机电工程学院机械基础部</option>
<option value="915">----机电工程学院车辆工程系</option>
<option value="916">----机电工程学院工业设计系</option>
<option value="6421">----机电工程学院工程训练中心</option>
<option value="13121">----机电工程学院机械设计及制造系</option>
<option value="13122">----机电工程学院工程设计及理论系</option>
<option value="13123">----机电工程学院测控技术与仪器系</option>
<option value="17826">----QD机电工程学院</option>
<option value="883">--自动化与电气工程学院</option>
<option value="917">----电子学系</option>
<option value="918">----电气工程系</option>
<option value="919">----控制工程系</option>
<option value="920">----电子工程系</option>
<option value="921">----自动化与电气工程学院电工电子实验教学中心</option>
<option value="19723">------QD电工电子实验教学中心</option>
<option value="922">----专业实验中心</option>
<option value="923">----复杂性研究所</option>
<option value="17827">----QD自动化与电气工程学院</option>
<option value="884">--计算机科学技术学院</option>
<option value="925">----公共计算机基础教学中心</option>
<option value="18322">------QD公共计算机基础教学中心</option>
<option value="17828">----QD计算机科学技术学院</option>
<option value="885">--医学部</option>
<option value="11781">----医学院留学生</option>
<option value="17829">----QD医学部</option>
<option value="18548">----口腔医学院</option>
<option value="21515">------QD口腔医学院</option>
<option value="18550">----护理学院</option>
<option value="21509">------QD护理学院</option>
<option value="18551">----药学院</option>
<option value="21516">------QD药学院</option>
<option value="18552">----基础医学院</option>
<option value="13722">------青岛大学-华大基因创新学院</option>
<option value="18342">------QD华大基因创新学院</option>
<option value="21517">------QD基础医学院</option>
<option value="18553">----公共卫生学院</option>
<option value="21518">------QD公共卫生学院</option>
<option value="20730">----临床医学院</option>
<option value="21606">----医院管理办</option>
<option value="886">--师范学院（教师教育学院）</option>
<option value="927">----师范学院政治系</option>
<option value="18421">------QD师范学院政治系</option>
<option value="928">----师范学院体育系</option>
<option value="18432">------QD师范学院体育系</option>
<option value="929">----师范学院中文系</option>
<option value="18423">------QD师范学院中文系</option>
<option value="930">----师范学院英语系</option>
<option value="18425">------QD师范学院英语系</option>
<option value="931">----师范学院历史系</option>
<option value="18424">------QD师范学院历史系</option>
<option value="932">----师范学院数学系</option>
<option value="18426">------QD师范学院数学系</option>
<option value="933">----师范学院物理系</option>
<option value="18427">------QD师范学院物理系</option>
<option value="934">----师范学院化学系</option>
<option value="18428">------QD师范学院化学系</option>
<option value="935">----师范学院地理系</option>
<option value="18429">------QD师范学院地理系</option>
<option value="936">----师范学院教育技术系</option>
<option value="18431">------QD师范学院教育技术系</option>
<option value="937">----师范学院思想政治教育教研室</option>
<option value="5901">----师范学院哲学系</option>
<option value="18422">------QD师范学院哲学系</option>
<option value="6901">----师范学院应用心理系</option>
<option value="18433">------QD师范学院应用心理系</option>
<option value="6902">----师范学院小学教育系</option>
<option value="18434">------QD师范学院小学教育系</option>
<option value="6903">----师范学院学前教育系</option>
<option value="18430">------QD师范学院学前教育系</option>
<option value="17830">----QD师范学院（教师教育学院）</option>
<option value="887">--经济学院</option>
<option value="938">----经济学院金融学系</option>
<option value="939">----经济学院财政学系</option>
<option value="940">----经济学院经济学系</option>
<option value="6461">----经济学院统计学系</option>
<option value="17831">----QD经济学院</option>
<option value="888">--旅游与地理科学学院</option>
<option value="941">----旅游管理系</option>
<option value="942">----饭店管理系</option>
<option value="13670">----国际旅行管理系</option>
<option value="17832">----QD旅游与地理科学学院</option>
<option value="889">--法学院</option>
<option value="943">----法学院法律系</option>
<option value="944">----法学院国际关系系</option>
<option value="945">----法学院社会学系</option>
<option value="946">----法学院政治学与行政学系</option>
<option value="5881">----法学院边防管理系</option>
<option value="17833">----QD法学院</option>
<option value="890">--音乐学院</option>
<option value="947">----音乐学院声乐系</option>
<option value="948">----音乐学院管弦系</option>
<option value="949">----音乐学院音乐教育系</option>
<option value="950">----音乐学院键盘系</option>
<option value="951">----音乐学院音乐理论基础教学部</option>
<option value="17839">----QD音乐学院</option>
<option value="891">--美术学院</option>
<option value="952">----美术学院艺术设计系</option>
<option value="953">----美术学院绘画系</option>
<option value="954">----美术学院美术学部</option>
<option value="16822">----美术学院视觉传达系</option>
<option value="16823">----美术学院环境设计系</option>
<option value="17835">----QD美术学院</option>
<option value="892">--外语学院</option>
<option value="955">----外语学院英语系</option>
<option value="956">----外语学院德语系</option>
<option value="957">----外语学院法语系</option>
<option value="958">----外语学院日语系</option>
<option value="959">----外语学院韩语系</option>
<option value="960">----外语学院西班牙语系</option>
<option value="17836">----QD外语学院</option>
<option value="893">--公共外语教育学院</option>
<option value="18124">----QD公共外语教育学院</option>
<option value="894">--化学化工学院</option>
<option value="961">----化学科学与工程学院环境科学与工程系</option>
<option value="962">----化学科学与工程学院化学系</option>
<option value="963">----化学科学与工程学院应用化学系</option>
<option value="964">----化学科学与工程学院材料系</option>
<option value="965">----化学科学与工程学院化学工程系</option>
<option value="966">----化学科学与工程学院轻化工程系</option>
<option value="13301">----化学科学与工程学院实验中心</option>
<option value="17837">----QD化学化工学院</option>
<option value="895">--应用技术学院</option>
<option value="967">----应用技术学院机电工程系</option>
<option value="968">----应用技术学院电气工程系</option>
<option value="970">----应用技术学院纺织服装系</option>
<option value="971">----应用技术学院高分子材料系</option>
<option value="17838">----QD应用技术学院</option>
<option value="897">--数据科学与软件工程学院</option>
<option value="987">----电子信息工程系</option>
<option value="988">----基础教学部</option>
<option value="989">----软件技术系</option>
<option value="990">----智能科学与技术系</option>
<option value="9141">----数字媒体技术系</option>
<option value="17841">----QD数据科学与软件工程学院</option>
<option value="18182">----数字媒体艺术系</option>
<option value="926">--生命科学学院</option>
<option value="19881">----QD生命科学学院</option>
<option value="7961">--国际教育学院</option>
<option value="12301">--国家重点实验室培育基地</option>
<option value="18481">--QD招生就业处</option>
<option value="20702">--教务处</option>
<option value="18126">----QD大学生文化素质基地</option>
<option value="18531">----QD教务处</option>
<option value="20703">----归档课程中心</option>
<option value="20721">--电子信息学院</option>
<option value="13341">----通信工程系</option>
<option value="21510">----QD电子信息学院</option>
<option value="20722">--新闻与传播学院</option>
<option value="901">----文学院新闻系</option>
<option value="902">----文学院广告系</option>
<option value="10341">----文学院影视文学与艺术系</option>
<option value="21511">----QD新闻与传播学院</option>
<option value="20723">--哲学与历史学院</option>
<option value="21512">----QD哲学与历史学院</option>
<option value="20726">--体育学院</option>
<option value="18123">----QD体育学院</option>
<option value="20727">--材料科学与工程学院</option>
<option value="21508">----QD材料科学与工程学院</option>
<option value="20728">--环境科学与工程学院</option>
<option value="21513">----QD环境科学与工程学院</option>
<option value="20729">--政治与公共管理学院</option>
<option value="21514">----QD政治与公共管理学院</option>
<option value="21484">--学生处</option>
<option value="18181">----QD学生处</option>
<option value="21485">----创新创业学院</option>
<option value="21536">--正奇学院</option>
<option value="21767">--国学研究院</option>
<option value="22013">--转化医学研究院</option>
</select></td>

                <td>
                    课程号或课程名
                    <input name="cname" type="text" class="input" size="15">&nbsp;&nbsp;
                    <input name="search" type="submit" value="查询" class="button">
                    &nbsp;&nbsp;<em class="explain">*模糊查询</em>
                </td>
            </tr>
        </tbody></table>
        
            <table cellspacing="0" cellpadding="0" class="datalist">
                
<tbody><tr class="">
    <th>课程号</th>
    <th>课序号</th>
    <th>课程名称</th>
    <th>学分</th>
    <th>选课属性</th>
    <th>开课院系</th>
    <th>课程班校区</th>
    <th>选课限制</th>
    <th>课程考核方式</th>
    <th>任课教师</th>
    <th>课程班别名</th>
    <th>课程安排</th></tr>
            </tbody></table>

            <div class="neck"></div>
            <div class="navigation">
                <div class="page">
                    <table class="classicLookPagingTag PagingTag" border="0" cellspacing="0" cellpadding="0">
 <tbody><tr class="classicLookPagingTag PagingTag">
  <td class="classicLookSummary Summary">共<b>0</b>条，<b>1</b> / <b>1</b>页</td>
  <td class="classicLookItemsPerPage ItemsPerPage"><table border="0" cellspacing="0" cellpadding="0" class="classicLookItemsPerPage ItemsPerPage">
    <tbody><tr class="classicLookItemsPerPage ItemsPerPage">
     <td nowrap="true" class="classicLookItemsPerPageLabel ItemsPerPageLabel"><label class="classicLookItemsPerPageLabel ItemsPerPageLabel">每页显示</label></td>
     <td class="classicLookItemsPerPageInputBox ItemsPerPageInputBox"><input id="pagingNumberPer" title="您可以指定每页显示的记录数目。" name="pagingNumberPer" value="2147483647" class="classicLookItemsPerPageInputBox ItemsPerPageInputBox" type="text"></td>
     <td class="classicLookItemsPerPageSubmitButton ItemsPerPageSubmitButton"><input value="设置" onclick="window.location.href = &quot;findcc.do?sortDirection=-1&amp;pagingPage=1&amp;pagingNumberPer=&quot; + document.getElementById(&quot;pagingNumberPer&quot;).value;" class="classicLookItemsPerPageSubmitButton ItemsPerPageSubmitButton" type="button"></td>
    </tr>
  </tbody></table></td>
  <td class="classicLookPaging Paging"><table border="0" cellspacing="0" cellpadding="0" class="classicLookPaging Paging">
    <tbody><tr class="classicLookPaging Paging">
     <td><img alt="关注被禁用" src="./findcc_files/focus(disabled).gif" border="0"></td>
     <td><img alt="首页" src="./findcc_files/first(off).gif" border="0"></td>
     <td><img alt="上一页" src="./findcc_files/previous(off).gif" border="0"></td>
     <td><img alt="下一页" src="./findcc_files/forward(off).gif" border="0"></td>
     <td><img alt="末页" src="./findcc_files/last(off).gif" border="0"></td>
    </tr>
   </tbody></table></td>
 </tr>
</tbody></table>
                </div>
                <div class="button"></div>
            </div>
        
    </form>
    <br><input name="Submit2" value="关闭" type="button" class="button" onclick="window.close()">

    <script type="text/javascript">
        $(function(){

            $(".ajax-img").each(function(i){
                var id = $(this).attr('id');
                $(this).hover(function(){
                    var url = "";
                    var dataWrap = ""
                    var claName = $(this).attr("class").split(" ")[1];
                    if(claName == "st"){
                        url = "./ajaxSchoolTeaching.do?";
                        dataWrap = "divst"
                    }else if(claName == "ca"){
                        url = "./ajaxCoursearrangement.do";
                        dataWrap = "divca"
                    }
                    $.ajax({
                        type:'get',
                        dataType:'html',
                        url:url,
                        data:{epid:id},
                        success:function(data){
                            $(".ajax-img").eq(i).css({display:'none'});
                            $("#"+dataWrap+id).html(data);
                        }
                    })
                },function(){
                });
            });
        })
    </script>

            </td>
        </tr>
    </tbody></table>
    <table cellpadding="0" cellspacing="0" class="foot_tab">
        <tbody><tr>
            <td class="foot_left"></td>
            <td class="foot_right"></td>
        </tr>
    </tbody></table>
</center>


</body></html>