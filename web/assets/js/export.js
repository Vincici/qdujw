function outputMsOffice(name, type) {
    if(!!window.ActiveXObject || "ActiveXObject" in window){
        var wordText = "";
        var fSaveWindow = window.open();
        $(".output_ctx").each(function () {
            var elem = $(this);
            if (elem.is("table")) {
                elem.find(".no_output").remove();
                wordText += "<table width='100%' cellpadding='0' cellpadding='0' border='1' style='text-decoration:none;font:black;font-size:12px;padding:0px;margin:0px;border-collapse: collapse;'>" + elem.html() + "</table><br>";
            } else if (elem.is("div")) {
                wordText += "<center><span style='font-size:12px;font-weight: bold;'" + elem.html() + "</span></center>";
            }

        });
        fSaveWindow.document.write(wordText);
        fSaveWindow.document.execCommand("SaveAs", true, name+"."+type);
        fSaveWindow.close();
    }else{
        alert("\u8bf7\u4f7f\u7528\u9ad8\u7248\u672cIE\u6d4f\u89c8\u5668\u6765\u8f93\u51fa\u672c\u62a5\u8868\u3002");
    }
}

function outputWord(name){
    outputMsOffice(name, "doc");
}

function outputExcel(name){
    outputMsOffice(name, "xls");
}