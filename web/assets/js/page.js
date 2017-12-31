//-------form focus-----------
function suckerfish(type, tag, parentId) {
 if (window.attachEvent) {
  window.attachEvent("onload", function() {
   var sfEl = (parentId == null) ? document.getElementsByTagName(tag) : document.getElementById(parentId).getElementsByTagName(tag);
   var sfEls = new Array();
   var j = 0;
   for(var i = 0; i<sfEl.length; i++){
	if((sfEl[i].type == "text" && sfEl[i].title == "")|| sfEl[i].type == "password" || sfEl[i].tagName == "TEXTAREA") sfEls[j++] = sfEl[i];
   }
   type(sfEls);
  });
 }
}

sfFocus = function(sfEls) {
 for (var i=0; i < sfEls.length; i++) {
  sfEls[i].onfocus = function() {
   this.className += " sffocus" ;
  }
  sfEls[i].onblur = function() {
   this.className = this.className.replace(new RegExp("sffocus\\b"), "");
  }
 }
}
//suckerfish(sfFocus, "input");
//suckerfish(sfFocus, "textarea");

//----------end-----------------


//-------------datalistTRObj---------------
	window.onload = function(){
        var __tableObj = document.getElementsByTagName("table");
		var __tableArray = new Array();
		var __j=0;
		for(var i=0;i<__tableObj.length;i++){
			if(__tableObj[i].className == "datalist" || __tableObj[i].className == "datalistc") __tableArray[__j++] = __tableObj[i];
		}
		var __trObj;
		for(var i =0;i<__tableArray.length;i++){
			__trObj = __tableArray[i].getElementsByTagName("tr");
			for(var j = 0;j<__trObj.length; j++){
					__trObj[j].onclick = function(){if(this.className == "click") { this.className = ""; this.setAttribute("state","");} else {this.className = "click"; this.setAttribute("state","pitchon");}}
                    __trObj[j].onmouseover = function(){ if(this.getAttribute("state") != "pitchon") this.className = "over"; }
                    __trObj[j].onmouseout = function(){  if(this.getAttribute("state") != "pitchon") this.className = ""; }
            }
		}
	}
//-------------end------------------------------