<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>发帖</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            color: #5d5d5d;
            height: 100%;
            font-family: Arial, Hiragino Sans GB, Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
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

        .header .login ul {
            display: none;
            position: absolute;
            overflow: hidden;
            right: 220px;
            min-width: 90px;
            height: auto;
            background-color: #fff;
            border: 1px solid #ececec;
            list-style: none;

        }

        .header .login ul li {
            display: block;
        }

        .header .login ul li a {
            color: #434343;
        }

        .header .login ul li a:hover {
            color: #F7B824;
        }

        .header .login ul a {
            display: block;
            height: 32px;
            line-height: 32px;
            text-align: center;
        }

        .header .login a.userImage {
            display: inline-block;
            vertical-align: top;
            width: 40px;
            height: 40px;
            position: relative;
            z-index: 9;
            border-radius: 20px;
            border-radius: 50%;
            line-height: 40px;
            text-align: center;
            background-color: #ecf7ff;
            color: #338fe4;
            text-decoration: none;
            font-size: 12px;
        }

        .header .login a img {
            display: block;
            width: 40px;
            height: 40px;
            border-radius: 20px;
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

        .header .left .links {
            display: inline-block;
            padding-top: 30px;
            line-height: 20px;
        }

        .header .left .links a {
            font-size: 30px;
            color: #d8efff;
            text-decoration: none;
            font-style: italic;
        }

        .header .left .links a .logo {
            float: left;
            width: 50px;
            margin-right: 10px;
            font-size: 0;
            margin-top: -15px;
        }

        .header .left .links a .logo img {
            width: 100%;
            border-radius: 50%;
            border: 1px solid #338fe4;
        }

        .header .login a img {
            display: block;
            width: 46px;
            height: 46px;
            border-radius: 50%;
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
            margin-left: 10px;
        }

        .header .login a:hover {
            color: #fda136;
        }

        .header .login a .iconImg {
            display: inline;
            width: 28px;
            height: 28px;
            margin-left: 10px;
            padding-right: 5px;
            margin-top: -6px;
        }

        .body {
            background: #fff;
            box-shadow: 0 1px 2px #ebebeb;
            width: 1040px;
            margin: 30px auto;
        }

        .body .pubBox {
            width: 862px;
            margin: 0 auto;
            padding-top: 1px;
        }

        .body .pubBox .pub {
            margin: 40px 0 45px 0;
            box-sizing: border-box;
        }

        input, textarea {
            outline: 0;
        }

        .body .title {
            border: none;
            font-size: 32px;
            width: 100%;
            padding: 22px 10px;
            border-bottom: 1px solid #eee;
            box-sizing: border-box;
        }

        .body .btn {
            height: 76px;
            padding: 22px 0 0 0;
            box-sizing: border-box;
            border-bottom: 1px solid #EDEDED;
        }

        .body .btn .myBtn {
            width: 106px;
            float: right;
        }

        .footer {
            width: 100%;
            position: absolute;
            bottom: 0;
            height: 28px;
            background-color: #338fe4;
        }

    </style>
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <script src="/jsp/layui/layui.js" charset="utf-8"></script>
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
            <div class="right">
                <div class="login">
                    <c:if test="${sessionScope.user != null}">
                        <a href="/jsp/user/center.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                            <img src="/jsp/<c:out value="${sessionScope.user['img']}"/>">
                        </a>
                    </c:if>
                    <div class="text">
                        <c:if test="${sessionScope.user != null}">
                            <a href="/jsp/user/center.jsp" target="_blank">
                                <c:out value="${sessionScope.user['username']}"/>
                            </a>
                            <a href="/jsp/user/center.jsp" target="_blank">
                                <img src="/jsp/img/icon/shezhi.png" class="iconImg">
                                设置
                            </a>
                            <a href="/user/logout">
                                <img src="/jsp/img/icon/end.png" class="iconImg">
                                退了
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            <%--<a href="/jsp/user/login.jsp" class="bt">登录</a>--%>
                            <img src="/jsp/img/icon/login.png" class="iconImg"
                                 style="width: 46px;height: 46px;margin-top: -5px;">
                            <a href="/jsp/user/login.jsp" style="margin-left: 20px">
                                登录
                            </a>
                            <a href="/jsp/user/register1.jsp" style="margin-left: 20px">
                                注册
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="body">
        <div class="pubBox">
            <form method="post" action="/post/sendPost">
                <div class="pub">
                    <input class="title" type="text" name="title" placeholder="请输入标题">
                </div>
                <div class="editor">
            <textarea cols="80" id="editor" name="content">
		        </textarea>
                    <div class="btn">
                        <a>
                            <button onclick="cancel();return false;" class="layui-btn myBtn"
                                    style="background-color: darkgrey;">取消
                            </button>

                        </a>
                        <a>
                            <button type="button" class="layui-btn layui-btn-normal myBtn" style="margin-right: 12px;"
                                    onclick="send()">
                                发布
                            </button>
                        </a>
                    </div>

                </div>
            </form>
        </div>
    </div>
    <div class="footer">
    </div>
</div>
</body>
<script src="https://cdn.ckeditor.com/4.6.1/standard-all/ckeditor.js"></script>
<script type="text/javascript">
    CKEDITOR.replace('editor', {
        filebrowserImageUploadUrl: '/post/imageUpload',
        image_previewText: ' ',
        height: "500",
        toolbar: [
            {name: 'clipboard', items: ['Undo', 'Redo']},
            {name: 'styles', items: ['Styles', 'Format']},
            {name: 'basicstyles', items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']},
            {name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']},
            {name: 'links', items: ['Link', 'Unlink']},
            {name: 'insert', items: ['Image', 'EmbedSemantic', 'Table']},
            {name: 'tools', items: ['Maximize']},
            {name: 'editing', items: ['Scayt']}
        ],
        customConfig: '',
        bodyClass: 'article-editor',
        format_tags: 'p;h1;h2;h3;pre',
        removeDialogTabs: 'image:advanced;link:advanced',
    });
    var cancel = function () {
        window.location.href = "/";
    }

    function send() {
        swal({
            title: "发布成功!",
            timer: 1800,
            showConfirmButton: false,
            type: "success"
        });
        setTimeout(function () {
            $("form").submit();
        }, 2000);
    }

</script>
</html>
