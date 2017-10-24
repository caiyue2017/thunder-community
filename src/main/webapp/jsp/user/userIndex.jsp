<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>个人主页</title>
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <script src="/jsp/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
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

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Hiragino Sans GB, Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
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

        .container {
            width: 1240px;
            margin: 30px auto 0;
            padding: 0;
        }

        .user-header {
            background-image: url(../img/userBackground.png);
            background-position: 0 0;
            background-repeat: no-repeat;
        }

        .user-header .main {
            display: block;
            position: relative;
            height: 276px;
            border: 1px solid #e2f4ff;
        }

        .user-header .main .visit {
            display: block;
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 0 10px;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            color: #777;
            background-color: rgba(39, 133, 219, .1);
            text-decoration: none;
            transition: all .2s ease-out;
        }

        .user-header .main .avater {
            margin-top: 20px;
            font-size: 0;
            text-align: center;
        }

        .avater img {
            display: inline-block;
            height: 110px;
            width: 110px;
            border-radius: 55px;
            vertical-align: top;
            border: 1px solid #d9d9d9;
        }

        .user-header .main .name {
            margin-top: 15px;
            text-align: center;
            font-size: 16px;
            font-weight: 700;
            line-height: 20px;
            color: #5c5c5c;
        }

        .user-header .main .desc {
            margin-top: 15px;
            text-align: center;
            font-size: 16px;
            line-height: 20px;
            color: #434343;
        }

        .subview {
            width: 1240px;
            margin: 0 auto 30px;
        }

        .subview .user-home .container {
            position: relative;
            margin-top: 20px;
            padding-right: 290px;
        }

        .subview .user-home .container .main {
            min-height: 800px;
            padding: 25px 20px;
        }

        ul {
            list-style: none;
        }

        .main .select-type {
            font-size: 0;
        }

        ul.select-type li {
            display: inline-block;
            height: 18px;
            margin: 7px 0;
        }

        ul.select-type li a {
            display: inline-block;
            height: 32px;
            line-height: 32px;
            margin-top: -7px;
            margin-left: 5px;
            margin-right: 5px;
            padding: 0 20px;
            font-size: 16px;
            text-decoration: none;
            color: #333;
        }

        #sendPostNum, #reviewPostNum {
            color: #696969;
            line-height: 32px;
            font-size: 16px;
        }

        ul.select-type li a.active {
            background-color: #f5f5f5;
            color: #f38400;
        }

        .main .timeline {
            margin-top: 20px;
        }

        .main .timeline ul {
            list-style: none;
        }

        .main .timeline li {
            padding-left: 80px;
            padding-top: 20px;
            padding-bottom: 20px;
            min-height: 60px;
            border-bottom: 1px solid #ededed;
        }

        .main .timeline li .avatar {
            display: block;
            float: left;
            margin-left: -80px;
            margin-top: 15px;
        }

        .main .timeline li .post {
            display: block;
            position: relative;
            width: 100%;
            font-size: 16px;
            line-height: 32px;
            color: #434343;
        }

        .main .timeline li img {
            width: 60px;
            height: 60px;
            border-radius: 30px;
            vertical-align: top;
            border: 1px solid #d9d9d9;
        }

        .main .post .title {
            padding-right: 80px;
        }

        .main .post .title .light {
            color: #9e9e9e;
        }

        .main .post .title a {
            color: #434343;
            text-decoration: none;
        }

        .main .post .summary {
            color: #5b5b5b;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .main .post .info {
            color: #9e9e9e;
            font-weight: 100;
            font-size: 14px;
        }

        .main .post .sq-link {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            line-height: 32px;
            color: #9e9e9e;
            font-size: 14px;
            text-decoration: none;
        }

        .main .base {
            padding: 30px 40px;
            line-height: 50px;
            font-size: 16px;
        }

        .main .base h3.title {
            display: inline-block;
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
        }

        .main .base .top a {
            display: inline-block;
            margin-left: 30px;
            color: #f38400;
            text-decoration: none;
        }

        .main .avatar {
            display: inline-block;
            width: 60px;
            height: 60px;
            border-radius: 100%;
            border: 1px solid #d9d9d9;
            vertical-align: middle;
        }

        .site-demo-upbar {
            position: absolute;
            left: 17%;
            top: 17.8%;
            margin: -18px 0 0 -56px;
        }

        .site-demo-upload .layui-upload-button {
            background-color: rgba(0, 0, 0, .2);
            color: rgba(255, 255, 255, 1);
        }

        a {
            cursor: pointer;
        }

        /*------------- 收藏 begin ------------------*/
        .userStore .post-list li {
            display: block;
            padding: 0 30px;
        }

        .userStore .post-list li .inner {
            position: relative;
            padding-bottom: 20px;
            border-bottom: 1px solid #f0f0f0;
        }

        .userStore .post-list li .inner .avatar {
            display: inline-block;
            vertical-align: top;
            margin-top: 20px;
        }

        .userStore .post-list li .inner .avatar a {
            display: block;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 1px solid #eee;
        }

        .userStore .post-list li .inner .avatar a img {
            width: 100%;
            border-radius: 50%;
            vertical-align: top;
        }

        .userStore .post-list li .inner .post {
            display: inline-block;
            vertical-align: top;
            margin-left: 20px;
        }

        .userStore .post-list li .inner .post .title {
            display: block;
            height: 50px;
            line-height: 50px;
            margin-top: 10px;
            font-size: 18px;
            color: #434343;
            text-decoration: none;
        }

        .userStore .post-list li .inner .post .info {
            display: block;
            line-height: 1;
            font-size: 14px;
        }

        .userStore .post-list li .inner .post .info .author {
            display: inline-block;
            color: #5c5c5c;
            text-decoration: none;
        }

        .userStore .post-list li .inner .post .info .time {
            display: inline-block;
            margin-left: 25px;
            color: #9e9e9e;
        }

        .userStore .post-list li .inner a.unmark {
            display: block;
            position: absolute;
            right: 170px;
            top: 40px;
            font-size: 14px;
            text-decoration: none;
            color: #434343;
            opacity: 0;
            transition: opacity .2s;
        }

        .userStore .post-list li .inner a.sq-link {
            display: block;
            position: absolute;
            right: 0;
            top: 14px;
            text-decoration: none;
        }

        .userStore .post-list li .inner a.sq-link .logo {
            font-size: 0;
            text-align: right;
        }

        .userStore .post-list li .inner a.sq-link .logo img {
            width: 38px;
            height: 38px;
            border: 1px solid #d9d9d9;
            border-radius: 20px;
            vertical-align: top;
        }

        .userStore .post-list li .inner a.sq-link span {
            display: block;
            min-width: 40px;
            font-size: 14px;
            color: #5c5c5c;
            line-height: 1;
            text-align: center;
            margin-top: 8px;
        }

        /*------------- 收藏 end ------------------*/

        /*------------- 关注 begin ------------------*/

        .userStore .post-list li[data-v-7cb574c0] {
            display: inline-block;
            vertical-align: top;
            width: 62px;
            margin: 8px 15px;
        }

        .userStore .post-list li a[data-v-7cb574c0] {
            display: block;
            text-decoration: none;
        }

        .userStore .post-list li a img[data-v-7cb574c0] {
            display: inline-block;
            vertical-align: top;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            border: 1px solid #d9d9d9;
        }

        .userStore .post-list li a span[data-v-7cb574c0] {
            display: block;
            height: 40px;
            margin-top: 6px;
            text-align: center;
            font-size: 14px;
            color: #5c5c5c;
            line-height: 20px;
            word-break: break-all;
        }

        /*------------- 关注 end ------------------*/

        /*------------- 悬浮显示其他用户 begin ------------------*/
        .othersInformation {
            display: block;
            opacity: 1;
            position: absolute;
            z-index: 99;
            top: -218px;
            left: -86.85px;
            height: 250%;
        }

        .usercard {
            display: none;
            width: 235px;
            max-height: 235px;
            background-color: #fff;
            border: 1px solid #ececec;
        }

        .usercard .uc-inner {
            display: block;
            position: relative;
            width: 100%;
            height: 100%;
        }

        .usercard .uc-inner .uc-avatar {
            text-align: center;
            padding: 10px 0;
        }

        .usercard .uc-inner .uc-avatar img {
            display: inline-block;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 1px solid #ededed;
            vertical-align: top;
        }

        .usercard .uc-inner .uc-name {
            display: block;
            height: 18px;
            line-height: 18px;
            font-size: 14px;
            color: #5c5c5c;
            text-align: center;
        }

        .usercard .uc-inner .title {
            display: block;
            height: 12px;
            line-height: 1;
            margin: 8px 0 10px;
            font-size: 12px;
            color: #898989;
            text-align: center;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .usercard .uc-inner .data {
            display: block;
            padding: 10px 0;
            border-top: 1px solid #ececec;
        }

        .usercard .uc-inner .data ul {
            font-size: 0;
            padding: 0;
            margin: 0;
        }

        .usercard .uc-inner .data ul li {
            display: inline-block;
            width: 58px;
            font-size: 14px;
            text-align: center;
            color: #898989;
            padding: 0 0;
        }

        .usercard .uc-inner .data ul li + li {
            border-left: 1px solid #ececec;
        }

        .usercard .uc-inner .data ul li dd, .usercard .uc-inner .data ul li dt {
            display: block;
            margin: 0;
            padding: 0;
            line-height: 1;
        }

        .usercard .uc-inner .data ul li dd {
            margin-top: 8px;
        }

        .usercard .uc-inner .actions {
            display: block;
            margin-top: 5px;
            margin-bottom: 15px;
            text-align: center;
        }

        .usercard .uc-inner .actions .fstatus-true {
            background-color: #c1c1c1;
        }

        .usercard .uc-inner .actions .fstatus-false {
            background-color: #fda036;
        }

        .usercard .uc-inner .actions .follow {
            display: inline-block;
            height: 28px;
            line-height: 28px;
            padding: 0 15px;
            border-radius: 3px;
            font-size: 14px;
            color: #fff;
            text-decoration: none;
            transition: all .2s;
        }

        li .inner .avatar .usercard .uc-inner .actions .follow {
            display: inline-block;
            height: 28px;
            line-height: 28px;
            padding: 0 15px;
            border-radius: 3px;
            font-size: 14px;
            color: #fff;
            text-decoration: none;
            transition: all .2s;
        }

        .usercard .uc-inner i.arrow-b {
            bottom: -8px;
            right: 110px;
            border-width: 8px 7px 0 7px;
            border-color: #ececec transparent transparent transparent;
        }

        /*------------- 悬浮显示其他用户 end ------------------*/
    </style>
</head>
<body>
<div id="userIndex">
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
    <div class="container">
        <div class="user-header">
            <div class="main">
                <%--<a href="#" class="visit">今日访客：0</a>--%>
                <div class="avater">
                    <img src="../<c:out value="${sessionScope.user['img']}"/>">
                </div>
                <div class="name"><c:out
                        value="${sessionScope.user['username']}"/></div>
                <div class="desc">
                    <c:if test="${sessionScope.user['text'] == null}">
                        用户很懒，什么都没留下
                    </c:if>
                    <c:if test="${sessionScope.user['text'] != null}">
                        ${sessionScope.user['text']}
                    </c:if>
                </div>
            </div>
            <div class="nav">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                    <ul class="layui-tab-title">
                        <li class="layui-this" style="width: 290px">主页</li>
                        <li style="width: 290px">资料</li>
                        <li style="width: 290px">关注</li>
                        <li style="width: 290px">收藏</li>
                    </ul>
                    <div class="layui-tab-content" style="height: 100px;">
                        <div class="layui-tab-item layui-show">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="container">
                                        <div class="main">
                                            <ul class="select-type">
                                                <li>
                                                    <a href="#" class="active" onclick="userAll()" id="userAllB">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="userPosts()" id="userPostsB">
                                                        发表的帖子
                                                        <span id="sendPostNum">(${sessionScope.countP})</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="userReviews()" id="userReviewsB">
                                                        回复的帖子
                                                        <span id="reviewPostNum">(${sessionScope.countR})</span>
                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="timeline" id="userAll" style="display: block">

                                            </div>
                                            <div class="timeline" id="userPosts" style="display:none;">
                                            </div>
                                            <div class="timeline" id="userReviews" style="display:none;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="container">
                                        <div class="main">
                                            <div class="base">
                                                <div class="top">
                                                    <h3 class="title">基本资料</h3>
                                                    <a href="#" class="edit-btn" onclick="editUser()">编辑</a>
                                                </div>
                                                <div>
                                                    头像：<img src="../<c:out value="${sessionScope.user['img']}"/>"
                                                            class="avatar">
                                                    <br>
                                                    <c:if test="${sessionScope.user['username'] == null}">
                                                        昵称：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['username'] != null}">
                                                        昵称：${sessionScope.user['username']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['sex'] == null}">
                                                        性别：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['sex'] != null}">
                                                        性别：${sessionScope.user['sex']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['address'] == null}">
                                                        城市：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['address'] != null}">
                                                        城市：${sessionScope.user['address']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['qq'] == null}">
                                                        QQ：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['qq'] != null}">
                                                        QQ：${sessionScope.user['qq']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['email'] == null}">
                                                        邮箱：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['email'] != null}">
                                                        邮箱：${sessionScope.user['email']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['phone'] == null}">
                                                        手机号码：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['phone'] != null}">
                                                        手机号码：${sessionScope.user['phone']}
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['text'] == null}">
                                                        自我介绍：-
                                                        <br>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user['text'] != null}">
                                                        自我介绍：${sessionScope.user['text']}
                                                        <br>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div id="userEdit" class="add-subcat" style="display: none;">
                                                <form class="layui-form layui-form-pane" method="post"
                                                      action="/post/editBase">
                                                    <div class="layui-form-item">
                                                    <span class="layui-breadcrumb">
                                                      <a onclick="returnBase()">基本资料</a>
                                                      <a><cite>编辑</cite></a>
                                                    </span>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <div class="site-demo-upload">
                                                            <label class="layui-form-label"
                                                                   style="margin-top: 6%;">头像</label>
                                                            <img id="LAY_demo_upload"
                                                                 src="../<c:out value="${sessionScope.user['img']}"/>"
                                                                 class="avatar" style="width: 160px;height: 160px;">
                                                            <input type="hidden" name="img"/>
                                                            <div class="site-demo-upbar">
                                                                <input type="file" name="file" class="layui-upload-file"
                                                                       id="test">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">昵称</label>
                                                        <div class="layui-input-inline">
                                                            <input type="text" name="username"
                                                                   jq-verify="required"
                                                                   jq-error="请输入用户名" placeholder="请输入用户名"
                                                                   autocomplete="off" class="layui-input ">
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">性别</label>
                                                        <div class="layui-input-block">
                                                            <input type="radio" name="sex" title="男" value="男"
                                                                   checked="checked"/>
                                                            <input type="radio" name="sex" title="女" value="女"/>
                                                            <input type="radio" name="sex" title="保密" value="保密"/>
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">城市</label>
                                                        <div class="layui-input-inline">
                                                            <input type="text" name="address"
                                                                   placeholder="请输入所在城市"
                                                                   class="layui-input ">
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">QQ</label>
                                                        <div class="layui-input-inline">
                                                            <input type="text" name="qq" jq-verify="email"
                                                                   jq-error="邮箱格式不对" placeholder="请输入qq号"
                                                                   autocomplete="off" class="layui-input ">
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">邮箱</label>
                                                        <div class="layui-input-inline">
                                                            <input type="text" name="email" jq-verify="email"
                                                                   jq-error="邮箱格式不对" placeholder="请输入邮箱"
                                                                   autocomplete="off" class="layui-input ">
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <label class="layui-form-label">手机号码</label>
                                                        <div class="layui-input-inline">
                                                            <input type="text" name="phone" jq-verify="phone"
                                                                   jq-error="手机号码格式不对" placeholder="请输入手机号码"
                                                                   autocomplete="off" class="layui-input ">
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item layui-form-text">
                                                        <label class="layui-form-label">自我介绍</label>
                                                        <div class="layui-input-block">
                                                            <textarea name="text" placeholder="随便写些什么刷下存在感"
                                                                      class="layui-textarea"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="layui-form-item" style="margin-left: -110px">
                                                        <div class="layui-input-block">
                                                            <button class="layui-btn" type="submit">
                                                                确认修改
                                                            </button>
                                                            <button type="reset" class="layui-btn layui-btn-primary"
                                                                    style="margin-left: 0px">
                                                                重置
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="container">
                                        <div class="main userStore" style="padding: 0 0;">
                                            <ul class="select-type" style=" margin-left: 1.5%;margin-top: 2%;">
                                                <li>
                                                    <a href="#" class="active" onclick="myAttentions()"
                                                       id="myAttentionsB">我的关注</a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick="myFans()" id="myFansB">我的粉丝</a>
                                                </li>
                                            </ul>
                                            <ul class="post-list" id="myAttentions"
                                                style="display:block;margin-top: 2%">
                                                <%--<li data-v-7cb574c0="">
                                                    <a data-v-7cb574c0="" href="#" target="_blank">
                                                        <img data-v-7cb574c0=""
                                                             src="http://puep.qpic.cn/coral/Q3auHgzwzM5nhgib11ftjdjmgXEQTWRNyW6ErdbFic0UdCYA0ic4SI3DA/100"/>
                                                        <span data-v-7cb574c0="">无兄弟不篮球</span>
                                                        <div class="othersInformation" style="height: 30%;top: -174px;left: -45.85px;">
                                                            <div class="usercard" style="display: block">
                                                                <div class="uc-inner">
                                                                    <div class="uc-avatar">
                                                                        <img src="http://puep.qpic.cn/coral/Q3auHgzwzM5nhgib11ftjdjmgXEQTWRNyW6ErdbFic0UdCYA0ic4SI3DA/100">
                                                                    </div>
                                                                    <div class="uc-name">
                                                                        无兄弟不篮球
                                                                        <em class="gender gender-m"></em>
                                                                    </div>
                                                                    <div class="title" title="雷霆圈主">雷霆圈主</div>
                                                                    <div class="data">
                                                                        <ul>
                                                                            <li>
                                                                                <dt>17</dt>
                                                                                <dd>帖子</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>229</dt>
                                                                                <dd>回复</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>0</dt>
                                                                                <dd>关注</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>1</dt>
                                                                                <dd>粉丝</dd>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="actions">
                                                                        <a class="follow fstatus-false"
                                                                           href="javascript:;" target="_self"
                                                                           onclick="attention(this)">
                                                                            +关注
                                                                        </a>
                                                                    </div>
                                                                    <i class="arrow arrow-b"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li data-v-7cb574c0="">
                                                    <a data-v-7cb574c0="" href="#" target="_blank">
                                                        <img data-v-7cb574c0=""
                                                             src="http://puep.qpic.cn/coral/Q3auHgzwzM5nhgib11ftjdjmgXEQTWRNyW6ErdbFic0UdCYA0ic4SI3DA/100"/>
                                                        <span data-v-7cb574c0="">无兄弟不篮球</span>
                                                        <div class="othersInformation" style="height: 30%;top: -174px;left: 111.15px;">
                                                            <div class="usercard" style="display: block">
                                                                <div class="uc-inner">
                                                                    <div class="uc-avatar">
                                                                        <img src="http://puep.qpic.cn/coral/Q3auHgzwzM5nhgib11ftjdjmgXEQTWRNyW6ErdbFic0UdCYA0ic4SI3DA/100">
                                                                    </div>
                                                                    <div class="uc-name">
                                                                        无兄弟不篮球
                                                                        <em class="gender gender-m"></em>
                                                                    </div>
                                                                    <div class="title" title="雷霆圈主">雷霆圈主</div>
                                                                    <div class="data">
                                                                        <ul>
                                                                            <li>
                                                                                <dt>17</dt>
                                                                                <dd>帖子</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>229</dt>
                                                                                <dd>回复</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>0</dt>
                                                                                <dd>关注</dd>
                                                                            </li>
                                                                            <li>
                                                                                <dt>1</dt>
                                                                                <dd>粉丝</dd>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="actions">
                                                                        <a class="follow fstatus-false"
                                                                           href="javascript:;" target="_self"
                                                                           onclick="attention(this)">
                                                                            +关注
                                                                        </a>
                                                                    </div>
                                                                    <i class="arrow arrow-b"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>--%>
                                            </ul>
                                            <ul class="post-list" id="myFans" style="display:none;margin-top: 2%">

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--收藏--%>
                        <div class="layui-tab-item">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="container">
                                        <div class="main userStore" style="padding: 0 0;">
                                            <ul class="post-list" id="userStore">

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/jsp/js/jquery-3.2.1.js"></script>
<script>
    var layer = layui.layer;
    $(function () {
        timeLine();
        userStore();
        userAttention();
        userFan();
    });
    // -------------关注 begin ----------------------
    function myAttentions() {
        $("#myFansB").removeClass("active");
        $("#myAttentionsB").addClass("active");
        $("#myFans").css("display", "none");
        $("#myAttentions").css("display", "block");
    }
    function myFans() {
        $("#myAttentionsB").removeClass("active");
        $("#myFansB").addClass("active");
        $("#myAttentions").css("display", "none");
        $("#myFans").css("display", "block");
    }
    function userAttention() {
        $.ajax({
            url: "/user/findUserAttentions",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var users = data.ul;
                    var end = users.length;
                    if (end > 0) {
                        for (var i = 0; i < end; i++) {
                            var user = users[i];
                            var li = '<li data-v-7cb574c0=""><a data-v-7cb574c0="" href="#" target="_blank"><img data-v-7cb574c0="" src="/jsp/' + user.img + '"/><span data-v-7cb574c0="">' + user.username + '</span><div class="othersInformation" style="height: 32%;top: -149px;left: ' + (154 * i - 45.85) + 'px;"><div class="usercard"><div class="uc-inner"><div class="uc-avatar"><img src="/jsp/' + user.img + '"></div><div class="uc-name">' + user.username + '<em class="gender gender-m"></em></div><div class="title" title="雷霆圈主">雷霆圈主</div><div class="data"><ul><li><dt>' + user.postNum + '</dt><dd>帖子</dd></li><li><dt>' + user.reviewNum + '</dt><dd>回复</dd></li><li><dt>' + user.attentionNum + '</dt><dd>关注</dd></li><li><dt>' + user.fanNum + '</dt><dd>粉丝</dd></li></ul></div><div class="actions"><a class="follow fstatus-true" href="javascript:;" target="_self" onclick="attention3(this,'+user.id+')">已关注</a></div><i class="arrow arrow-b"></i></div></div></div></a></li>';
                            $("#myAttentions").append(li);
                        }
                    } else {
                        var li = '暂无关注';
                        $("#myAttentions").append(li);
                    }
                }
            },
            error: function () {
                alert('收藏错误');
            }
        });
        $("#myAttentions li a img").hover(function () {
            $(this).parent().parent().find(".usercard").css("display", "block");
        }, function () {
            $(this).parent().parent().find(".usercard").css("display", "none");
        });
        $(".othersInformation").hover(function () {
            $(this).find(".usercard").css("display", "block");
        }, function () {
            $(this).find(".usercard").css("display", "none");
        });
    }
    function userFan() {
        $.ajax({
            url: "/user/findUserFans",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var users = data.ul;
                    var end = users.length;
                    if (end > 0) {
                        for (var i = 0; i < end; i++) {
                            var user = users[i];
                            var li = '<li data-v-7cb574c0=""><a data-v-7cb574c0="" href="#" target="_blank"><img data-v-7cb574c0="" src="/jsp/' + user.img + '"/><span data-v-7cb574c0="">' + user.username + '</span><div class="othersInformation" style="height: 32%;top: -174px;left: ' + (154 * i - 45.85) + 'px;"><div class="usercard"><div class="uc-inner"><div class="uc-avatar"><img src="/jsp/' + user.img + '"></div><div class="uc-name">' + user.username + '<em class="gender gender-m"></em></div><div class="title" title="雷霆圈主">雷霆圈主</div><div class="data"><ul><li><dt>' + user.postNum + '</dt><dd>帖子</dd></li><li><dt>' + user.reviewNum + '</dt><dd>回复</dd></li><li><dt>' + user.attentionNum + '</dt><dd>关注</dd></li><li><dt>' + user.fanNum + '</dt><dd>粉丝</dd></li></ul></div><div class="actions"><a class="follow fstatus-true" href="javascript:;" target="_self" onclick="attention(this)">已关注</a></div><i class="arrow arrow-b"></i></div></div></div></a></li>';
                            $("#myFans").append(li);
                        }
                    } else {
                        var li = '暂无关注';
                        $("#myFans").append(li);
                    }
                }
            },
            error: function () {
                alert('收藏错误');
            }
        });
    }
    // -------------关注 end ----------------------
    // -------------关注按钮 begin ----------------------
    function attention(thisObj,userId) {
        if ($(thisObj).hasClass("fstatus-false")) {
            $.ajax({
                url: "/user/payAttention?userId=" + userId,
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).removeClass("fstatus-false");
                        $(thisObj).addClass("fstatus-true");
                        $(thisObj).html("已关注");
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                    alert('cancelAttention3错误！');
                }
            });
        } else {
            $.ajax({
                url: "/user/cancelAttention3?userId=" + userId,
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).removeClass("fstatus-true");
                        $(thisObj).addClass("fstatus-false");
                        $(thisObj).html("+关注");
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                    alert('cancelAttention3错误！');
                }
            });
        }
    }
    // 第三个Tab中的关注按钮
    function attention3(thisObj,userId) {
        layer.load();
        setTimeout(function () {
            layer.closeAll('loading');
            $.ajax({
                url: "/user/cancelAttention3?userId=" + userId,
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        layer.msg('更新成功');
                        $(thisObj).parent().parent().parent().parent().parent().remove();
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                    alert('cancelAttention3错误！');
                }
            });
        }, 500);
    }
    // -------------关注按钮 end ----------------------

    // -------------收藏 begin ----------------------
    function userStore() {
        $.ajax({
            url: "/user/findUserStores",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var stores = data.stores;
                    var end = stores.length;
                    if (end > 0) {
                        var times = data.times;
                        var authors = data.authors;
                        var attentions = data.attentions;
                        var countPosts = data.countPosts;
                        var countReviews = data.countReviews;
                        var countAs = data.countAs;
                        var countFs = data.countFs;
                        for (var i = 0; i < end; i++) {
                            var store = stores[i];
                            var user = authors[i];
                            var li = '';
                            var li1 = '<li><div class="inner"><div class="avatar"><a href="#"><img src="/jsp/' + user.img + '"/></a>';
                            var li2 = '<div class="othersInformation" style="left: -86.85px;"><div class="usercard"><div class="uc-inner"><div class="uc-avatar"><img src="/jsp/' + user.img + '"></div><div class="uc-name">' + store.author + '<em class="gender gender-m"></em></div><div class="title" title="雷霆圈主">雷霆圈主</div><div class="data"><ul><li><dt>' + countPosts[i] + '</dt><dd>帖子</dd></li><li><dt>' + countReviews[i] + '</dt><dd>回复</dd></li><li><dt>' + countAs[i] + '</dt><dd>关注</dd></li><li><dt>' + countFs[i] + '</dt><dd>粉丝</dd></li></ul></div><div class="actions">';
                            var li = li + li1 + li2;
                            if (attentions[i] == null)
                                li += '<a class="follow fstatus-false" href="javascript:;" target="_self" onclick="attention(this,'+user.id+')">+关注';
                            else
                                li += '<a class="follow fstatus-true" href="javascript:;" target="_self" onclick="attention(this,'+user.id+')">已关注';
                            var li3 = '</a></div><i class="arrow arrow-b"></i></div></div></div></div><div class="post"><a href="#" target="_blank" class="title">' + store.title + '</a><div class="info"><a target="_blank" href="#" class="author">' + store.author + '</a><span class="time">' + times[i] + '</span></div></div><a href="javascript:;" target="_self" class="unmark" onclick="cancelStore(this,' + store.id + ')">取消收藏</a><a target="_blank" href="#" class="sq-link"><div class="logo"><img src="/jsp/img/lt2.jpg"></div><span>雷霆</span></a></div></li>';
                            li += li3;
                            $("#userStore").append(li);
                        }
                    } else {
                        var li = '暂无收藏';
                        $("#userstore").append(li);
                    }
                }
            },
            error: function () {
                alert('收藏错误');
            }
        });
        $(".post-list li").hover(function () {
            $(this).css("background-color", "#f0f0f0");
            $(this).find(".unmark").css("opacity", "1");
        }, function () {
            $(this).css("background-color", "#ffffff");
            $(this).find(".unmark").css("opacity", "0");
        });

        $(".unmark").hover(function () {
            $(".unmark").css("color", "#f38400");
        }, function () {
            $(".unmark").css("color", "#434343");
        });
        $(".post .title").hover(function () {
            $(this).css("color", "#f38400");
        }, function () {
            $(this).css("color", "#434343");
        });
        $(".post .author").hover(function () {
            $(this).css("color", "#f38400");
        }, function () {
            $(this).css("color", "#434343");
        });

        $(".post-list .avatar img").hover(function () {
            $(this).parent().parent().find(".usercard").css("display", "block");
        }, function () {
            $(this).parent().parent().find(".usercard").css("display", "none");
        });

        $(".othersInformation").hover(function () {
            $(this).find(".usercard").css("display", "block");
        }, function () {
            $(this).find(".usercard").css("display", "none");
        });
    }
    function cancelStore(thisObj, postId) {
        layer.load();
        setTimeout(function () {
            layer.closeAll('loading');
            $.ajax({
                url: "/user/cancelStore?postId=" + postId,
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        layer.msg('更新成功');
                        $(thisObj).parent().parent().remove();
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                    alert('cancelStore错误！');
                }
            });
        }, 500);
    }
    // -------------收藏 end ------------------------

    // -------------主页 begin ----------------------
    function userAll() {
        $("#userPostsB").removeClass("active");
        $("#userReviewsB").removeClass("active");
        $("#userAllB").addClass("active");
        $("#userPosts").css("display", "none");
        $("#userReviews").css("display", "none");
        $("#userAll").css("display", "block");
    }
    function userPosts() {
        $("#userAllB").removeClass("active");
        $("#userReviewsB").removeClass("active");
        $("#userPostsB").addClass("active");
        $("#userReviews").css("display", "none");
        $("#userAll").css("display", "none");
        $("#userPosts").css("display", "block");
        $.ajax({
            url: "/review/showUserPosts?userId=${sessionScope.user['id']}",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.pl;
                    var end2 = postList.length;
                    if (end2 > 0) {
                        var titles2 = data.titles2;
                        var times2 = data.times2;
                        for (var i = 0; i < end2; i++) {
                            var post = postList[i];
                            var ul = '<ul><li><div class="avatar"  style="margin-top: -2px;"><img src="../${sessionScope.user['img']}"/></div><div class="post"><div class="title"><span class="light">发布了帖子</span><a href="#" target="_blank">' + titles2[i] + '</a><span class="light"></span></div><div class="extra"><ul></ul></div><div class="info"><span class="light">' + times2[i] + '&ensp;|&ensp;浏览</span><span class="light">(' + post.browseNum + ')</span>&ensp;回复</span><span class="light">(' + post.reviewNum + ')</span>&ensp;赞</span><span class="light">(' + post.upNum + ')</span></div><a href="/" class="sq-link">雷霆</a></div></li></ul>';
                            $("#userPosts").append(ul);
                        }
                    } else {
                        var ul = '暂无';
                        $("#userPosts").append(ul);
                    }
                }
            },
            error: function () {
                alert('userPosts错误')
            }
        });
    }
    function userReviews() {
        $("#userPostsB").removeClass("active");
        $("#userAllB").removeClass("active");
        $("#userReviewsB").addClass("active");
        $("#userPosts").css("display", "none");
        $("#userAll").css("display", "none");
        $("#userReviews").css("display", "block");
        $.ajax({
            url: "/review/showUserReviews?userId=${sessionScope.user['id']}",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var reviewList = data.rl;
                    var end = reviewList.length;
                    if (end > 0) {
                        var titles = data.titles;
                        var times = data.times;
                        for (var i = 0; i < end; i++) {
                            var review = reviewList[i];
                            var ul = '<ul><li><div class="avatar"><img src="../${sessionScope.user['img']}"/></div><div class="post"><div class="title"><span class="light">在帖子</span><a href="#" target="_blank">' + titles[i] + '</a><span class="light">中回复</span></div><div class="summary">' + review.content + '</div><div class="extra"><ul></ul></div><div class="info"><span class="light">' + times[i] + '&ensp;|&ensp;赞</span><span class="light">(0)</span></div><a href="/" class="sq-link">雷霆</a></div></li></ul>';
                            $("#userReviews").append(ul);
                        }
                    } else {
                        var ul = '暂无';
                        $("#userReviews").append(ul);
                    }
                }
            },
            error: function () {
                alert('userReviews错误')
            }
        });
    }
    function timeLine() {
        $.ajax({
            url: "/review/showTimeLine?userId=${sessionScope.user['id']}",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.pl;
                    var end2 = postList.length;
                    if (end2 > 0) {
                        var titles2 = data.titles2;
                        var times2 = data.times2;
                        for (var i = 0; i < end2; i++) {
                            var post = postList[i];
                            var ul = '<ul><li><div class="avatar"  style="margin-top: -2px;"><img src="../${sessionScope.user['img']}"/></div><div class="post"><div class="title"><span class="light">发布了帖子</span><a href="#" target="_blank">' + titles2[i] + '</a><span class="light"></span></div><div class="extra"><ul></ul></div><div class="info"><span class="light">' + times2[i] + '&ensp;|&ensp;浏览</span><span class="light">(' + post.browseNum + ')</span>&ensp;回复</span><span class="light">(' + post.reviewNum + ')</span>&ensp;赞</span><span class="light">(' + post.upNum + ')</span></div><a href="/" class="sq-link">雷霆</a></div></li></ul>';
                            $("#userAll").append(ul);
                        }
                    }
                    var reviewList = data.rl;
                    var end = reviewList.length;
                    if (end > 0) {
                        var titles = data.titles;
                        var times = data.times;
                        for (var i = 0; i < end; i++) {
                            var review = reviewList[i];
                            var ul = '<ul><li><div class="avatar"><img src="../${sessionScope.user['img']}"/></div><div class="post"><div class="title"><span class="light">在帖子</span><a href="#" target="_blank">' + titles[i] + '</a><span class="light">中回复</span></div><div class="summary">' + review.content + '</div><div class="extra"><ul></ul></div><div class="info"><span class="light">' + times[i] + '&ensp;|&ensp;赞</span><span class="light">(0)</span></div><a href="/" class="sq-link">雷霆</a></div></li></ul>';
                            $("#userAll").append(ul);
                        }
                    }
                    if (end + end2 <= 0) {
                        var ul = '暂无';
                        $("#userAll").append(ul);
                    }
                }
            },
            error: function () {
                alert('userAll错误')
            }
        });
    }
    // -------------主页 end --------------------------
    // -------------资料编辑 begin ----------------------
    function editUser() {
        layer.load();
        setTimeout(function () {
            layer.closeAll('loading');
            $(".base").css("display", "none");
            $("#userEdit").css("display", "block");

            if ("${sessionScope.user['username']}" != "")
                $("input[name='username']").val("${sessionScope.user['username']}");

            if ("${sessionScope.user['address']}" != "")
                $("input[name='address']").val("${sessionScope.user['address']}");

            if ("${sessionScope.user['qq']}" != "")
                $("input[name='qq']").val("${sessionScope.user['qq']}");

            if ("${sessionScope.user['email']}" != "")
                $("input[name='email']").val("${sessionScope.user['email']}");

            if ("${sessionScope.user['phone']}" != "")
                $("input[name='phone']").val("${sessionScope.user['phone']}");

            if ("${sessionScope.user['text']}" != "")
                $("textarea[name='text']").val("${sessionScope.user['text']}");
        }, 500);
    }
    function returnBase() {
        $("#userEdit").css("display", "none");
        $(".base").css("display", "block");
    }
    // -------------上传图片 begin ----------------------
    layui.use('upload', function () {
        layui.upload({
            url: '/post/imageUploadInBase'
            , elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            , success: function (res) {
                LAY_demo_upload.src = res.url;
                $("input[name='img']").val(res.url2);
            }
        });
    });
    // -------------上传图片 end ----------------------
    // -------------资料编辑 end --------------------------

</script>
<script>
    layui.use('element', function () {
        var $ = layui.jquery
                , element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

    });
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


    });
</script>
</html>
