
function delCol(tId){
    var o = $("#"+ tId + " tr");
    var to = o.eq(0);
    var trSize = o.size();
    var tdEmpty = true;
    for(var i = 0, j = $(to).find("th").size(); i < j ; i++){
        for(var x = 1; x < trSize ; x++){
            if($.trim(o.eq(x).find("td").eq(i).html()) == "" || o.eq(x).find("td").eq(i).html() == "&nbsp;"){
                tdEmpty = false;
            }else{
                tdEmpty = true;
                break;
            }
        }
        if(!tdEmpty){
            o.each(
                function(z){
                    if(z == 0)
                        $(this).find("th").eq(i).hide();
                    else
                        $(this).find("td").eq(i).hide();
                }
            )
        }
    }
}
