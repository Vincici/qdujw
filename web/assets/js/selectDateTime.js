document.write("<style>");
document.write("#__calendarTime{margin:0;padding:0;background:#000}");
document.write("div.calendarDivTime{ margin:0;padding:0;border:1px solid #000;}");
document.write("div.calendarDivTime span{cursor:pointer}");
document.write("th,td{margin:0;padding:0px}");
document.write("table.calendarTableTime{ margin:0;padding:0;width:100%}");
document.write("table.calendarTableTime th ,table.calendarTableTime td{font:12px/20px Arial,sans-serif;text-align:center;}");
document.write("table.calendarTableTime thead th.week{border-top:1px solid #CCC;border-bottom:1px solid #ccc;background:#EEE;}");
document.write("table.calendarTableTime thead tr.function th{border:1px solid #fff}");
document.write("table.calendarTableTime tr{background:#fff}");
document.write("table.calendarTableTime thead tr.top{letter-spacing:1px;}");
document.write("table.calendarTableTime thead a{color:#000;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #ccc;background:#E1F1FF;}");
document.write("table.calendarTableTime tbody a:hover{color:#990;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #ccc;background:#E1F1FF;}");
document.write("table.calendarTableTime thead a.today{width:98% !important;width:100%}");
document.write("table.calendarTableTime thead a.today:hover{width:98% !important;width:100%}");
document.write("table.calendarTableTime td{width:21px;height:20px;border-bottom:1px solid #E6E6E6;color:#fff;}");
document.write("table.calendarTableTime th{height:21px;}");
document.write("table.calendarTableTime tr.com{background:#fff;}");
document.write("table.calendarTableTime tr.cur{background:#F0FAFF;}");
document.write("table.calendarTableTime tbody a{color:#000;width:19px;height:18px;text-decoration:none;display:block;border:1px solid #fff;}");
document.write("table.calendarTableTime tbody a:hover{color:#990;width:19px;height:18px;text-decoration:none;border:1px solid #E6E6E6;background:#E1F1FF;display:block;}");
document.write("table.calendarTableTime tbody a.today{color:#c00;border:1px solid #DBDBDB;background:#CCE4FF;}");
document.write("table.calendarTableTime tbody a.today:hover{color:#990;border:1px solid #DBDBDB;background:#CCE4FF;}");
document.write("table.calendarTableTime tbody a.week{color:#c00;}");
document.write("div.calendarTfoot{background:#EEE;text-align:center;}");
document.write("div.calendarTfoot table{width:100%}");
document.write("table.calendarTfoot td{background:#EEE;width:auto;text-align:center}");
document.write("table.calendarTfoot td span{cursor:pointer;display:block;color:#000;}");
document.write("table.calendarTfoot td span{cursor:pointer;display:block;color:#000;}");
document.write("table.calendarTfoot td.maohao{text-align:center;color:#000}");
document.write("table.calendarTfoot td input{border:1px solid #ccc;background:#E1F1FF;}");
document.write("</style>");
document.write("<div id='__calendarTime' style='width:158px;height:170px !important;height:185px;position:absolute;display:none;z-index:9998'></div>");
document.write("<div id=\"__calendarDivTime\" class=\"calendarDivTime\"><table cellspacing=\"0\" cellpadding=\"0\" class=\"calendarTableTime\"><thead><tr class=\"top\"><th>&nbsp;</th><th colspan=\"5\" id=\"sohwdateTime\"><span id=\"showyearTime\"></span>-<span id=\"showmonthTime\"></span></th><th><a href=\"javascript:void(0);\" title=\"\u5173\u95ed\" onclick=\"shutTime()\">C</a></th></tr><tr class=\"function\"><th><a href=\"javascript:void(0);\" title=\"\u4e0a\u4e00\u5e74\" onclick=\"preYearTime()\">&lt;&lt;</a></th><th><a href=\"javascript:void(0);\" title=\"\u4e0a\u6708\" onclick=\"preMonthTime()\">&lt;</a></th><th colspan=\"3\"><a href=\"javascript:void(0);\" class=\"today\" title=\"\u4eca\u5929\" onclick=\"getDateTime('0')\">\u4eca\u5929</a></th><th><a href=\"javascript:void(0);\" title=\"\u4e0b\u6708\" onclick=\"nextMonthTime()\">&gt;</a></th><th><a href=\"javascript:void(0);\" title=\"\u4e0b\u4e00\u5e74\" onclick=\"nextYearTime()\">&gt;&gt;</a></th></tr><tr><th class=\"week\">\u65e5</th><th class=\"week\">\u4e00</th><th class=\"week\">\u4e8c</th><th class=\"week\">\u4e09</th><th class=\"week\">\u56db</th><th class=\"week\">\u4e94</th><th class=\"week\">\u516d</th></tr></thead><tbody id=\"calendarTbodyTime\"></tbody></table><div class=\"calendarTfoot\" id=\"_calendarTfoot\"><table><tr><td width=\"20%\">&nbsp;</td><td id=\"_hourTime\" width=\"20%\"></td><td class=\"maohao\" width=\"8%\">&#58;</td><td id=\"_minuteTime\" width=\"20%\"></td><td ><input type=\"button\" value=\"OK\" onclick=\"calCloseTime()\" /></td></tr></table></div></div>");
document.write("<iframe id=\"__calframeTime\" src=\"javascript:false;\" scrolling=\"no\" frameborder=\"0\" style=\"position:absolute;display:none;background-color:#FFF\">&nbsp;</iframe>");


var objInputTime;
var isShowTime = true;
var showFormatTime;
var objouterTime=document.getElementById("__calendarTime");
var iframeobjTime = document.getElementById("__calframeTime");
var calendarTableTime = document.getElementById("__calendarDivTime");
objouterTime.appendChild(calendarTableTime);

function setdaytime(obj){
    try{
        objInputTime = obj;
        showFormatTime = false;
        objouterTime.style.top =getAbsoluteHeightTime(objInputTime)+getAbsoluteTopTime(objInputTime);
        objouterTime.style.left =getAbsoluteLeftTime(objInputTime);
        iframeobjTime.style.width = objouterTime.style.width;
        iframeobjTime.style.height = objouterTime.style.height;
        iframeobjTime.style.top = objouterTime.style.top;
        iframeobjTime.style.left = objouterTime.style.left;
        iframeobjTime.style.zIndex = objouterTime.style.zIndex - 1;
        iframeobjTime.style.display = "block";
        objouterTime.style.display = "block";
        initTime();
        writeDate_time();
        if(objInputTime.getAttribute("title") == "yyyy-mm-dd HH:MM"){
            tfootTime.style.display = "";
            writeTime_time();
        }else{
            tfootTime.style.display = "none";
            iframeobjTime.style.height = objouterTime.style.height;
        }
        sohwDate_time();
    }catch (e){
        alert("error");
    }
}

function getAbsoluteHeightTime(ob){return ob.offsetHeight;}
function getAbsoluteWidthTime(ob){return ob.offsetWidth;}
function getAbsoluteLeftTime(ob){var s_el=0;el=ob;while(el){s_el=s_el+el.offsetLeft;el=el.offsetParent;}; return s_el}
function getAbsoluteTopTime(ob){var s_el=0;el=ob;while(el){s_el=s_el+el.offsetTop ;el=el.offsetParent;}; return s_el}

var daysInMonthTime = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var yearstartTime = 1970;
var yearendTime = 2015;
var toDayTime = new Date();
var tempYearTime = toDayTime.getFullYear();
var tempMonthTime = toDayTime.getMonth();
var tempDateTime = toDayTime.getDate();
var tempHourTime = toDayTime.getHours();
var tempMinuteTime = "00";
var tbodyTime = document.getElementById("calendarTbodyTime");
var tfootTime = document.getElementById("_calendarTfoot");
var sohwIdTime = document.getElementById("sohwdateTime");
function getDaysTime(month, year)
{
    if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
    else return daysInMonthTime[month];
}

function initTime(){
    var timeArray = new Array();
    if(objInputTime.value != ""){
        if(objInputTime.value.search(/\s/) != -1){
            timeArray = objInputTime.value.split(" ");
            var timeArr = timeArray[1].split(":");
            tempHourTime = timeArr[0];
            tempMinuteTime = timeArr[1];
        }else{
            timeArray[0] = objInputTime.value;
            tempHourTime = toDayTime.getHours();
            tempMinuteTime = "00";
        }
        var dateArr = timeArray[0].split("-");
        tempYearTime = parseInt(dateArr[0]);
        tempMonthTime = parseInt(dateArr[1],10)-1;
        tempDateTime = parseInt(dateArr[2],10);

    }else{
        tempYearTime = toDayTime.getFullYear();
        tempMonthTime = toDayTime.getMonth();
        tempDateTime = toDayTime.getDate();
        tempHourTime = toDayTime.getHours();
        tempMinuteTime = "00";
    }
}

function writeTime_time(){
    var hour=document.getElementById("_hourTime");
    var minute=document.getElementById("_minuteTime");
    hour.innerHTML = "<span onclick=\"innerValTime(this,'hour')\">" + tempHourTime + "</span>";
    minute.innerHTML = "<span onclick=\"innerValTime(this,'minute')\">" + tempMinuteTime + "</span>";

}

function innerValTime(obj,type){
    isShowTime = false;
    var textStr = "<select onchange=\"confirmValTime(this,this.options[this.selectedIndex].text,'"+type+"')\">",selectedStr = "",tstr;
    switch(type){
        case "hour":
            for(var i = 0;i < 24 ; i++){
                if(tempHourTime == i) selectedStr = "selected";
                if(i<10) tstr = "0"+i; else tstr = i;
                textStr += "<option " +  selectedStr + ">" + tstr + "</option>";
                selectedStr = "";
            }
            break;
        case "minute":
            for(var i = 0;i < 60 ; i++){
                if(tempMinuteTime == i) selectedStr = "selected";
                if(i<10) tstr = "0"+i;  else tstr = i;
                textStr += "<option " +  selectedStr + ">" + tstr + "</option>";
                selectedStr = "";
            }
            break;
        case "year":
            for(var i = yearstartTime;i < yearendTime ; i++){
                if(tempYearTime == i) selectedStr = "selected";
                textStr += "<option " +  selectedStr + ">" + i + "</option>";
                selectedStr = "";
            }
            break;
        case "month":
            for(var i = 0;i < 12 ; i++){
                if(tempMonthTime == i) selectedStr = "selected";
                tstr = i + 1;
                textStr += "<option " +  selectedStr + ">" + tstr + "</option>";
                selectedStr = "";
            }
            break;
    }
    textStr += "</select>";
    parentObj=obj.parentNode;
    parentObj.innerHTML = textStr;
}

function confirmValTime(obj,str,type){
    isShowTime = false;
    parentObj=obj.parentNode;
    switch(type){
        case "hour":
            tempHourTime = str;
            parentObj.innerHTML = "<span onclick=\"innerValTime(this,'hour')\">"+str+"</span>";
            getDateTime();
            break;
        case "minute":
            tempMinuteTime = str;
            parentObj.innerHTML = "<span onclick=\"innerValTime(this,'minute')\">"+str+"</span>";
            getDateTime();
            break;
        case "year":
            tempYearTime = str;
            parentObj.innerHTML = "<span onclick=\"innerValTime(this,'year')\">"+str+"</span>";
            writeDate_time();
            break;
        case "month":
            tempMonthTime = eval(str - 1);
            parentObj.innerHTML = "<span onclick=\"innerValTime(this,'month')\">"+str+"</span>";
            writeDate_time();
            break;
    }
}


function writeDate_time() {
    var curCal = new Date(tempYearTime,tempMonthTime ,1);
    var startDay = curCal.getDay();
    var daily = 0;
    var today = tempDateTime;
    //if(tempYearTime != toDayTime.getFullYear() || tempMonthTime != toDayTime.getMonth()) toDayTime = -1;
    var todayStyle = "";
    var weekEndStyle = "";
    clearTime();
    var intDaysInMonth =getDaysTime(curCal.getMonth(), curCal.getFullYear());
    var weeks = (intDaysInMonth + startDay) % 7 == 0 ? (intDaysInMonth + startDay) / 7 : parseInt((intDaysInMonth + startDay ) / 7) + 1;
    if(weeks == 6){ iframeobjTime.style.display = "none";  iframeobjTime.style.height = "208px"; iframeobjTime.style.display = "block"; }else{iframeobjTime.style.display = "none";  iframeobjTime.style.height = objouterTime.style.height; iframeobjTime.style.display = "block"; }
    for (var intWeek = 1; intWeek <= weeks; intWeek++){
        var tr = document.createElement("tr");
        tr.setAttribute("onmouseover","javascript:this.className='cur'");
        tr.setAttribute("onmouseout","javascript:this.className='com'");
        tr.onmouseover = function (){this.className = "cur";}
        tr.onmouseout = function (){this.className = "com";}
        for (var intDay = 0;intDay < 7;intDay++){
            var td = document.createElement("td");
            if ((intDay == startDay) && (0 == daily))
                daily = 1;

            if(today == daily)  todayStyle="today";

            if (intDay == 6 || intDay == 0) weekEndStyle = "week" ;

            if ((daily > 0) && (daily <= intDaysInMonth))
            {
                td.innerHTML = "<a href=\"javascript:void(0);\" class=\""+ weekEndStyle + todayStyle +"\" onclick=\"getDateTime('"+daily+"')\" title=\""+eval(tempMonthTime+1)+"-"+daily+"\">" + daily + "</a>";
                todayStyle = "";
                weekEndStyle = "";
                daily++;
            }else{
                td.innerHTML = "&nbsp;";
                todayStyle = "";
                weekEndStyle = "";
            }
            tr.appendChild(td);
        }
        tbodyTime.appendChild(tr);
    }

}
function getDateTime(day){
    isShowTime = false;
    var year , month ,date;
    if(day == "0"){
        year = toDayTime.getFullYear();
        month = eval(toDayTime.getMonth()+1) < 10 ? "0"+eval(toDayTime.getMonth()+1) : eval(toDayTime.getMonth()+1);
        date = toDayTime.getDate() < 10 ? "0"+toDayTime.getDate() : toDayTime.getDate();
    }else{
        year = tempYearTime;
        month = eval(tempMonthTime+1) < 10 ? "0"+eval(tempMonthTime+1) : eval(tempMonthTime+1);
        if(day == null || day == "") {
            date = tempDateTime + "";
            date = ((date < 10) && (date.length < 2)) ? "0"+date : date;
        }else{
            tempDateTime = day;
            date = ((day < 10) && (day.length < 2)) ? "0"+day : day;
        }
    }

    objInputTime.value = year + "-" + month +"-"+ date;
    if(objInputTime.getAttribute("title") == "yyyy-mm-dd HH:MM")
        objInputTime.value = objInputTime.value + " " + tempHourTime + ":" + tempMinuteTime;
    //calCloseTime();
}
function sohwDate_time(){
    //sohwIdTime.innerHTML = "<span onclick=\"innerValTime(this,'year')\">" + tempYearTime + "Y</span><span onclick=\"innerValTime(this,'month')\">" + eval(tempMonthTime+1) +"M</span>";
    document.getElementById("showyearTime").innerHTML = "<span onclick=\"innerValTime(this,'year')\">" + tempYearTime + "</span>";
    document.getElementById("showmonthTime").innerHTML = "<span onclick=\"innerValTime(this,'month')\">" + eval(tempMonthTime+1) +"</span>";
}
function preYearTime(){
    isShowTime = false;
    if(tempYearTime > 999 && tempYearTime < 10000){
        tempYearTime--;
    }else{
        alert("overstep(1000-9999)");
    }
    sohwDate_time();
    writeDate_time();
}
function nextYearTime(){
    isShowTime = false;
    if(tempYearTime > 999 && tempYearTime < 10000){
        tempYearTime++;
    }else{
        alert("overstep(1000-9999)");
    }
    sohwDate_time();
    writeDate_time();
}

function preMonthTime(){
    isShowTime = false;
    if(tempMonthTime >= 1){tempMonthTime--}else{tempYearTime--;tempMonthTime = 11;}
    sohwDate_time();
    writeDate_time();
}
function nextMonthTime(){
    isShowTime = false;
    if(tempMonthTime == 11){tempYearTime++;tempMonthTime = 0}else{tempMonthTime++}
    sohwDate_time();
    writeDate_time();
}
function clearTime(){
    var nodes = tbodyTime.childNodes;
    var nodesNum = nodes.length;
    for(var i=nodesNum-1;i>=0;i--) {
        tbodyTime.removeChild(nodes[i]);
    }
}
function shutTime(){
    calCloseTime();
}
function calCloseTime(){
    tempYearTime = toDayTime.getFullYear();
    tempMonthTime = toDayTime.getMonth();
    clearTime();
    objouterTime.style.display = "none";
    iframeobjTime.style.display = "none";
    objouterTime.style.top = 0;
    objouterTime.style.left = 0;
    iframeobjTime.style.top = 0;
    iframeobjTime.style.left = 0;
}
function ventTime(event){
    if(document.all){
        if(isShowTime){
            try
            {
                if (window.event.srcElement != objouterTime && window.event.srcElement != objInputTime) calCloseTime();
            }
            catch(e)
            {
                calCloseTime();
            }

            isShowTime = true;
            return;
        }
        isShowTime = true;
    }else{
        //alert("ff");
        if(isShowTime){
            //   console.log((event.target != objouterTime && event.target != objInputTime && event.target.tagName.toLowerCase() != "select" && event.target.tagName.toLowerCase() != "option"));
            if(event.target != objouterTime && event.target != objInputTime && event.target.tagName.toLowerCase() != "select" &&  event.target.tagName.toLowerCase() != "option"){
                calCloseTime();
            }
            isShowTime = true;
        }
        isShowTime = true;
    }
}
document.onclick = ventTime;
