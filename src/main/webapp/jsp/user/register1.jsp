<%--
  Created by IntelliJ IDEA.
  User: 越
  Date: 2017/4/8
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
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

        .form-div .icon {
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
            width: 140px;
            padding-left: 10px;
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

        #getCode {
            width: 190px;
            height: 38px;
            margin-left: 15px;
            margin-right: 17px;
            border: none;
            color: #fff;
            background-color: #19bd9b;
            vertical-align: middle;
            cursor: pointer;
            font-size: 15px;
        }

    </style>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
    <script src="/jsp/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/jsp/css/sweetalert.css">
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
                <h3 class="txt">用户注册</h3>
            </div>
        </div>
    </div>
    <div class="body">
        <div class="right">
            已有账号？
            <a href="login.jsp">立即登录</a>
        </div>
        <div class="login">
            <form method="post" action="/user/register" <%--onsubmit="return validate_form(this)"--%>>
                <fieldset>
                    <div class="form-div">
                        <i class="icon userIcon"></i>
                        <input class="user-input" type="text" name="phoneNumber" id="phoneNumber"
                               placeholder="请输入您的常用手机号码"/>
                        <label id="userInfo" for="phoneNumber"></label>
                    </div>
                    <div class="form-div">
                        <i class="icon pswIcon"></i>
                        <input class="user-input" type="password" name="password" id="password" placeholder="请输入密码"/>
                        <label id="pswInfo" for="password"></label>
                    </div>
                    <div class="form-div codeDiv">
                        <input class="code-input" type="text" name="code" id="code" placeholder="获取短信验证码"/>
                        <input id="getCode" type="button" onclick="settime(this);sendMessage()" value="获取短信验证码"/>
                        <label id="codeInfo" for="code"></label>
                    </div>
                    <div class="remDiv">
                        <label>
                            <span class="remSpan">
                                <input id="rememberMe" name="rememberMe" checked="checked" type="checkbox">
                            </span>
                            我已阅读，并同意《注册协议》
                        </label>
                    </div>
                    <div class="btnDiv">
                        <input type="button" class="subBtn btn" value="立即注册" id="subBtn" onclick="register()">
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="footer">
    </div>
</div>
</body>
<script type="text/javascript">
    // 倒计时
    var countdown=60;
    function settime(obj) {
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value="获取短信验证码";
            countdown = 60;
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
                    settime(obj) }
                ,1000)
    }
    // 获取短信验证码
    function sendMessage() {
        var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
        /*
         * 创建XMLHttpRequest对象
         * 所有现代浏览器（IE7+、Firefox、Chrome、Safari 以及 Opera）均内建 XMLHttpRequest 对象
         * 老版本的 Internet Explorer （IE5 和 IE6）使用 ActiveX 对象
         */
        var xmlHttp;
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        // 设置异步
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                // input=document.getElementsByName("code");
                // input[0].value="haha";
                // document.getElementById("code").value = "xixi";
            }
        }
        // 向服务器发送请求：
        xmlHttp.open("GET", "/user/sendMessageCode?phoneNumber=" + phoneNumber, true);
        xmlHttp.send();
        /*
         * GET方式传参：
         * xmlHttp.open("GET","/jsp/ajaxTest.jsp?author=ayue&gender=man",true);
         * xmlHttp.send();
         *
         * POST方式传参：
         * xmlhttp.open("POST","ajaxTest.jsp.jsp",true);
         * xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         * xmlhttp.send("author=ayue&gender=man");
         */
    }
    // 登录名提醒
    $("#phoneNumber").click(function () {
        $("#phoneNumber").css("border-color", "lightskyblue");
        if ($("#userInfo").hasClass("error"))
            $("#userInfo").removeClass("error");
        $("#userInfo").addClass("notice");
        $("#userInfo").html("请输入您的常用手机号");
    })
    $("#phoneNumber").blur(function () {
        if ($("#phoneNumber").val() == null || $("#phoneNumber").val() == "") {
            if ($("#userInfo").hasClass("error"))
                $("#userInfo").removeClass("error");
            $("#phoneNumber").css("border-color", "#faf5fa");
            $("#userInfo").html("");
        } else {
            if (checkPhoneNum($("#phoneNumber").val())) {
                if ($("#userInfo").hasClass("notice"))
                    $("#userInfo").removeClass("notice");
                $("#userInfo").addClass("error");
                $("#userInfo").html("该手机号已存在");
                $("#phoneNumber").css("border-color", "orange");
            } else {
                if ($("#userInfo").hasClass("error"))
                    $("#userInfo").removeClass("error");
                $("#phoneNumber").css("border-color", "#faf5fa");
                $("#userInfo").html("");
            }
        }
    })
    // 手机号码是否存在校验
    function checkPhoneNum(phoneNumber) {
        var result = 0;
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/checkPhoneNumber",
            data: "phoneNumber=" + phoneNumber,
            async: false,
            dataType: "TEXT",
            success: function (data) {
                if (data == "success")
                    result = 1;// true
            }
        });
        return result;
    }
    // 密码校验
    $("#password").click(function () {
        $("#password").css("border-color", "lightskyblue");
        if ($("#pswInfo").hasClass("error"))
            $("#pswInfo").removeClass("error");
        $("#pswInfo").addClass("notice");
        $("#pswInfo").html("请输入6~20位字符，建议使用字母，数字或符号的组合");
    })
    $("#password").blur(function () {
        if ($("#pswInfo").hasClass("error"))
            $("#pswInfo").removeClass("error");
        $("#password").css("border-color", "#faf5fa");
        $("#pswInfo").html("");
    })
    // 验证码校验
    $("#code").click(function () {
        if ($("#codeInfo").hasClass("error"))
            $("#codeInfo").removeClass("error");
        $("#codeInfo").html("");
        $("#code").css("border-color", "lightskyblue");
    })
    $("#code").blur(function () {
        if ($("#codeInfo").hasClass("error"))
            $("#codeInfo").removeClass("error");
        $("#codeInfo").html("");
        $("#code").css("border-color", "#faf5fa");
    })

    function register() {
        if (validate_form(this)){
            swal({
                title: "注册成功!",
                text:"请稍等...将在1秒后跳转到登录页面",
                timer: 2000,
                showConfirmButton: false,
                type: "success"
            });
            setTimeout(function () {
                $("form").submit();
            }, 3000);
        }
    }

    // 提交表单前的校验
    // <form method="post" action="/user/register" onsubmit="return validate_form(this)">
    function validate_form(thisform) {
        with (thisform) {
            // 是否为空
            if (validate_required(phoneNumber) == false) {
                phoneNumber.focus();
                return false
            }
            if (validate_required(password) == false) {
                password.focus();
                return false
            }
            if (validate_required(code) == false) {
                code.focus();
                return false
            }
            // ajax校验
            if (checkPhoneNum($("#phoneNumber").val())) {
                if ($("#userInfo").hasClass("notice"))
                    $("#userInfo").removeClass("notice");
                $("#userInfo").addClass("error");
                $("#userInfo").html("该手机号已存在");
                $("#phoneNumber").css("border-color", "orange");
                return false
            }
            if (!checkCode($("#code").val())) {
                code.focus();
                $("#codeInfo").addClass("error");
                $("#codeInfo").html("请输入正确验证码");
                $("#code").css("border-color", "orange");
                return false
            }
            return true;
        }
    }
    function validate_required(field) {
        with (field) {
            if (value == null || value == "") {
                if (field == phoneNumber) {
                    if ($("#userInfo").hasClass("notice"))
                        $("#userInfo").removeClass("notice");
                    $("#userInfo").addClass("error");
                    $("#userInfo").html("手机号不能为空");
                    $("#phoneNumber").css("border-color", "orange");
                }
                if (field == password) {
                    if ($("#pswInfo").hasClass("notice"))
                        $("#pswInfo").removeClass("notice");
                    $("#pswInfo").addClass("error");
                    $("#pswInfo").html("密码不能为空");
                    $("#psw").css("border-color", "orange");
                }
                if (field == code) {
                    $("#codeInfo").addClass("error");
                    $("#codeInfo").html("验证码不能为空");
                    $("#code").css("border-color", "orange");
                }
                return false
            }
            return true
        }
    }
    // 短信验证码校验
    function checkCode(code) {
        var result = 0;
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/checkMessageCode",
            data: "code=" + code,
            async: false,
            dataType: "TEXT",
            success: function (data) {
                if (data == "success")
                    result = 1;// true
            }
        });
        return result;
    }
</script>
</html>
