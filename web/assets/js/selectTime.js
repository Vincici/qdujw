//var str = "";
//document.writeln("<div id=\"_contents\" style=\"padding:6px; background-color:#E3E3E3; font-size: 12px; border: 1px solid #777777;  position:absolute; left:?px; top:?px; width:?px; height:?px; z-index:1; visibility:hidden\">");
//str += "<select name=\"_hour\">";
//for (h = 0; h <= 9; h++) {
//    str += "<option value=\"0" + h + "\">0" + h + "</option>";
//}
//for (h = 10; h <= 23; h++) {
//    str += "<option value=\"" + h + "\">" + h + "</option>";
//}
//str += "</select>&nbsp;:&nbsp;<select name=\"_minute\">";
//for (m = 0; m <= 9; m++) {
//    str += "<option value=\"0" + m + "\">0" + m + "</option>";
//}
//for (m = 10; m <= 59; m++) {
//    str += "<option value=\"" + m + "\">" + m + "</option>";
//}
//str += "</select>  ";
//
//str += "  <input name=\"queding\" type=\"button\" class=\"button\"    onclick=\"_select()\" value=\"\u786e\u5b9a\" style=\"font-size:12px\" /></div>";
//document.writeln(str);
//var _fieldname;
//
//function settime(tt) {
//    _fieldname = tt;
//    var ttop = tt.offsetTop;    //TT控件的定位点高
//    var thei = tt.clientHeight;    //TT控件本身的高
//    var tleft = tt.offsetLeft;    //TT控件的定位点宽
//    while (tt = tt.offsetParent) {
//        ttop += tt.offsetTop;
//        tleft += tt.offsetLeft;
//    }
//    document.getElementById('_contents').style.top = ttop + thei + 4;
//    document.getElementById('_contents').style.left = tleft;
//    document.getElementById('_contents').style.visibility = "visible";
//}
//function _select() {
//    _fieldname.value = document.getElementById('_hour').value + ":" + document.getElementById('_minute').value;
//    document.getElementById('_contents').style.visibility = "hidden";
//}




/*zhangjinlong*/
function setTime(cur){
      var panerTop = $(cur).offset().top;
      var panerLeft= $(cur).offset().left;
      panerTop = panerTop + 20;
      panerLeft = panerLeft + 10;
      var curv = cur.value;
      var cura = new Array();
      if(curv != ""){
        cura = curv.split(":");
      }else{
          cura[0] = "00";
          cura[1] = "00";
      }
           $('#timePanel').remove();
           $(document.body).append('<div id="timePanel" style="padding:6px; background-color:#E3E3E3; font-size: 12px; border: 1px solid #777;  position:absolute;z-index:100"></div>')
           $('#timePanel').append('<select class="hour"></select>&nbsp;:&nbsp;<select class="minute"></select>&nbsp;&nbsp;<input type="button" class="button" value="\u786e\u5b9a\" />')
           $('#timePanel').css({
              top:panerTop,
              left:panerLeft,
              opacity:'1',
              display:'none'
           });

           for (var i = 0; i <= 9; i++) {
                if(cura[0] == "0"+i){
                    $('#timePanel').children('.hour').append('<option value="0'+i+'" selected>0'+i+'</option>');
                }else{
                    $('#timePanel').children('.hour').append('<option value="0'+i+'">0'+i+'</option>');
                }
           }
           for(var j = 10; j<= 23; j++){
               if(cura[0] == j){
                $('#timePanel').children('.hour').append('<option value="'+j+'" selected>'+j+'</option>');
               }else{
                   $('#timePanel').children('.hour').append('<option value="'+j+'">'+j+'</option>');
               }
           }
           for(var m = 0; m<= 9; m++){
               if(cura[1] == "0"+m){
                $('#timePanel').children('.minute').append('<option value="0'+m+'" selected>0'+m+'</option>');
               }else{
                   $('#timePanel').children('.minute').append('<option value="0'+m+'">0'+m+'</option>');
               }
           }
           for(var n = 10; n<= 59; n++){
               if(cura[1] == n){
                $('#timePanel').children('.minute').append('<option value="'+n+'" selected>'+n+'</option>');
               }else{
                   $('#timePanel').children('.minute').append('<option value="'+n+'">'+n+'</option>');
               }
           }

//           $('#timePanel').slideDown('fast');
              $('#timePanel').css('display','block');

    //--------------hide timePanel
          $('#timePanel').find('.button').click(function(){
               var thisVal = $('#timePanel').find(':selected').eq(0).val() +':'+ $('#timePanel').find(':selected').eq(1).val();
//               alert(thisVal);
               $(cur).val(thisVal);
//               $('#timePanel').fadeOut('slow');
                  $('#timePanel').css('display','none');
          });

        $(document).click(function(e){
              if($(e.target).parents('#timePanel').length == 0 && !$(e.target).is('.input')){
//                    $('#timePanel').fadeOut('slow');
                       $('#timePanel').css('display','none');
              }
        });

}