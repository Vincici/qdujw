//注：为避免中文乱码，页面中涉及的中文使用unicode


//根据院系ID，查找并创建教研组
function createTrGroupByDepId(depId,labName,depObj,v){

    //根据院系ID创建教研组
    var depTd=$(depObj).parent("td");
    var trGroupTd=depTd.siblings("td");
    trGroupTd.text("");
    $.ajax({
        type:'post',
        url:getContextPath()+'/findTrGroupByDepId.do',
        data:{"depId":depId},
        dataType:'json',
        success:function(data){
            //默认全部和未知
            //v==1表示默认值不为空，v==1表示默认值为空
            var selObj=$("<select name='"+labName+"'>" +
                "</select>");

            //select all
            if(v!=-1)
                selObj.append(  "<option value='"+(v=="1"?"-2":"")+"'>\u5168\u90e8</option>" );

            if(data!=null && data!=""){
                var jsonData=eval(data);
                for(var i=0;i<jsonData.length;i++)
                    selObj.append("<option value='"+jsonData[i][0]+"'>"+(jsonData[i][1])+"</option>");
            }
            depTd.next("th").text("\u6559\u7814\u7ec4");
            trGroupTd.append(selObj);
        }
    });
}


//根据院系ID，查找并创建专业
function createMajorByDepId(depId,depObj,v){
    var depObjId=$(depObj).attr("id");
    var suffix=depObjId.substring(depObjId.indexOf("_"));
    if(depId==1 || depId=="1"){//如果院系选择了全校，移除班级和专业方向整行
        $("tr#tr_"+suffix).remove();
    }else{
        $("tr#tr_"+suffix).find("select:eq(0) :option:gt(0)").remove();//
        $("tr#tr_"+suffix).find("select:eq(1) :option:gt(0)").remove();
    }

    //根据院系ID创建专业
    var depTd=$(depObj).parents("td"); //
    var majorTd=depTd.siblings("td");
    majorTd.find("select").find(":option:gt(0)").remove();

    $.ajax({
        type:'post',
        url:getContextPath()+'/findMajorByDepId.do',
        data:{"depId":depId},
        dataType:'json',
        success:function(data){
            //默认全部和未知
            //v==1表示默认值不为空，v==1表示默认值为空
            var selName=majorTd.find("select").attr("name");
            var selId=majorTd.find("select").attr("id");
            var selEvent=majorTd.find("select").attr("onchange");
            //因为这里要绑定事件，需要传入this,所以只是取出name和id并判断是否有onchange重新创建了一个select
            var selSpanObj=$("<span class='select'></span>");
            var selObj = $("<select name='"+selName+"' id='"+selId+"' "+((selEvent==null || selEvent=="null")?"":"onchange='createClassesAndDirection(this)'")+" >" +
                "<option value='"+(v=="1"?"-2":"")+"'>\u5168\u90e8</option>" +
                "</select>");
            if(data!=null && data!=""){
                var jsonData=eval(data);
                for(var i=0;i<jsonData.length;i++)
                    selObj.append("<option value='"+jsonData[i][0]+"'>"+(jsonData[i][1])+"</option>");
            }
            selSpanObj.append(selObj);
            majorTd.html(selSpanObj);
        }
    });
}

//根据专业ID、学生类别ID、年级ID，查找并创建班级和专业方向
function createClassesAndDirection(lab){
    var labId= $(lab).attr("id");//触发该事件的select标签的ID
    var suffix=labId.substring(labId.indexOf("_"));//一套“院系”到“专业方向”有相同的随机五位字符作为ID后缀
    //分别根据suffix获取majorid stusortid gradeid
    var majorid=$("select#majorid"+suffix).find(":selected").val();
    var stusortid=$("select#stusortid"+suffix).find(":selected").val();
    var gradeid=$("select#gradeid"+suffix).find(":selected").val();

    //找到专业下拉列表“全部”这一项的默认值，其班级和专业方向也按该值设定
    var defaultVal=$("select#majorid"+suffix).find(":option:eq(0)").val();
    if(majorid!="" && majorid!="-2"){  //如果院系不是选择的全部
        $.ajax({
            type:'post',
            url:getContextPath()+'/findClassesAndDirection.do',
            data:{"majorid":majorid,"stusortid":stusortid,"gradeid":gradeid,"defaultValue":defaultVal,"suffix":suffix},
            dataType:'html',
            success:function(data){
                $("tr#tr_"+suffix).remove();
                $("select#majorid"+suffix).parents("tr").after($(data));
            }
        });
    }else //如果院系选择的全部，则移除当前关联的班级和专业方向整行
        $("tr#tr_"+suffix).remove();
}

//根据学习形式创建校区select
function createAreaByLearnStyle(lab){
    var labId=$(lab).attr("id");
    var suffix=labId.substring(labId.indexOf("_"));
    var learnStyleId=$(lab).find(":selected").val();
    var areaObj=$("select[id^=areaid"+suffix+"]");
    $.ajax({
        type:'post',
        url:getContextPath()+'/findAreaByLearnStyleId.do',
        data:{"learnStyleId":learnStyleId},
        dataType:'json',
        success:function(data){
            areaObj.find(":option:gt(0)").remove(); //移除校区select中下标大于0的option
            if(data!=null && data!="" && data!="null"){
                var jsonData=eval(data);
                for(var i=0;i<jsonData.length;i++)
                    areaObj.append($("<option value=\""+(jsonData[i][0])+"\">"+jsonData[i][1]+"</option>"));
            }
        }
    });
}

function createStandardByTypeId(typeid,typeobj){
    var labId=$(typeobj).attr("id");
    var suffix=labId.substring(labId.indexOf("_"));
    var standardSel=$("select[name=standard][id$="+suffix+"]");
    $.ajax({
        type:'post',
        url:getContextPath()+'/findStandardByTypeId.do',
        data:{"typeid":typeid},
        dataType:'json',
        success:function(data){
            standardSel.find(":option:gt(0)").remove();
            if(data!=null && data!="null"){
                var jsonData=eval(data);
                for(var i=0;i<jsonData.length;i++)
                    standardSel.append($("<option value=\""+(jsonData[i][0])+"\">"+jsonData[i][1]+"</option>"));
            }
        }
    });
}

function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    return pathName.substr(0,index+1);
}
