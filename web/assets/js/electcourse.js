function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    return pathName.substr(0,index+1);
}


$(function(){
    $("img#examine").bind("mouseover",function(){
        var propPage=$(":hidden[name='propPage']").val();
        $.post("statSelectedCourse.do",{"propPage":propPage},function(data){
            $("label#selectCourseCredit").text(data.split(",")[0]);
            $("label#selectCourseCount").text(data.split(",")[1]);
        });
        $(this).remove();
    });
    //页面加载中，请稍候。。。
    showLoading("\u9875\u9762\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u5019\u3002\u3002\u3002", false);//打开页面等待提示遮罩
   //alert(($(":hidden[name='studentId']").val()));
    var jsonUrl=$(":hidden[name='Electcourse_FilePath']").val()+($(":hidden[name='studentId']").val())+".json?jsoncallback=jcallback";
   // alert(jsonUrl);
    $.getScript(jsonUrl);
//    以下方式，360浏览器不支持
//    $.ajax({type:'get',
//        url : "http://139.129.96.25/s"+($(":hidden[name='studentId']").val())+".json?jsoncallback=jcallback",
//        dataType : 'jsonp'});
});

function jcallback(jsonData){ //回调函数名与请求参数和json文件中的名称一致
    var contextPath = getContextPath();
    var prop=getHideValue("propPage");//0、1分表表示必修、限选
    var scStuCourseFreeJson=getHideValue("scStuCourseFreeJson");//等于2表示任选课
    var studentAreaId=getHideValue("studentAreaId");// 校区ID，为空全部显示，不为空时只显示校区ID等于 studentAreaId的课程
    var canAdd=getHideValue("canAdd");//不等于0时不出选课按钮
    var selectedCidList=getHideValue("selectedCidList");//已选的cid
    var ele = $("#data-infor"); //列表table
    if(canAdd!=0)
        ele.find("th:first,th:last").remove();
    var arr="";

    var aliasStr="";
    for(var i=0;i<jsonData.length;i++){
        var e = jsonData[i];
        aliasStr+= scStuCourseFreeJson==2 || e.PROP==prop ==prop?e.ALIAS:"";
        //课程属性是限选 或者 必修限选 并且 已选列表为空 或者 当前课程不在已选课程中，并且 studentAreaId等于空 或者 和当前校区一致
        if((scStuCourseFreeJson==2 || e.PROP==prop) && (selectedCidList==",," || selectedCidList.indexOf(','+ e.CID +',')==-1) && (studentAreaId==null || studentAreaId=="" || studentAreaId== e.AID)){
            ele.append('<tr>' +
                (canAdd==0?'<td align="center"><input type="button" onclick="waitingTip();window.location.href=\'./scaddaction.do?propSc='+prop+'&pcourseid='+ e.PCOURSEID +'&seq='+ e.CSEQ +'\'" value="\u9009\u8bfe" class="button"/></td>':'') +
                '<td class="SEARCH_PCOURSEID">'+e.PCOURSEID+'</td><td class="SEARCH_COURSENAME">'+e.COURSENAME +'</td><td>'+e.CSEQ+'</td>' +
                '<td class="FLAG_ALIAS">'+e.ALIAS+'</td><td>'+e.SCHEDULEGROUPNAME+'</td>' +
                '<td class="SEARCH_CREDIT" align="center">'+e.CREDIT+'</td>' +
                '<td>'+e.DEPNAME+'</td><td>'+e.ANAME+'</td><td align="center">'+e.EXAMMANNER+'</td>' +
                '<td align="center" id="course_capability_'+ e.EPID +'"></td><td align="center" id="amount_'+ e.EPID +'"></td><td align="center" id="remain_capability_'+ e.EPID +'"></td>' +
                '<td align="center"><img onmouseover="getDetailInfo('+e.EPID+',1,this)" src="'+contextPath+'/styles/images/see.gif"/></td>' +
                '<td align="center" class="FLAG_AMALGAMATIVE"><img onmouseover="getDetailInfo('+e.EPID+',2,this)" src="'+contextPath+'/styles/images/see.gif"/></td>' +
                '<td align="center"><img onmouseover="getDetailInfo('+e.EPID+',3,this)" src="'+contextPath+'/styles/images/see.gif"/></td>' +  //当课程属性为任选时，没有合班。
                (canAdd==0?'<td align="center"><input type="button" onclick="waitingTip();window.location.href=\'./scaddaction.do?propSc='+prop+'&pcourseid='+ e.PCOURSEID +'&seq='+ e.CSEQ +'\'" class="button" value="\u9009\u8bfe" /></td></tr>':''));
            arr= arr+e.EPID+",";
        }
    }
    $("div#overlay,div#loading").hide();//隐藏页面等待提示遮罩
    if(aliasStr.trim()=="")//如果课程班别名都为空隐藏这一列
        ele.find(".FLAG_ALIAS").remove();
    if(scStuCourseFreeJson==2)//如果是任选课不显示合班
        ele.find(".FLAG_AMALGAMATIVE").remove();
    if(arr!=""){
        var showOverflowCapability = getHideValue("showOverflowCapability");
        $.post("ajaxCoursecapabilityAmount.do",{"epid":arr},function(data){
            var jsonData = eval(data);
            for(var i =0;i<jsonData.length;i++){
                var e = jsonData[i];
                if(showOverflowCapability==1 && e.remainCapability<=0){ //如果课余量是0，并且showOverflowCapability=1隐藏无课余量课程班，则隐藏该行
                    $("td#course_capability_"+ e.epid).parent("tr").remove();
                }else{
                    $("td#course_capability_"+ e.epid).text(e.courseCapability);
                    $("td#amount_"+ e.epid).text(e.amount);
                    $("td#remain_capability_"+ e.epid).text(e.remainCapability);
                }
            }
        });
    }


}

function getHideValue(hideName){
    return $("form[name='addForm'] :hidden[name='"+hideName+"']").val();
}

/**
 * 获取任课教师、合班、课程安排的详细信息
 * @param epid
 * @param type 0任课教师，1合班，2课程安排
 * @param cell 单元格对象
 */
function getDetailInfo(epid,type,cell){
    var url=getContextPath()+"/manager/electcourse/ajaxSchoolTeaching.do";
    if(type==2)
        url=url.substr(0,url.lastIndexOf("/"))+"/ajaxAmalgamative.do";
    else if(type==3)
        url=url.substr(0,url.lastIndexOf("/"))+"/ajaxCoursearrangement.do";
    url+="?epid="+epid;
    $.post(url,{"epid":epid},function(data){
        $(cell).parent("td").html(data);
    });
}

function switchTable(t){
    var img = $(t);
    var tab = $("table.datalist#table1");
    if(img.attr("src").indexOf("upback.jpg")==-1){
        img.attr("src",getContextPath()+"/styles/default/image/upback.jpg");
        tab.show();
    }else{
        img.attr("src",getContextPath()+"/styles/default/image/downback.jpg");
        tab.hide();
    }
}


function searchByInput(){
    var $trs=$("table#data-infor.datalist tr:gt(0)").hide();
    var $conditions = $("table.search_condition_form :text[name^='SEARCH_'][value!='']");
    var conditionCount = $conditions.length;
    if(conditionCount>0)
        $trs.each(function(){
            var $tr = $(this);
            var passTd=0;
            $conditions.each(function(){
                var n=$(this).attr("name");
                var v= $.trim($(this).val());
//                    || name=="SEARCH_CREDIT" && parseFloat($tr.find("td."+name).text())==parseFloat(value)
                passTd=v!="" && $tr.find("td."+n+":contains("+v+")").length!=0?passTd+1:passTd;
            });
            if(conditionCount==passTd)
                $tr.show();
        });
    else
        $trs.show();
}


function initalert(mgs,noMgsFlag) {



    if (noMgsFlag == 1) {
        $("#successdiv").dialog({height:180, width:400, modal:true});
        $("#ui-dialog-title-successdiv").html("\u9009\u8bfe\u6210\u529f");
        $("#successdiv").html("\u9009\u8bfe\u6210\u529f");
        $("#successdiv").addClass("alertdivsuccesss");

    }
    else if (noMgsFlag == 2) {
        $("#alertdiv").dialog({height:180, width:400, modal:true});
        $("#ui-dialog-title-alertdiv").html("\u9009\u8bfe\u5931\u8d25");
        $("#alertdiv").html(mgs);
        $("#alertdiv").addClass("alertdiverror");
    }
    else if (noMgsFlag == 3) {
        $("#successdiv").dialog({height:180, width:400, modal:true});
        $("#ui-dialog-title-successdiv").html("\u9000\u8bfe\u6210\u529f");
        $("#successdiv").html("\u9000\u8bfe\u6210\u529f");
        $("#successdiv").addClass("alertdivsuccesss");
    }
    else if (noMgsFlag == 4) {
        $("#alertdiv").dialog({height:180, width:400, modal:true});
        $("#ui-dialog-title-alertdiv").html("\u9000\u8bfe\u5931\u8d25");
        $("#alertdiv").addClass("alertdiverror");
        $("#alertdiv").html(mgs);
    }
}

function waitingTip() {
    showLoading("\u8bf7\u7b49\u5f85...", false);
}