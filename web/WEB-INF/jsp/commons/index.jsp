<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>综合教务管理系统</title>
    <link href="/assets/css/frame.css" rel="stylesheet" type="text/css">
</head>
<frameset rows="128,*,26" cols="*" id="frameWrap" frameborder="no" border="0" framespacing="0">
    <frame src="/top/${userName}/${token}" scrolling="no" noresize="noresize" name="headerFrame" id="headerFrame"/>
    <!-- src为空，由menuFrame的listLeft.do加载完成后指定showHeader.do -->
    <frameset cols="191,*" id="_middleframeWrap" name="_middleframeWrap" border="0" frameborder="0" framespacing="0">
        <frame src="/sidelist/${userName}/${token}" name="menuFrame" noresize="noresize" id="menuFrame" frameborder="0" scrolling="no"/>
        <frame src="/loading" id="mainFrame" name="mainFrame" frameborder="0" noresize="noresize"
               scrolling="auto"/>
    </frameset>
    <frame src="/footer" scrolling="no" noresize="noresize" id="footerFrame"/>
</frameset>
<noframes>
    <body>
    此浏览器不支持框架，页面无法显示！
    </body>
</noframes>
</html>