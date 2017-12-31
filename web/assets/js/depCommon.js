//ע��Ϊ�����������룬ҳ�����漰������ʹ��unicode


//����ԺϵID�����Ҳ�����������
function createTrGroupByDepId(depId,labName,depObj,v){

    //����ԺϵID����������
    var depTd=$(depObj).parent("td");
    var trGroupTd=depTd.siblings("td");
    trGroupTd.text("");
    $.ajax({
        type:'post',
        url:getContextPath()+'/findTrGroupByDepId.do',
        data:{"depId":depId},
        dataType:'json',
        success:function(data){
            //Ĭ��ȫ����δ֪
            //v==1��ʾĬ��ֵ��Ϊ�գ�v==1��ʾĬ��ֵΪ��
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


//����ԺϵID�����Ҳ�����רҵ
function createMajorByDepId(depId,depObj,v){
    var depObjId=$(depObj).attr("id");
    var suffix=depObjId.substring(depObjId.indexOf("_"));
    if(depId==1 || depId=="1"){//���Ժϵѡ����ȫУ���Ƴ��༶��רҵ��������
        $("tr#tr_"+suffix).remove();
    }else{
        $("tr#tr_"+suffix).find("select:eq(0) :option:gt(0)").remove();//
        $("tr#tr_"+suffix).find("select:eq(1) :option:gt(0)").remove();
    }

    //����ԺϵID����רҵ
    var depTd=$(depObj).parents("td"); //
    var majorTd=depTd.siblings("td");
    majorTd.find("select").find(":option:gt(0)").remove();

    $.ajax({
        type:'post',
        url:getContextPath()+'/findMajorByDepId.do',
        data:{"depId":depId},
        dataType:'json',
        success:function(data){
            //Ĭ��ȫ����δ֪
            //v==1��ʾĬ��ֵ��Ϊ�գ�v==1��ʾĬ��ֵΪ��
            var selName=majorTd.find("select").attr("name");
            var selId=majorTd.find("select").attr("id");
            var selEvent=majorTd.find("select").attr("onchange");
            //��Ϊ����Ҫ���¼�����Ҫ����this,����ֻ��ȡ��name��id���ж��Ƿ���onchange���´�����һ��select
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

//����רҵID��ѧ�����ID���꼶ID�����Ҳ������༶��רҵ����
function createClassesAndDirection(lab){
    var labId= $(lab).attr("id");//�������¼���select��ǩ��ID
    var suffix=labId.substring(labId.indexOf("_"));//һ�ס�Ժϵ������רҵ��������ͬ�������λ�ַ���ΪID��׺
    //�ֱ����suffix��ȡmajorid stusortid gradeid
    var majorid=$("select#majorid"+suffix).find(":selected").val();
    var stusortid=$("select#stusortid"+suffix).find(":selected").val();
    var gradeid=$("select#gradeid"+suffix).find(":selected").val();

    //�ҵ�רҵ�����б�ȫ������һ���Ĭ��ֵ����༶��רҵ����Ҳ����ֵ�趨
    var defaultVal=$("select#majorid"+suffix).find(":option:eq(0)").val();
    if(majorid!="" && majorid!="-2"){  //���Ժϵ����ѡ���ȫ��
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
    }else //���Ժϵѡ���ȫ�������Ƴ���ǰ�����İ༶��רҵ��������
        $("tr#tr_"+suffix).remove();
}

//����ѧϰ��ʽ����У��select
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
            areaObj.find(":option:gt(0)").remove(); //�Ƴ�У��select���±����0��option
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
