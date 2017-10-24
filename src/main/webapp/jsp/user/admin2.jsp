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
    <title>管理页面</title>
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css?v=v3.3.7" media="all">
    <link rel="stylesheet" type="text/css" href="css/font/iconfont.css?v=1.0.0" media="all">
    <link rel="stylesheet" type="text/css" href="css/main.css?v1.3.4" media="all">
    <link rel="stylesheet" type="text/css" href="/jsp" media="all">
    <script src="/jsp/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
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

        .body-container {
            width: 1240px;
            margin: 30px auto 0;
            padding: 0;
        }

        .user-header {
            background-image: url(../img/userBackground.png);
            background-position: 0 0;
            background-repeat: no-repeat;
        }

        .user-header .user-main {
            display: block;
            position: relative;
            height: 276px;
            border: 1px solid #e2f4ff;
        }

        .user-header .user-main .visit {
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

        .user-header .user-main .avater {
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

        .user-header .user-main .name {
            margin-top: 15px;
            text-align: center;
            font-size: 16px;
            font-weight: 700;
            line-height: 20px;
            color: #5c5c5c;
        }

        .user-header .user-main .desc {
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

        .subview .user-home .user-container {
            position: relative;
            margin-top: 20px;
            padding-right: 290px;
        }

        .subview .user-home .user-container .user-main {
            min-height: 800px;
            padding: 25px 20px;
        }

        ul {
            list-style: none;
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

        .user-main .timeline ul {
            list-style: none;
        }

        .user-main .timeline li {
            padding-left: 80px;
            padding-top: 20px;
            padding-bottom: 20px;
            min-height: 60px;
            border-bottom: 1px solid #ededed;
        }

        .user-main .timeline li .avatar {
            display: block;
            float: left;
            margin-left: -80px;
            margin-top: 15px;
        }

        .user-main .timeline li .post {
            display: block;
            position: relative;
            width: 100%;
            font-size: 16px;
            line-height: 32px;
            color: #434343;
        }

        .user-main .timeline li img {
            width: 60px;
            height: 60px;
            border-radius: 30px;
            vertical-align: top;
            border: 1px solid #d9d9d9;
        }

        .user-main .post .title {
            padding-right: 80px;
        }

        .user-main .post .title .light {
            color: #9e9e9e;
        }

        .user-main .post .title a {
            color: #434343;
            text-decoration: none;
        }

        .user-main .post .summary {
            color: #5b5b5b;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .user-main .post .info {
            color: #9e9e9e;
            font-weight: 100;
            font-size: 14px;
        }

        .user-main .post .sq-link {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            line-height: 32px;
            color: #9e9e9e;
            font-size: 14px;
            text-decoration: none;
        }

        .user-main .base {
            padding: 30px 40px;
            line-height: 50px;
            font-size: 16px;
        }

        .user-main .base h3.title {
            display: inline-block;
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
        }

        .user-main .base .top a {
            display: inline-block;
            margin-left: 30px;
            color: #f38400;
            text-decoration: none;
        }

        .user-main .avatar {
            display: inline-block;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            border: 1px solid #d9d9d9;
            vertical-align: middle;
        }

        .container {
            width: 1240px;
        }

        .container .img img {
            vertical-align: top;
        }

        .container .description {
            margin-top: 25px;
            padding-bottom: 25px;
            border-bottom: 1px solid #f0f0f0;
        }

        .container .cLeft {
            display: block;
            width: 545px;
            padding-right: 6px;
            float: left;
        }

        .container .logo {
            float: left;
            width: 180px;
            margin-right: 25px;
            font-size: 0;
        }

        .container .logo img {
            width: 100%;
            border-radius: 50%;
            border: 1px solid #d9d9d9;
        }

        .container .cText {
            width: 545px;
            padding-right: 6px;
        }

        .container .cText .cTop {
            font-size: 0;
        }

        .container .cText h2 {
            display: inline-block;
            line-height: 28px;
            vertical-align: top;
            font-size: 22px;
            color: #434343;
            margin-right: 10px;
        }

        .container .cText .cData {
            margin-top: 15px;
            font-size: 16px;
            line-height: 1;
            color: #898989;
        }

        .container .cText .csText {
            margin-top: 10px;
            font-size: 16px;
            color: #434343;
            line-height: 30px;
        }

        .container .cRight {
            overflow: hidden;
            padding-left: 24px;
            border-left: 1px solid #f0f0f0;
        }

        .container .cRight .title {
            height: 22px;
            line-height: 22px;
            font-size: 22px;
            color: #434343;
            padding-left: 10px;
            border-left: 4px solid #338fe4;
        }

        .container .cRight ul {
            margin-top: 10px;
        }

        .container .cRight ul li a {
            font-size: 20px;
            display: block;
            line-height: 40px;
            text-decoration: none;
            color: #434343;
            overflow: hidden;
            -ms-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .container .topic {
            padding-top: 20px;
        }

        .container .topic .topicsTop a {
            float: right;
            font-size: 16px;
            text-decoration: none;
        }

        .container .topic .topicsTop .right {
            float: right;
            margin-top: 2px;
        }

        .container .topic .topicsTop .myBtn {
            width: 106px;
        }

        .container .topic .topics {
            margin: 20px auto;
            color: #434343;
            margin-top: 50px;
        }

        .container .topic .topics .thead {
            height: 40px;
            line-height: 40px;
            background-color: #f6f6f6;
            border-bottom: 1px solid #c1c1c1;
        }

        .container .topic .topics .tr {
            font-size: 0;
        }

        .container .topic .topics .td {
            font-size: 14px;
            display: inline-block;
            vertical-align: top;
        }

        .container .topic .topics .filters {
            position: relative;
        }

        .container .topic .topics .td-author {
            width: 100px;
        }

        .container .topic .topics .td-count {
            width: 100px;
            text-align: center;
        }

        .container .topic .topics .td-title {
            width: 760px;
        }

        .container .topics .thead .select {
            position: relative;
            padding-left: 20px;
        }

        .container .topics .thead .filter {
            display: inline-block;
            vertical-align: top
        }

        .container .topic .topics .check {
            margin-left: 10px;
        }

        .container .topic .topics .text {
            padding-right: 17px;
        }

        .container .topic .topics ul {
            display: none;
            position: absolute;
            overflow: hidden;
            left: 0;
            top: 40px;
            width: 100%;
            min-width: 90px;
            height: auto;
            background-color: #fff;
            border: 1px solid #ececec;
            list-style: none;
        }

        .container .topic .topics ul li {
            display: block;
        }

        .container .topic .topics ul a {
            display: block;
            height: 32px;
            line-height: 32px;
            text-align: center;
        }

        .container .topic .topics .tbody .tr {
            line-height: 60px;
            border-bottom: 1px solid #f0f0f0;
        }

        .container .topic .topics .tbody .tr .td {
            display: inline-block;
            vertical-align: top;
        }

        .container .topic .topics .tbody .tr .td-title {
            width: 760px;
        }

        .container .topic .topics .tbody .tr .td-title span {
            font-size: 16px;
            margin-left: 4px;
        }

        .container .topic .topics .tbody .tr .td-author {
            padding-top: 10px;
            font-size: 14px;
        }

        .container .topic .topics .tbody .tr .td-author a {
            display: block;
        }

        .container .topic .topics .tbody .tr .td-author a.main {
            color: #5c5c5c;
            line-height: 15px;
        }

        .container .topic .topics .tbody .tr .td-author span {
            display: block;
        }

        .container .topic .topics .tbody .tr .td-author span.sub {
            color: #9e9e9e;
            line-height: 20px;
        }

        .container .topic .topics .tbody .tr .td-count {
            padding-top: 10px;
            font-size: 14px;
        }

        .container .topic .topics .tbody .tr .td-count span {
            display: block;
        }

        .container .topic .topics .tbody .tr .td-count span.main {
            color: #5c5c5c;
            line-height: 15px;
        }

        .container .topic .topics .tbody .tr .td-count span.sub {
            color: #9e9e9e;
            line-height: 20px;
        }

        .container .topic .topics .tbody .tr .td-last {
            padding-top: 10px;
            font-size: 14px;
        }

        .container .topic .topics .tbody .tr .td-last span {
            display: block;
        }

        .container .topic .topics .tbody .tr .td-last a {
            display: block;
        }

        .container .topic .topics .tbody .tr .td-last a.main {
            color: #5c5c5c;
            line-height: 15px;
        }

        .container .topic .topics .tbody .tr .td-last span.sub {
            color: #9e9e9e;
            line-height: 20px;
        }

        .container .topic .topicsBottom a {
            font-size: 16px;
            text-decoration: none;
        }

        .container .topic .topicsBottom .right {
            float: right;
            margin-top: 2px;
        }


    </style>
</head>
<body>
<div id="userIndex">
    <div class="header">
        <div class="layout">
            <div class="left">
                <div class="links">
                    <a href="/">阿越体育论坛</a>
                </div>
            </div>
            <div class="right">
                <div class="login">
                    <c:if test="${sessionScope.user != null}">
                        <a href="/jsp/user/userIndex.jsp" class="userImage" id="userImage">
                            <img src="../<c:out value="${sessionScope.user['img']}"/>">
                        </a>
                        <ul id="userImageUl">
                            <li><a href="/jsp/user/userIndex.jsp" target="_blank"><c:out
                                    value="${sessionScope.user['username']}"/></a></li>
                            <li><a href="javascript:;" onclick="">系统信息</a></li>
                            <li><a href="javascript:;" onclick="">我的社区</a></li>
                            <li><a href="/user/logout">退出</a></li>
                        </ul>
                    </c:if>
                    <div class="text">
                        <c:if test="${sessionScope.user != null}">
                            <a href="/jsp/user/userIndex.jsp" target="_blank">
                                <c:out value="${sessionScope.user['username']}"/>
                            </a>
                            <span>&ensp;|&ensp;</span>
                            <a href="/jsp/user/userIndex.jsp" target="_blank">管理主页</a>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            <a href="/jsp/user/login.jsp" target="_blank" class="bt">登录</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="body-container">
        <div class="user-header">
            <div class="user-main">
                <div class="avater">
                    <img src="../<c:out value="${sessionScope.user['img']}"/>">
                </div>
                <div class="name"><c:out
                        value="${sessionScope.user['username']}"/></div>
                <div class="desc"><c:out
                        value="${sessionScope.user['text']}"/></div>
            </div>
            <div class="nav">
                <div class="layui-tab layui-tab-brief" lay-filter="test">
                    <ul class="layui-tab-title">
                        <li class="layui-this" lay-id="11" style="width: 290px">帖子管理</li>
                        <li style="width: 290px" lay-id="22">用户管理</li>
                        <li style="width: 290px" lay-id="33">社区管理</li>
                        <li style="width: 290px" lay-id="44">网站设置</li>
                    </ul>
                    <div class="layui-tab-content" style="height: 100px;">
                        <div class="layui-tab-item">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="user-container">
                                        <div class="container">
                                            <div class="topic">
                                                <div class="topicsTop">
                                                    <div style="display:inline-block;margin-bottom: -45px;">
                                                        <input type='checkbox'
                                                               style='width: 16px;height: 45px;margin-right: 5px;vertical-align: middle;float: left;'>
                                                        <a href="/post/setTop" style="float: left;">
                                                            <button class="layui-btn layui-btn-danger myBtn"
                                                                    style="width: 64px;height: 38px;">置顶
                                                            </button>
                                                        </a>
                                                        <a href="/post/setGood" style="float: left;">
                                                            <button class="layui-btn layui-btn-normal myBtn"
                                                                    style="margin-left: 5px;width: 64px;height: 38px;">
                                                                加精
                                                            </button>
                                                        </a>
                                                    </div>
                                                    <%--分页--%>
                                                    <%--<div class="right" id="page"/>--%>
                                                </div>
                                                <div class="topics">
                                                    <%--全部时间，默认时间，精华，...--%>
                                                    <div class="thead">
                                                        <div class="tr">
                                                            <div class="td td-title filters">
                                                                <div class="select filter">
                                                                    <div class="text" id="allTime">
                                                                        全部时间
                                                                        <img src="../img/xiajian.png">
                                                                    </div>
                                                                    <ul id="ul">
                                                                        <li><a href="javascript:;" onclick="">一天</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">三天</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">一周</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">一个月</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">三个月</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="select filter">
                                                                    <div class="text" id="defaultSort">
                                                                        默认排序
                                                                        <img src="../img/xiajian.png">
                                                                    </div>
                                                                    <ul id="ul1">
                                                                        <li><a href="javascript:;" onclick="">回帖时间</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">发帖时间</a>
                                                                        </li>
                                                                        <li><a href="javascript:;" onclick="">帖子热度</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="check filter" id="essence">
                                                                    <a href="javascript:;" onclick=""
                                                                       target="_self">精华</a>
                                                                </div>
                                                                <div class="check filter" id="activity">
                                                                    <a href="javascript:;" onclick=""
                                                                       target="_self">活动</a>
                                                                </div>
                                                            </div>
                                                            <div class="td td-author">
                                                                作者
                                                            </div>
                                                            <div class="td td-count">
                                                                回复/浏览
                                                            </div>
                                                            <div class="td td-last">
                                                                最后回复
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tbody" id="postList">

                                                    </div>
                                                </div>
                                                <div class="topicsBottom">
                                                    <div style="display:inline-block;">
                                                        <input type='checkbox'
                                                               style='width: 16px;height: 50px;margin-right: 5px;vertical-align: middle;'>
                                                        <a href="/post/setTop">
                                                            <button class="layui-btn layui-btn-danger myBtn">置顶</button>
                                                        </a>
                                                        <a href="/post/setGood">
                                                            <button class="layui-btn layui-btn-normal myBtn"
                                                                    style="margin-left: 5px;">加精
                                                            </button>
                                                        </a>
                                                    </div>
                                                   <%-- <div class="right" id="page"/>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item layui-show">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="user-container">
                                        <div><p>哈哈</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item">关注</div>
                        <div class="layui-tab-item">收藏</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>

<script type="text/javascript">
    var pages; // 分页数
    var num = 3; // 每页显示的帖子数
    $(function () {
        getPostList(1, num);
    });

    // 异步加载帖子列表
    var getPostList = function (curr, num) {
        // 发送ajax请求
        $.ajax({
            url: "/post/showPosts",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.pl;
                    var times = data.times; // (index,list)
                    pages = postList.length / num;
                    var initValue = (curr - 1) * num;
                    var length = curr * num - 1;
                    var time; // list
                    var t; // string
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var day = date.getDate();
                    var hour = date.getHours();
                    var minutes = date.getMinutes();
                    var div;
                    // 移除div
                    $("#postList div").remove();
                    for (var i = initValue; i <= length; i++) {
                        time = times[i];
                        if (time[0] < year)
                            t = (year - time[0]) + "年";
                        else if (time[1] < month)
                            t = (month - time[1]) + "月";
                        else if (time[2] < day)
                            t = (day - time[2]) + "天";
                        else if (time[3] < hour)
                            t = (hour - time[3]) + "小时";
                        else if (time[4] < minutes)
                            t = (minutes - time[4]) + "分钟";
                        else
                            t = "1分钟";
                        var post = postList[i];
                        var div1 = "<div class='tr'><div class='td td-title'>";
                        var checkBox = "<input type='checkbox' style='width: 16px;height: 50px;margin-right: 5px;vertical-align: middle;'>";
                        var good = "<img src='http://bbs.iqianjin.com/static/image/common/digest_1.gif'>";
                        var good2 = "<img src='http://bbs.iqianjin.com/static/image/common/digest_1.gif' style='margin-left: 10px'>";
                        var top = "<img src='http://bbs.iqianjin.com/static/image/common/pin_1.gif''>";
                        var div2 = "<a target='_blank' href='/post/showPost?id=" + post.id + "'><%--图标--%><%--标题--%><span>" + post.title + "</span></a> </div> <div class='td td-author'><%--作者--%><a target='_blank' href='#'class='main'>" + post.author + "</a><%--时间--%> <span class='sub'>" + t + "前</span></div> <div class='td td-count'> <span class='main'>7</span> <span class='sub'>79</span> </div> <div class='td td-last'> <a class='main' target='_blank' href='#'>混蛋</a> <span class='sub'>56分钟前</span> </div> </div>";
                        div = div1;
                        div = div + checkBox;
                        if (post.isTop == "true")
                            div = div + top;
                        if (post.isGood == "true" && post.isTop == "true")
                            div = div + good2;
                        else if (post.isGood == "true")
                            div = div + good;
                        div = div + div2;
                        $("#postList").append(div);
                    }
                } else {
                    alert("data is null");
                }
            },
            error: function () {
                alert('jax错误')
            }
        });
    };
    // 调用分页
    layui.use(['laypage', 'layer', 'element'], function () {
        var $ = layui.jquery
                , element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '11'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

        var laypage = layui.laypage
                , layer = layui.layer;
        laypage({
            cont: 'page' // 容器。值可以传入元素id或原生DOM或jquery对象
            , pages: Math.ceil(pages) // 分页数
            , skin: '#F7B824' // 分页皮肤
            /*, curr: curr || 1*/ // 当前页
            , prev: '<em><</em>' // 替换上下页
            , next: '<em>></em>'
            , skip: true // 是否显示跳转
            /*
             触发分页后的回调，函数返回两个参数。
             obj是一个object类型。包括了分页的所有配置信息。
             first一个Boolean类，检测页面是否初始加载。非常有用，可避免无限刷新。
             */
            , jump: function (obj, first) {
                if (!first) {
                    getPostList(obj.curr, num);
                }
            }
        });
    });
</script>
<%--<script>
    layui.use('element', function () {
        var $ = layui.jquery
                , element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '11'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });
</script>--%>
<script type="text/javascript">
    var login = function () {
        window.location.href = "jsp/user/login.jsp";
    }
    var logout = function () {
        window.location.href = "jsp/user/logout.jsp";
    }
    var register = function () {
        window.location.href = "jsp/user/register.jsp"
    }
    var post = function () {
        window.open("jsp/post/sendPost.jsp");
    }
    var noPost = function () {
        window.open("jsp/post/noSendPost.jsp");
    }
</script>

<script type="text/javascript">
    /**
     * 用户头像
     */
    $("#userImage").hover(function () {
        $("#userImageUl").css("display", "block");
    }, function () {
        $("#userImageUl").hover(function () {
            $("#userImageUl").css("display", "block");
        }, function () {
            $("#userImageUl").css("display", "none");
        });
        $("#userImageUl").css("display", "none");
    });
    /**
     * 论坛导航栏
     * 1. 全部时间
     */
    // $(selector).hover(inFunction,outFunction)
    // inFunction：必需。规定 mouseover 事件发生时运行的函数。
    // outFunction：可选。规定 mouseout 事件发生时运行的函数。
    $("#allTime").hover(function () {
        $("#ul").css("display", "block");
        $("#allTime").css("color", "#F7B824");
    }, function () {
        $("#allTime").css("color", "#434343");
        $("#ul").hover(function () {
            $("#ul").css("display", "block");
        }, function () {
            $("#ul").css("display", "none");
        });
        $("#ul").css("display", "none");
    });
    // 下拉框a标签变色，用for循环遍历会有问题
    $("#ul li:eq(0) a").hover(function () {
        $("#ul li:eq(0) a").css("color", "#F7B824");
    }, function () {
        $("#ul li:eq(0) a").css("color", "#434343");
    });
    $("#ul li:eq(1) a").hover(function () {
        $("#ul li:eq(1) a").css("color", "#F7B824");
    }, function () {
        $("#ul li:eq(1) a").css("color", "#434343");
    });
    $("#ul li:eq(2) a").hover(function () {
        $("#ul li:eq(2) a").css("color", "#F7B824");
    }, function () {
        $("#ul li:eq(2) a").css("color", "#434343");
    });
    $("#ul li:eq(3) a").hover(function () {
        $("#ul li:eq(3) a").css("color", "#F7B824");
    }, function () {
        $("#ul li:eq(3) a").css("color", "#434343");
    });
    $("#ul li:eq(4) a").hover(function () {
        $("#ul li:eq(4) a").css("color", "#F7B824");
    }, function () {
        $("#ul li:eq(4) a").css("color", "#434343");
    });

    /**
     * 2. 默认排序
     */
    $("#defaultSort").hover(function () {
        $("#ul1").css("display", "block");
        $("#defaultSort").css("color", "#F7B824");
    }, function () {
        $("#defaultSort").css("color", "#434343");
        $("#ul1").hover(function () {
            $("#ul1").css("display", "block");
        }, function () {
            $("#ul1").css("display", "none");
        });
        $("#ul1").css("display", "none");
    });
    $("#ul1 li:eq(0) a").hover(function () {
        $("#ul1 li:eq(0) a").css("color", "#F7B824");
    }, function () {
        $("#ul1 li:eq(0) a").css("color", "#434343");
    });
    $("#ul1 li:eq(1) a").hover(function () {
        $("#ul1 li:eq(1) a").css("color", "#F7B824");
    }, function () {
        $("#ul1 li:eq(1) a").css("color", "#434343");
    });
    $("#ul1 li:eq(2) a").hover(function () {
        $("#ul1 li:eq(2) a").css("color", "#F7B824");
    }, function () {
        $("#ul1 li:eq(2) a").css("color", "#434343");
    });
    /**
     * 3. 精华，活动
     */
    $("#essence").hover(function () {
        $("#essence a").css("color", "#F7B824");
    }, function () {
        $("#essence a").css("color", "#434343");
    });
    $("#activity").hover(function () {
        $("#activity a").css("color", "#F7B824");
    }, function () {
        $("#activity a").css("color", "#434343");
    });
</script>
</html>
