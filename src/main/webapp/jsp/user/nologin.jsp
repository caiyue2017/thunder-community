<%--
  Created by IntelliJ IDEA.
  User: 越
  Date: 2017/4/23
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示信息</title>
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
            min-width: 1040px;
            position: relative;
            background: #ebeef3;
            height: 1000px;
        }

        .header {
            height: 80px;
            background-color: #338fe4;
        }

        .header .layout {
            max-width: 1280px;
            margin: 0 auto;
        }

        .header .left {
            float: left;
        }

        .header .left .links {
            display: inline-block;
            padding-top: 25px;
            vertical-align: top;
            line-height: 20px;
        }

        .header .left .links a {
            font-size: 30px;
            color: #d8efff;
            text-decoration: none;
        }

        .header .right {
            float: right;
        }

        .header .login {
            padding-top: 21px;
        }

        .header .login .text {
            display: inline-block;
            line-height: 40px;
            font-size: 14px;
            margin-left: 10px;
        }

        .header .login a {
            color: #d8efff;
            text-decoration: none;
        }

        .header .login a.bt {
            display: inline-block;
            width: 40px;
            border-radius: 50%;
            line-height: 40px;
            text-align: center;
            background-color: #ecf7ff;
            color: #338fe4;
            text-decoration: none;
            font-size: 12px;
        }

        .header .login span {
            color: #81b9ed;
            margin-top: 8px;
        }

        .wp {
            margin: 0 auto;
            width: 960px;
        }

        #wp .wp {
            width: auto;
        }

        #ct {
            min-height: 300px;
        }

        .cl {
            zoom: 1;
        }

        .nfl {
            height: auto !important;
            min-height: 320px;
        }

        .nfl .f_c {
            margin: 60px auto;
            padding: 20px;
            width: 580px;
            border: 3px solid #F2F2F2;
            background: #FFF;
        }

        .alert_info {
            padding: 6px 0 6px 58px;
            min-height: 40px;
            height: auto !important;
            height: 40px;
            line-height: 160%;
            background: url(http://bbs.iqianjin.com/static/image/common/info.gif)  no-repeat 8px 8px;
            font-size: 14px;
        }

        #messagelogin {
            margin-top: 5px;
            border-top: 1px solid #CDCDCD;
        }

    </style>
</head>
<body>
<div class="main">
    <div class="header">
        <div class="layout">
            <div class="left">
                <div class="links">
                    <a href="/">阿越体育论坛</a>
                </div>
            </div>
            <div class="right">
                <div class="login">
                    <div class="text">
                        <a href="/jsp/user/login.jsp" target="_blank" class="bt">登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="wp" class="wp">
        <div id="ct" class="wp cl w">
            <div class="nfl" id="main_message">
                <div class="f_c altw">
                    <div id="messagetext" class="alert_info">
                        <p>抱歉，请先登录！
                            <meta http-equiv="Refresh" content="2; url=http://localhost/jsp/user/login.jsp">
                        </p>
                    </div>
                    <div id="messagelogin"><span><img src="http://bbs.iqianjin.com/static/image/common/loading.gif" class="vm"> 请稍候...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
