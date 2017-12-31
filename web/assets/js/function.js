//email地址校验
function checkEmail(email)
{
    if (email=="") return false;
    if (email.indexOf("@",1)<0) return false;
    if (email.indexOf(".",email.indexOf("@",1)+1)<0) return false;
    if (email.indexOf(".")-email.indexOf("@")<2) return false;
    if (email.indexOf(".",email.length-1)>0) return false;
    return true;
}

//－－－－－－－－－验证非法字符－－－－－－－－－－－－//

function validateChar(str){
    var i=0;
     var reserveSqlWord=new Array(
        "ABOUT","ACCUM",",","AND","&","BT","BTG","BTI","BTP","FUZZY",
        "?","{","}","\\","(",")","[","]","HASPATH","INPATH","MDATA",
        "MINUS","-","NEAR",";","NOT","~","NT","NTG","NTI","NTP","OR",
        "|","PT","RT","$","!","SQE","SYN",">","TR","TRSYN","TT","*","%",
        "WITHIN","_");
    for(i=0;i<reserveSqlWord.length;i++){
        if(str.indexOf(reserveSqlWord[i])>-1){
            alert("包含非法字符 "+reserveSqlWord[i]+"  请修改!");
            return false;
        }
    }
    return true;
}
///***********************************************/
//输入的数据校验
function onlydigital()
{
	//189:-,190:enter,110:.,84:.,109:-,37:<-,39:->
	var iCode=event.keyCode;
	//alert(iCode);
	if(((iCode<48)||((iCode>57)&&(iCode<96))||iCode>105)&&((iCode!=8)&&
		(iCode!=9)&&(iCode!=46)&&(iCode!=109)&&(iCode!=37)&&(iCode!=39)))
	{
		event.returnValue=false;
	}
}

///******************************************************************************/
//去除空格的函数
//=============================================
//去除左空格
//=============================================
function jsLTrim(str)
{
	var rtnStr;
	rtnStr=""
	for (var i=0;i<str.length;i++)
	{
		if (str.charAt(i)!=" ")
		{
			rtnStr=str.substr(i);
			break;
		}
	}
	return rtnStr;
}

//==========================================
//去除右空格
//==========================================
function jsRTrim(str)
{
	var rtnStr;
	rtnStr=""
	for (var i=str.length-1;i>=0;i--)
	{
		if (str.charAt(i)!=" ")
		{
			rtnStr=str.substring(0,i+1);
			break;
		}
	}
	return rtnStr;
}
//==========================================
//去除左右两侧的空格
//==========================================
function jsTrim(str)
{
	return(jsLTrim(jsRTrim(str)));
}
//==========================================
//判断字符串是否为空或空格 edit by lwj 2005-4-14
//==========================================
function isEmpty(string_value){
		string_value=jsTrim(string_value)
		if (string_value.length==0){
			return true;
		}
		return false;
	}
/******************************************************************************/
//检查输入是否为日期类型
function checkDate(inString,fieldName)
{
	var tempDate;
	inString = jsTrim(inString);
	var a = new Date(inString);
	var y = a.getFullYear();
	var m = a.getMonth()+1;
	var d = a.getDate();
	var myday = y + "/" + m + "/" + d;
	if (myday != inString)
	{
		alert("请为" + fieldName  + "输入一有效日期(yyyy/m/d)。形如：2003/2/14");
		return false;
	}
	return true;
}
/******************************************************************************/
//检查输入是否为身份证号码
function ChkIDNumber(objID)
{
	var strID = objID.value;

	if (strID.length != 15 && strID.length != 18)
	{
		alert("身份证号只能为 15 位或 18 位数字，请重新输入！");
		objID.focus();
		return false;
	}

	return true;
}

function SetFormChName(form)
{
	if (form.stustatusid&&form.stustatusname&&form.stustatusid.options)
		form.stustatusname.value=form.stustatusid.options[form.stustatusid.selectedIndex].text;

	if (form.schoolstatusid&&form.schoolstatusname&&form.schoolstatusid.options)
		form.schoolstatusname.value=form.schoolstatusid.options[form.schoolstatusid.selectedIndex].text;

	if (form.classid&&form.classname&&form.classid.options)
		form.classname.value=form.classid.options[form.classid.selectedIndex].text;

	if (form.depid&&form.depname&&form.depid.options)
        {
            form.depname.value=form.depid.options[form.depid.selectedIndex].text;
            while (form.depname.value.indexOf("-")!=-1)
                form.depname.value=form.depname.value.replace("-","");
        }

	if (form.majorid&&form.majorname&&form.majorid.options)
		form.majorname.value=form.majorid.options[form.majorid.selectedIndex].text;

	if (form.stusortid&&form.stusortname&&form.stusortid.options)
		form.stusortname.value=form.stusortid.options[form.stusortid.selectedIndex].text;

	if (form.gradeid&&form.gradename&&form.gradeid.options)
		form.gradename.value=form.gradeid.options[form.gradeid.selectedIndex].text;

	if (form.graduatetypeid&&form.graduatetypename&&form.graduatetypeid.options)
		form.graduatetypename.value=form.graduatetypeid.options[form.graduatetypeid.selectedIndex].text;

    if (form.graduatedateid&&form.graduatedatename)
		form.graduatedatename.value=form.graduatedateid.value;


	if (form.traingmodeid&&form.traingmodename&&form.traingmodeid.options)
		form.traingmodename.value=form.traingmodeid.options[form.traingmodeid.selectedIndex].text;

}



function chooseall(objForm,boxname)    //全选
{
  for(i=0;i<objForm.elements.length;i++){
      if ((objForm.elements[i].disabled!=true)&&(objForm.elements[i].name==boxname))
        objForm.elements[i].checked=true;
  }
}

function cancelall(objForm)  //取消全选
{
  for(i=0;i<objForm.elements.length;i++)
    objForm.elements[i].checked=false;
}

/*----------------------------------------------------
 *  isChk（）方法，主要功能用于判断是否选择了复选框;
 *  调用方法:
 *   isChk(chkName)
 *   参数说明:
 *    chkName: 复选框的name值;
 *    若选择了复选择则返回True，反之返回False;
 *    注意：参数要加上双引号或单引号;
 *
----------------------------------------------------*/
function isChk(chkName){
    var chkObj = $N(chkName);
    for(var i = 0; i < chkObj.length; i++){
        if( chkObj[i].checked ) return true;
    }
    return false;
}

/*-----检查是否选择了下拉菜单------------
 *  isSelect（）方法，主要功能用于检查是否选择了下拉菜单的选项;
 *  调用方法:
 *   isSelect(selectId)
 *   参数说明:
 *    selectId: 下拉菜单的Id值;
 *    若选择了则返回True，反之返回False;
 *    注意：参数要加上双引号或单引号;
 */

function gotoURL(urlStr){
    document.location.href = urlStr;
}


/*--------------------------------------loading------------------------------*/
function showLoading(msg,cancel){
      //-----for ie6
/*    if($.browser.version == '6.0'){
            $('select').css('visibility','hidden');
    }*/
    $(document.body).append('<div id="overlay"></div>');
    if(cancel){
           $('#overlay').after('<div id="loading"><p><span class="description">'+ msg +'</span><input type="button" class="button" value="'+ cancel +'" /></p></div>');
    }else{
            $('#overlay').after('<div id="loading"><p><span class="description">'+ msg +'</span></p></div>');
    }
    var bodyWidth = $(document).width();
    var bodyHeight = $(document).height();
    $('#overlay').css({
        width:bodyWidth,
        height:bodyHeight,
        opacity:0.5
    });

    $(window).resize(function(){
           var bodyWidth = $(document).width();
           var bodyHeight = $(document).height();
           $('#overlay').css({
                width:bodyWidth,
                height:bodyHeight,
                opacity:0.5
            });
    });

    }

function hideLoading(){
      $('#overlay').remove();
      $("#loading").remove();
       //-----for ie6
        if($.browser.version == '6.0'){
                $('select').css('visibility','visible');
        }
}

///*--------------------------show/hide more rows--------------------------------*/
///*
//window.onload = function(){
//    showHideMoreRows()
//}
// */
function showHideMoreRows(){
     $('table.datalist > tbody > tr').each(function(i){
              var $thisRow = $(this);
              var $subtable = $(this).find('table.subtable');
              //-------default hidden
              if($subtable.find('tr').length > 1){
                   $subtable.find('tr:gt(0)').css('display','none');
                   $subtable.find('tr:first').css('background-color','#FAF1C9');
                   $thisRow.css('background-color','#FAF1C9');

                  //---------toggle show
                  function hideMore(){
                       $subtable.find('tr:gt(0)').css('display','none');
                       $subtable.find('tr:first').css('background-color','#FAF1C9');
                       $thisRow.css('background-color','#FAF1C9');
                  }
                  var hidemore;
                  $thisRow.hover(function(){
                          clearTimeout(hidemore);
                           $subtable.find('tr:gt(0)').css('display','');
                           $subtable.find('tr:first').css('background-color','#EBEBEB');
                           $thisRow.css('background-color','#EBEBEB');

                  },function(){
                          hidemore = setTimeout(hideMore,2000);
                  });
              }


        });
}

    function showHideMoreRows1(showMsg,hideMsg){
     $('table.datalist > tbody > tr').each(function(i){
              var $thisRow = $(this);
              var $subtable = $(this).find('table.subtable');
              //-------default hidden
              if($subtable.find('tr').length > 1){
                   $subtable.find('tr:gt(0)').css('display','none');
                   $subtable.find('tr:first').css('background-color','#FAF1C9');
                   $thisRow.css('background-color','#FAF1C9');
                   $thisRow.attr('title',showMsg);
                  $thisRow.click(function(e){
                           if(!$(e.target).is(':checkbox') && !$(e.target).is('a') && !$(e.target).is('img')){
                               if($subtable.find('tr:gt(0)').css('display') == 'none'){
                                   $subtable.find('tr:gt(0)').css('display','');
                                   $subtable.find('tr:first').css('background-color','#EBEBEB');
                                   $thisRow.css('background-color','#EBEBEB');
                                   $thisRow.attr('title',hideMsg);
                               }else{
                                   $subtable.find('tr:gt(0)').css('display','none');
                                   $subtable.find('tr:first').css('background-color','#FAF1C9');
                                   $thisRow.css('background-color','#FAF1C9');
                                   $thisRow.attr('title',showMsg);
                               }

                           }
                  });
              }


        });
}