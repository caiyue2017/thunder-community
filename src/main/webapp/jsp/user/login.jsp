<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <script src="/jsp/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/jsp/css/sweetalert.css">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            color: #5d5d5d;
            height: 100%;
        }

        h1, h2, h3, h4, h5, h6 {
            font-weight: 400;
        }

        a {
            text-decoration: none;
            cursor: pointer;
        }

        .main {
            min-height: 100%;
            _height: 100%;
            min-width: 1180px;
            position: relative;
            background: #ebeef3;
        }

        .header {
            height: 28px;
            background-color: #338fe4;
        }

        .footer {
            width: 100%;
            position: absolute;
            bottom: 0;
            height: 28px;
            background-color: #338fe4;
        }

        .header .layout {
            max-width: 1280px;
            margin: 0 auto;
        }

        .header .left {
            float: left;
            margin-left: 49.5px;
        }

        .header .left .links {
            display: inline-block;
            padding-top: 3px;
            vertical-align: top;
            line-height: 20px;
        }

        .header .left .links a {
            font-size: 14px;
            color: #d8efff;
            text-decoration: none;
            font-style: italic;
        }

        .header .left .links a .logo {
            float: left;
            width: 30px;
            margin-right: 5px;
            font-size: 0;
            margin-top: -15px;
        }

        .header .left .links a .logo img {
            width: 100%;
            border-radius: 50%;
            border: 1px solid #338fe4;
            padding-top: 8.3px;
        }

        .top {
            height: 60px;
            background: #fff;
            border-bottom: 1px solid #dbe0e9;
        }

        .top .topInfo {
            width: 1180px;
            margin: 0 auto;
        }

        .top .textArea {
            zoom: 1;
        }

        .top .txt {
            float: left;
            height: 60px;
            font-size: 18px;
            line-height: 60px;
        }

        .body {
            /*margin-bottom: 20px;*/
            /*margin-top: 20px;*/
            background: #fff;
            box-shadow: 0 1px 2px #ebebeb;
            width: 1180px;
            margin: 0 auto;
        }

        .body .right {
            font-size: 18px;
            margin-top: 25px;
            margin-right: 30px;
            float: right;
        }

        .body .right a {
            color: #ff6c00;
        }

        .body .login {
            margin-left: 130px;
            padding: 80px 0 45px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        form {
            list-style: none;
            font-size: 14px;
            line-height: 1.5;
            display: block;
        }

        fieldset, img {
            border: 0;
        }

        .form-div {
            position: relative;
            padding: 0 5px 20px 0px;
            zoom: 1;
        }

        .icon {
            position: absolute;
            top: 8px;
            left: 11px;
            width: 32px;
            height: 32px;

        }

        .userIcon {
            background-image: url(../img/userLogin2.png);
        }

        .pswIcon {
            background-image: url(../img/pswLogin.png);
        }

        input {
            background: #f3f5fa;
            border: 1px solid #faf5fa;
            font-size: 15px;
            height: 50px;
            outline: none;
        }

        .user-input {
            width: 350px;
            padding: 10px 10px 10px 55px;
        }

        .code-input {
            width: 120px;
            padding-left: 10px;
        }

        .code {
            margin-left: 10px;
            vertical-align: middle;
            width: 100px;
            height: 42px;
        }

        .refreshCode {
            margin-left: 14px;
            cursor: pointer;
            text-decoration: none;
            color: #ababab;
        }

        .error {
            color: #ff6c00;
            padding: 8px 0 1px 25px;
            background: url(../img/error.png) left 80% no-repeat;
            margin-left: 18px;
        }

        .correct {
            padding: 8px 0 1px 25px;
            background: url(../img/right.png) left 80% no-repeat;
            margin-left: 18px;
        }

        .notice {
            color: darkgray;
            margin-left: 18px;
        }

        .codeDiv {
            height: 35px;
        }

        .remDiv {
            padding-bottom: 16px;
            height: 35px;
        }

        .remDiv span input {
            width: 16px;
            margin-bottom: 1px;
        }

        label, label input {
            vertical-align: middle;
        }

        .remSpan {
            cursor: pointer;
            position: static;
            padding-right: 2px;
            width: 16px;
            height: 16px;
        }

        .btnDiv {
            padding-bottom: 16px;
        }

        .btnDiv .subBtn {
            width: 350px;
            height: 38px;
            font-size: 16px;
            border: none;
            color: #fff;
            background-color: #ed7c5e;
        }

        .btn {
            text-align: center;
            cursor: pointer;
            vertical-align: middle;
        }

    </style>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="main">
    <div class="header">
        <div class="layout">
            <div class="left">
                <div class="links">
                    <a href="/">
                        <div class="logo">
                            <img src="/jsp/img/lt2.jpg">
                        </div>
                        Thunder社区
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="top">
        <div class="topInfo">
            <div class="textArea">
                <h3 class="txt">用户登录</h3>
            </div>
        </div>
    </div>
    <div class="body">
        <div class="right">
            没有账号？
            <a href="register1.jsp">立即注册</a>
        </div>
        <div class="login">
            <form method="post" action="/user/login" onsubmit="return validate_form(this)">
                <fieldset>
                    <div class="form-div">
                        <i class="icon userIcon"></i>
                        <input class="user-input" type="text" name="name" id="name" placeholder="用户名/邮箱/手机号"/>
                        <label id="userInfo" for="name"></label>
                    </div>
                    <div class="form-div">
                        <i class="icon pswIcon"></i>
                        <input class="user-input" type="password" name="psw" id="psw" placeholder="请输入密码"/>
                        <label id="pswInfo" for="psw"></label>
                    </div>
                    <div class="form-div codeDiv">
                        <input class="code-input" type="text" name="code" id="code" placeholder="验证码"/>
                        <a onclick="refresh()">
                            <img class="code" src="${pageContext.request.contextPath}/user/sendCode?" id="codeImage">
                        </a>
                        <a class="refreshCode" onclick="refresh()">
                            看不清，换一张
                        </a>
                        <label id="codeInfo" for="code"></label>
                    </div>
                    <div class="remDiv">
                        <label>
                            <span class="remSpan">
                                <input id="remember_me" name="rememberMe" checked="checked" type="checkbox">
                            </span>
                            <label for="remember_me">记住我</label>
                            <a style="margin-left: 219px;;color: #316fb1;" href="#">忘记密码？</a>
                        </label>
                    </div>
                    <div class="btnDiv">
                        <input type="submit" class="subBtn btn" value="立即登录" id="subBtn">
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="footer">
    </div>
    <c:if test="${sessionScope.userIsLock != null}">
        <script type="text/javascript">
            sweetAlert("账号被锁定！", "详情请联系管理员", "error");
        </script>
    </c:if>
</div>
</body>
<script type="text/javascript">

    // 刷新图片
    var refresh = function () {
        $("#codeImage").attr("src", $("#codeImage").attr("src").toString().split("?")[0] + "?time=" + new Date().getMilliseconds());
    };
    // 登录名提醒
    $("#name").click(function () {
        $("#name").css("border-color", "lightskyblue");
        if ($("#userInfo").hasClass("error"))
            $("#userInfo").removeClass("error");
        $("#userInfo").addClass("notice");
        $("#userInfo").html("请输入用户名，邮箱或手机号码登录");
    })
    $("#name").blur(function () {
        $("#userInfo").html("");
    })
    // 登录名校验
    $("#name").blur(function () {
        if ($("#name").val() == null || $("#name").val() == "") {
            if ($("#userInfo").hasClass("notice"))
                $("#userInfo").removeClass("notice");
            $("#userInfo").addClass("error");
            $("#userInfo").html("用户名不能为空");
            $("#name").css("border-color", "orange");
            return false;
        } else {
            if ($("#userInfo").hasClass("error"))
                $("#userInfo").removeClass("error");
            $("#userInfo").html("");
        }
    })
    // 密码校验
    $("#psw").click(function () {
        $("#psw").css("border-color", "lightskyblue");
    })
    $("#psw").blur(function () {
        if ($("#psw").val() == null || $("#psw").val() == "") {
            $("#pswInfo").addClass("error");
            $("#pswInfo").html("密码不能为空");
            $("#psw").css("border-color", "orange");
            return false;
        } else {
            if ($("#pswInfo").hasClass("error"))
                $("#pswInfo").removeClass("error");
            $("#pswInfo").html("");
            return true;
        }
    })
    // 验证码校验
    $("#code").click(function () {
        $("#code").css("border-color", "lightskyblue");
    })
    $("#code").blur(function () {
        if (!checkCode($("#code").val())) {
            $("#codeInfo").addClass("error");
            $("#codeInfo").html("请输入正确验证码");
            $("#code").css("border-color", "orange");
        } else {
            if ($("#codeInfo").hasClass("error"))
                $("#codeInfo").removeClass("error");
            $("#codeInfo").addClass("correct");
            $("#codeInfo").html("");
            $("#code").css("border-color", "#faf5fa");
        }
    })
    function checkCode(code) {
        var result;
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/checkCode",
            data: "code=" + code,
            async: false,
            success: function (data) {
                if (data.toUpperCase() != code.toUpperCase())
                    result = 0;// false
                else
                    result = 1;// true
            }
        });
        return result;
    }


    function checkNameAndPsw(name, psw) {
        var result;
        var checked = null;
        if($("#remember_me").is(":checked")){//选中
            checked = "checked";
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/checkNameAndPsw",
            data: "name=" + name + "&psw=" + psw + "&checked=" + checked ,
            async: false,
            success: function (data) {
                result = data;
            }
        });
        return result;
    }
    // 提交表单前的校验
    // <form method="post" action="/user/login" onsubmit="return validate_form(this)">
    function validate_form(thisform) {
        with (thisform) {
            // 是否为空
            if (validate_required(name) == false) {
                name.focus();
                return false
            }
            if (validate_required(psw) == false) {
                psw.focus();
                return false
            }
            if (validate_required(code) == false) {
                code.focus();
                return false
            }
            // ajax校验
            if (!checkCode($("#code").val())) {
                code.focus();
                $("#codeInfo").addClass("error");
                $("#codeInfo").html("请输入正确验证码");
                $("#code").css("border-color", "orange");
                return false
            }
            if (checkNameAndPsw($("#name").val(), $("#psw").val()) == 0) {
                name.focus();
                if ($("#userInfo").hasClass("notice"))
                    $("#userInfo").removeClass("notice");
                $("#userInfo").addClass("error");
                $("#userInfo").html("用户名或密码错误");
                $("#name").css("border-color", "orange");
                return false
            }
        }
    }
    function validate_required(field) {
        with (field) {
            if (value == null || value == "") {
                if (field == name) {
                    if ($("#userInfo").hasClass("notice"))
                        $("#userInfo").removeClass("notice");
                    $("#userInfo").addClass("error");
                    $("#userInfo").html("用户名不能为空");
                    $("#name").css("border-color", "orange");
                }
                if (field == psw) {
                    $("#pswInfo").addClass("error");
                    $("#pswInfo").html("密码不能为空");
                    $("#psw").css("border-color", "orange");
                }
                if (field == code) {
                    $("#codeInfo").addClass("error");
                    $("#codeInfo").html("请输入正确验证码");
                    $("#code").css("border-color", "orange");
                }
                return false
            }
            return true
        }
    }
</script>
</html>
