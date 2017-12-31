<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="/assets/css/mui.min.css" />
    <link rel="stylesheet" href="/assets/css/sweetalert.css">
    <script src="/assets/js/mui.min.js"></script>
    <script src="/assets/js/jQuery1.7.1.js"></script>
    <script type="text/javascript" charset="UTF-8">
        mui.init();
    </script>
</head>
<body>
<div class="mui-content">
    <div class="sweet-alert showSweetAlert visible" data-custom-class="" data-animation="pop" data-timer="null"
         style="display: block; margin-top: -176px;">
        <div class="sa-icon sa-success animate" style="display: block;">
            <span class="sa-line sa-tip animateSuccessTip"></span>
            <span class="sa-line sa-long animateSuccessLong"></span>
            <div class="sa-placeholder"></div>
            <div class="sa-fix"></div>
        </div>
        <h2>${msg}</h2>
        <p style="display: block;"><a href='javascript:history.go(-1)'>返回</a></p>
    </div>
</div>
</body>
</html>
