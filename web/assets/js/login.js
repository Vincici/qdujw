$("#btn_login").click(function () {
    $.ajax({
        url: "/login",
        type: "post",
        data: {
            userName: $("#j_username").val(),
            password: $("#j_password").val()
        },
        async: true,
        success: function (data) {
            if (data.msg = "LOGIN SUCCESS") {
                window.location.href = "/index/" + data.userName + "/" + data.token;
            }
        },
        error: function (data) {
            $("#error").text("用户名密码错误")
        }
    });
});