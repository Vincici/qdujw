/**
 * @author zhangjinlong
 */
function menu(id,curClass,subCurClass,showEffect){
	    var liId = "#" + id + " > li";
		var aId = "#" + id + " > li > a";
		var subaId = "#" + id + " > li > ul > li > a";
		var im = null,subim=null;
		if(showEffect != null && showEffect == "slide"){
		$(aId).each(
			function(i){
				$(this).click(
					function(){
						//alert($(subaId).size());
						$(subaId).each(function(){$(this).removeClass(subCurClass);});
						if(im!=null && im!=i) {
							if($(liId).eq(im).find("ul").size() != 0){
								$(liId).eq(im).find("ul").slideToggle("fast",function(){$(this).css("display") == "none" ? $(this).prev("a").removeClass(curClass):$(this).parent().addClass(curClass);});
							}else{
								$(liId).eq(im).find("a").removeClass(curClass);
							}
						}
						(im == i) ? im =null : im =i;
						//alert($(this).prev("a").attr("class"));
						if($(this).parent().find("ul").size() != 0){
							$(this).parent().find("ul").slideToggle("fast",function(){$(this).css("display") == "none" ? $(this).prev("a").removeClass(curClass):$(this).prev("a").addClass(curClass);});
						}else{
							str = $(this).attr("class");
							if(str == undefined) {
							$(this).addClass(curClass);}else{ $(this).prev("a").removeClass(curClass)}

						}
					}
				);
			}
		);
		}else{
		$(aId).each(
			function(i){
				$(this).click(
					function(){
						$(subaId).each(function(){$(this).removeClass(subCurClass);});
						if(im!=null && im!=i) {
							if($(liId).eq(im).find("ul").size() != 0){
								$(liId).eq(im).find("ul").toggle();
							}
							$(aId).eq(im).removeClass(curClass);
						}
						(im == i) ? im =null : im =i;
						if($(this).parent().find("ul").size() != 0){
							$(this).parent().find("ul").toggle();
							$(this).parent().find("ul").css("display") == "none" ? $(this).removeClass(curClass) : $(this).addClass(curClass);
						}else{
							str = $(this).attr("class");
							if(str == undefined) {
							$(this).addClass(curClass);}else{ $(this).prev("a").removeClass(curClass)}
						}
					}
				);
			}
		);
		}
		$(subaId).each(
			function(i){
				$(this).click(
					function(){
						if(subim != null || subim != i){$(subaId).eq(subim).removeClass(subCurClass);}
						subim = i;
						$(this).addClass(subCurClass);
					}
				);
			}
		);
	}

function myBrowser(){
var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera ; //判断是否IE浏览器
var isFF = userAgent.indexOf("Firefox") > -1 ; //判断是否Firefox浏览器
var isSafari = userAgent.indexOf("Safari") > -1 ; //判断是否Safari浏览器


if(isIE){
   var IE5 = IE55 = IE6 = IE7 = IE8 = false;
   var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
   reIE.test(userAgent);
   var fIEVersion = parseFloat(RegExp["$1"]);

   IE55 = fIEVersion == 5.5 ;
   IE6 = fIEVersion == 6.0 ;
   IE7 = fIEVersion == 7.0 ;
   IE8 = fIEVersion == 8.0 ;

   if(IE55){ return "IE55"; }
   if(IE6){ return "IE6"; }
   if(IE7){ return "IE7"; }
   if(IE8){ return "IE8"; }
}//isIE end

if(isFF){ return "FF"; }
if(isOpera){ return "Opera"; }

}//myBrowser() end








$(document).ready(function(){
	
		function ie6_menu(edge){//--------------for ie6 bug,increase the left menu's edge
			var Sys = {};
	        var ua = navigator.userAgent.toLowerCase();
	        if (window.ActiveXObject){// if IE
				Sys.ie = ua.match(/msie ([\d.]+)/)[1];
				if(Sys.ie === '6.0'){//if IE 6.0
					
					var _middleframeWrap = parent.document.getElementById("_middleframeWrap");
					var menuWidth = _middleframeWrap.cols.split(',');
					//alert(parseInt(menuWidth[0]) + 17);
					_middleframeWrap.cols = parseInt(menuWidth[0]) + edge + ",*";
				}
			}
		}
	
	ie6_menu(1);
	
	//---------------left sideBar
	$('.sidebar a').toggle(function(){//----------shrink the menu
		$('#wrap').css('display','none');
		$(this).addClass('back');
        $(this).css('left','0');
		var _middleframeWrap = parent.document.getElementById("_middleframeWrap");
		//alert(parent.document.getElementById("_middleframeWrap"));
		_middleframeWrap.cols = '8,*';
		
		ie6_menu(2);	
		
		$(this).attr('title','点击展开');//-------------change the title
	},function(){//-------expand the menu

		$('#wrap').css('display','');
		$(this).removeClass('back'); 
        $(this).css('left','171px');
		var _middleframeWrap = parent.document.getElementById("_middleframeWrap");
		_middleframeWrap.cols = '186,*';
		
		ie6_menu(2);
		
		$(this).attr('title','点击收缩');
	});
	

	//----------------top sideBar
	    $('#header').find('.topSidebar a').toggle(
        function(){//----------shrink the menu
		$('#logo').css('display','none');
		$('#greeting').css('display','none');
		$('#subMenu').css('display','none');
        $("#header").css('background-position','left -82px');
        $("#nav").css('top','2px');
        $("#header .header").css('background-position','left -82px');
        $(".nav_left").css('display','block');
        $(".nav_left").css('top','0');


		$(this).parent('div').addClass('topSidebar_back');
        $(".topSidebar_back").css('top','35px');
		parent.document.getElementById("frameWrap").rows = '46,*,26';
		$(this).attr('title','点击展开');



	},
       function(){//-------expand the menu
		$(this).attr('title','点击收缩');
		$('#logo').css('display','');
		$('#greeting').css('display','');
		$('#subMenu').css('display','');
        $("#header").css('background-position','left top');
        $("#header .header").css('background-position','right top');
        $(".topSidebar").css('top','117px');
        $("#nav").css('top','-44px');
        $(".nav_left").css('display','');

		$(this).parent('div').removeClass('topSidebar_back');
		parent.document.getElementById("frameWrap").rows = '128,*,26';

	});
	
});
