<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子</title>
    <link href="/jsp/css/mycss/showPost.css" rel="stylesheet">
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <script src="/jsp/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
    <script src="https://cdn.ckeditor.com/4.6.1/standard-all/ckeditor.js"></script>
    <script src="/jsp/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/jsp/css/sweetalert.css">
    <link rel="stylesheet" type="text/css" href="/jsp/css/style.css">
    <style type="text/css">

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

        .info .l {
            color: #5C5C5C;
        }

        .info .desc {
            margin: 0 10px 0 15px;
        }

        .info li .ico {
            display: inline-block;
            width: 24px;
            height: 24px;
            position: relative;
            top: 5px;
            background-image: url(/jsp/img/icon/post-icons.png);
        }

        .info li .ico-up .ico {
            background-position: -27px 0;
        }

        .info li .ico-up-ed .ico {
            background-position: -27px -30px;
        }

        .info li .ico-store .ico {
            background-position: -110px 0;
        }

        .info li .ico-store-ed .ico {
            background-position: -110px -29px;
        }

        .info li .ico-share {
            position: relative;
        }

        .info li .ico-share .ico {
            background-position: -84px 0;
        }

        .info li .ico-share-ed .ico {
            background-position: -84px -29px;
        }

        .l.on, .l:hover {
            color: #F68302;
        }

        #lastReviews a p {
            text-overflow: ellipsis;
            overflow: hidden;
        }
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
                    <a href="/jsp/user/userIndex.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                        <img src="/jsp/<c:out value="${sessionScope.user['img']}"/>">
                    </a>
                </c:if>
                <div class="text">
                    <c:if test="${sessionScope.user != null}">
                        <a href="/jsp/user/userIndex.jsp" target="_blank">
                            <c:out value="${sessionScope.user['username']}"/>
                        </a>
                        <a href="/jsp/user/userIndex.jsp" target="_blank">
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
    <%--导航栏--%>
    <div class="bar">
        <span class="layui-breadcrumb">
            <a href="/">雷霆</a>
            <a><cite>${requestScope.post.title}</cite></a>
        </span>
    </div>
    <%--帖子内容 --%>
    <div class="content">
        <%--左边，帖子话题--%>
        <div class="topic">
            <div>
                <%--发帖人的内容--%>
                <div class="topicAuthor">
                    <div class="btn">
                        <a href="/jsp/post/sendPost2.jsp" target="_blank">
                            <button class="layui-btn layui-btn-warm myBtn">发新帖</button>
                        </a>
                        <a href="#editor">
                            <button class="layui-btn layui-btn-normal myBtn">回复</button>
                        </a>
                        <%--具有admin角色才会显示标签内的信息。--%>
                        <shiro:hasRole name="admin">
                            <a href="/post/setTop">
                                <c:if test="${requestScope.post.isTop == 'true'}">
                                    <button class="layui-btn layui-btn-danger myBtn">取消置顶</button>
                                </c:if>
                                <c:if test="${requestScope.post.isTop == 'false'}">
                                    <button class="layui-btn layui-btn-danger myBtn">置顶</button>
                                </c:if>
                            </a>
                            <a href="/">
                                <c:if test="${requestScope.post.isTop == 'true'}">
                                    <button class="layui-btn layui-btn-normal myBtn">取消加精</button>
                                </c:if>
                                <c:if test="${requestScope.post.isTop == 'false'}">
                                    <button class="layui-btn layui-btn-normal myBtn">加精</button>
                                </c:if>
                            </a>
                        </shiro:hasRole>
                    </div>
                    <div class="topic-main">
                        <div class="title">
                            <%--置顶，精华--%>
                            <span></span>
                            <span class="txt">${requestScope.post.title}</span>
                        </div>
                        <div class="main">
                            <%--头像--%>
                            <a href="#" target="_blank" class="img"  id="authorImg" >
                                <img src="/jsp/<c:out value="${requestScope.author['img']}"/>">
                            </a>
                            <div class="panel">
                                <div class="detail">
                                    <a href="#" target="_blank">${requestScope.post.author}</a>
                                    <span class="label">楼主</span>
                                    <span class="txt">发布在</span>
                                    <a href="/" target="_blank" class="group">雷霆</a>
                                    <span class="txt">
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                        value="${requestScope.post.time}"/></span>
                                    <a href="javascript:;" class="only" onclick="onlySeeAuthor()" id="onlySeeAuthor">只看楼主</a>
                                </div>
                                <div class="content">
                                    ${requestScope.post.content}
                                </div>
                                <div class="info">
                                    <ul>
                                        <li>
                                            <c:choose>
                                                <c:when test="${requestScope.isUp=='true'}">
                                                    <a href="javascript:;" class="l ico-up ico-up-ed on"
                                                       onclick="up(this)">
                                                        <span class="ico"></span>
                                                        <span class="desc">赞</span>
                                                        <span class="num">${requestScope.post.upNum}</span>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:;" class="l ico-up" onclick="up(this)">
                                                        <span class="ico"></span>
                                                        <span class="desc">赞</span>
                                                        <span class="num">${requestScope.post.upNum}</span>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                        <li>
                                            <c:choose>
                                                <c:when test="${requestScope.isStore=='true'}">
                                                    <a href="javascript:;" class="l ico-store ico-store-ed on"
                                                       onclick="store(this)">
                                                        <span class="ico"></span>
                                                        <span class="desc">收藏</span>
                                                        <span class="num">${requestScope.post.storeNum}</span>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:;" class="l ico-store" onclick="store(this)">
                                                        <span class="ico"></span>
                                                        <span class="desc">收藏</span>
                                                        <span class="num">${requestScope.post.storeNum}</span>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                        <li>
                                            <a href="javascript:;" class="l ico-share" onclick="share(this)">
                                                <span class="ico"></span>
                                                <span class="desc">分享</span>
                                                <div class="mod-share" id="J_share" style="display: none;">
                                                    <div id="qrcode" class="qrcode">
                                                        <canvas width="160" height="160"></canvas>
                                                    </div>
                                                    <dl class="share-tool-bar">
                                                        <i class="ar1">◆</i>
                                                        <dd>
                                                            <span class="share-qq-wb"></span>
                                                            <span class="share-qzone"></span>
                                                            <span class="share-qq"></span>
                                                            <span class="share-sina-wb"></span>
                                                            <span class="share-wx"></span>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%--他人评论--%>
                <div class="topicOthers">
                    <div class="title">
                        <span class="txt">全部回帖</span>
                    </div>
                    <ul id="reviewList">

                    </ul>
                    <div class="topicsBottom">
                        <%--分页--%>
                        <div class="right" id="page"/>
                    </div>
                </div>
            </div>
            <%--回复编辑器--%>
            <div class="write">
                 <span class="img">
                     <shiro:user>
                         <img src="/jsp/${sessionScope.user.img}">
                     </shiro:user>
                     <shiro:guest>
                         <img src="/jsp/img/user/user.jpg">
                     </shiro:guest>
                 </span>
                <div class="panel" id="editor">
                    <%--<form id="form1" name="form1" method="post" action="/review/sendReview">--%>
                    <div class="editor">
                        <textarea cols="80" id="body" name="content"></textarea>
                    </div>
                    <div class="bottom">
                        <button class="layui-btn layui-btn-warm myBtn" onclick="addReview()">发表回复</button>
                        <ul>
                            <li>Tips：为了建立良好的社区氛围，请认真对待每一次发言，避免“呵呵”“哈哈”等无意义回复</li>
                        </ul>
                    </div>
                    <%--</form>--%>
                    <script type="text/javascript">
                        CKEDITOR.replace('body', {
                            filebrowserImageUploadUrl: '/review/imageUpload',
                            image_previewText: ' ',
                            height: '100',
                            width: '825',
                            toolbar: [
                                {name: 'clipboard', items: ['Undo', 'Redo']},
                                {name: 'styles', items: ['Styles', 'Format']},
                                {name: 'basicstyles', items: ['Bold', 'Italic', 'Strike', '-', 'RemoveFormat']},
                                {
                                    name: 'paragraph',
                                    items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
                                },
                                {name: 'links', items: ['Link', 'Unlink']},
                                {name: 'insert', items: ['Image', 'EmbedSemantic', 'Table']},
                                {name: 'tools', items: ['Maximize']},
                                {name: 'editing', items: ['Scayt']}
                            ],
                            customConfig: '',
                            bodyClass: 'article-editor',
                            format_tags: 'p;h1;h2;h3;pre',
                            removeDialogTabs: 'image:advanced;link:advanced'
                        });
                    </script>
                </div>
            </div>
        </div>

        <%--右边，关联--%>
        <div class="relate">

        </div>
    </div>
</div>
<div class="edge">
    <div class="fly-panel leifeng-rank" style="height: 200px">
        <h3 class="fly-panel-title"><span>社区介绍</span></h3>
        <div class="logo">
            <img src="/jsp/img/lt2.jpg">
        </div>
        <div class="cText">
            <div class="cTop">
                <h2>雷霆</h2>
            </div>
            <div class="cData">
                <%--<p>成员：1866695&ensp;</p>
                <p>帖子：32325&ensp;</p>
                <p>今日：85</p>--%>
            </div>
            <div class="csText">
                社区介绍：<br>
                威少这么屌的，下水道里还有三个！
            </div>
        </div>
    </div>

    <%--最近热帖--%>
    <dl class="fly-panel fly-list-one" id="hotPosts">
        <dt class="fly-panel-title">最近热帖</dt>
    </dl>
    <%--近期热议--%>
    <dl class="fly-panel fly-list-one" id="hotReviews">
        <dt class="fly-panel-title">近期热议</dt>
    </dl>
    <%--最新回复--%>
    <dl class="fly-panel fly-list-one" id="lastReviews">
        <dt class="fly-panel-title">最新回复</dt>
    </dl>

</div>
<div class="othersInformation" style="height: 70%;top: 77px;left: 74.15px;">
    <div class="usercard">
        <div class="uc-inner">
            <div class="uc-avatar">
                <img src="/jsp/${requestScope.author['img']}">
            </div>
            <div class="uc-name">
                ${requestScope.author['username']}
                <em class="gender gender-m"></em>
            </div>
            <div class="title" title="雷霆圈主">雷霆圈主</div>
            <div class="data">
                <ul>
                    <li>
                        <dt>${requestScope.author['postNum']}</dt>
                        <dd>帖子</dd>
                    </li>
                    <li>
                        <dt>${requestScope.author['reviewNum']}</dt>
                        <dd>回复</dd>
                    </li>
                    <li>
                        <dt>${requestScope.author['attentionNum']}</dt>
                        <dd>关注</dd>
                    </li>
                    <li>
                        <dt>${requestScope.author['fanNum']}</dt>
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
</body>
<script type="text/javascript">
    var pages; // 分页数
    var num = 20; // 每页显示的帖子数
    $(function () {
        // 异步加载帖子列表
        getPostList(1, num);
        forumDescription();
        postsRankingList();
        $("#authorImg").hover(function () {
            $(".usercard").css("display","block");
        },function () {
            $(".usercard").css("display","none");
        });
    });

    // ----------- 侧边栏 begin ----------------
    function postsRankingList() {
        // 最近热帖
        $.ajax({
            url: "/post/hotPosts",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data != null) {
                    if (data) {
                        var postList = data.hp;
                        // 删除所有dd元素
                        $("#hotPosts dd").remove();
                        for (var i = 0; i < 9; i++) {
                            var post = postList[i];
                            if (i > 2)
                                var dd = '<dd><i class="red">' + (i + 1) + '</i><a href="/post/showPost?id=' + post.id + '">' + post.title + '</a><span><img src="/jsp/img/icon/browse.png" style="margin:0px 2px 2px 2px;">' + post.browseNum + '</span></dd>';
                            else
                                var dd = '<dd><i class="red" style="background-color: #ed4f4f">' + (i + 1) + '</i><a href="/post/showPost?id=' + post.id + '">' + post.title + '</a><span><img src="/jsp/img/icon/browse.png" style="margin:0px 2px 2px 2px;">' + post.browseNum + '</span></dd>';
                            $("#hotPosts").append(dd);
                        }
                    }
                }
            },
            error: function () {
                alert("ajax出错");
            }
        });
        // 近期热议
        $.ajax({
            url: "/post/hotReviews",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data != null) {
                    if (data) {
                        var postList = data.hr;
                        // 删除所有dd元素
                        $("#hotReviews dd").remove();
                        for (var i = 0; i < 9; i++) {
                            var post = postList[i];
                            if (i > 2)
                                var dd = '<dd><i class="red">' + (i + 1) + '</i><a href="/post/showPost?id=' + post.id + '">' + post.title + '</a><span><img src="/jsp/img/icon/review.png" style="margin:0px 2px 2px 2px;">' + post.reviewNum + '</span></dd>';
                            else
                                var dd = '<dd><i class="red" style="background-color: #ed4f4f">' + (i + 1) + '</i><a href="/post/showPost?id=' + post.id + '">' + post.title + '</a><span><img src="/jsp/img/icon/review.png" style="margin:0px 2px 2px 2px;">' + post.reviewNum + '</span></dd>';
                            $("#hotReviews").append(dd);
                        }
                    }
                }
            },
            error: function () {
                alert("ajax出错");
            }
        });
        // 最新评论
        $.ajax({
            url: "/review/lastReviews",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data != null) {
                    if (data) {
                        var reviewList = data.lr;
                        // 删除所有dd元素
                        $("#lastReviews dd").remove();
                        for (var i = 0; i < 9; i++) {
                            var review = reviewList[i];
                            if (i > 2)
                                var dd = '<dd><i class="red">' + (i + 1) + '</i><a href="/post/showPost?id=' + review.postId + '">' + review.content + '</a></dd>';
                            else
                                var dd = '<dd><i class="red" style="background-color: #ed4f4f">' + (i + 1) + '</i><a href="/post/showPost?id=' + review.postId + '">' + review.content + '</a></dd>';
                            $("#lastReviews").append(dd);
                        }
                    }
                }
            },
            error: function () {
                alert("ajax出错");
            }
        });
    }
    // ----------- 侧边栏 end ----------------

    // ----------- 版块介绍 begin -------------
    function forumDescription() {
        $.ajax({
            url: "/post/forumDescription",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var users = data.users;
                    var posts = data.posts;
                    var todayPosts = data.todayPosts;
                    var p = '<p>成员：' + users + '&ensp;</p><p>帖子：' + posts + '&ensp;</p><p>今日：' + todayPosts + '</p>';
                    $(".cData").append(p);
                }
            },
            error: function () {
                alert('版块介绍错误')
            }
        });
    }
    // ----------- 版块介绍 end -------------

    var getPostList = function (curr, num) {
        // 发送ajax请求
        $.ajax({
            url: "/review/showReviews",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.rl;
                    var times = data.time;
                    pages = postList.length / num;
                    var initValue = (curr - 1) * num;
                    var length = curr * num - 1;
                    // 移除li
                    $("#reviewList li").remove();
                    if (postList.length < num) {
                        length = postList.length - 1;
                    }
                    for (var i = initValue; i <= length; i++) {
                        var review = postList[i];
                        var time = times[i];
//                    <a class='lr' href='javascript:;'>回复</a> <a class='lr' href='javascript:;'>举报</a>
                        var li = "<li><a href='#' target='_blank'><img src='/jsp/" + review.img + " '> </a> <div class='panel'> <div class='detail'> <a href='#' target='_blank'>" + review.username + "</a> <span class='txt'>" + time + "</span><span class='line'>|</span> <a href='javascript:;' class='only'>只看TA</a> <a href='javascript:;' class='good'>赞</a> <span class='lr floor'>" + (i + 1) + "楼</span>  </div> <div class='content'> " + review.content + " </div> <div class='info'></div> </div></li>";
                        $("#reviewList").append(li);
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
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
                , layer = layui.layer;
        ;
        laypage({
            cont: 'page' // 容器。值可以传入元素id或原生DOM或jquery对象
            , pages: Math.ceil(pages) // 分页数，必须是整数，否则不显示
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

    // 发布成功，页面显示
    function addReview() {
        var content = $("iframe").contents().find("body").html();
        if (aJaxAddReview(content)) {
            swal({
                title: "发布成功!",
                timer: 2000,
                showConfirmButton: false,
                type: "success",
            });
            var time = clockon();
            var li = "<li><a href='/jsp/user/userIndex.jsp' target='_blank'><img src='/jsp/${sessionScope.user.img}'> </a> <div class='panel'> <div class='detail'> <a href='#' target='_blank'>${sessionScope.user.username}</a> <span class='txt'>" + time + "</span><span class='line'>|</span> <a href='javascript:;' class='only'>只看TA</a> <a href='javascript:;' class='good'>赞</a> <span class='lr floor'>" + (pages * num + 1) + "楼</span>  </div> <div class='content'> " + content + " </div> <div class='info'></div> </div></li>";
            $("#reviewList").append(li);
        } else {
            window.location.href = '/jsp/user/nologin.jsp';
        }
    }
    function aJaxAddReview(content) {
        var b;
        $.ajax({
            url: "/review/sendReview?content=" + content,
            type: "post",
            data: "",
            dataType: "text",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data == "success")
                    b = true;

            },
            error: function () {
                b = false;
            }
        });
        return b;
    }
    //本地时钟
    function clockon() {
        var now = new Date();
        var year = now.getFullYear(); //getFullYear getYear
        var month = now.getMonth();
        var date = now.getDate();
        var day = now.getDay();
        var hour = now.getHours();
        var minu = now.getMinutes();
        var sec = now.getSeconds();
        var week;
        month = month + 1;
        if (month < 10) month = "0" + month;
        if (date < 10) date = "0" + date;
        if (hour < 10) hour = "0" + hour;
        if (minu < 10) minu = "0" + minu;
        if (sec < 10) sec = "0" + sec;
        var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
        week = arr_week[day];
        var time = "";
        time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu;
        return time;
    }
    // ------------------点赞，收藏，分享 begin-------------------
    function up(thisObj) {
        var num = $(thisObj).children("span:nth-child(3)").html();
        if ($(thisObj).hasClass("ico-up-ed")) {
            $.ajax({
                url: "/post/setIsUp?isUp=false",
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).removeClass("ico-up-ed");
                        $(thisObj).removeClass("on");
                        $(thisObj).children("span:nth-child(3)").html(parseInt(num) - 1);
                    }
                    if (data == "null") {
                        window.location.href = '/jsp/user/nologin.jsp';
                    }
                }
                ,
                error: function () {
                }
            });
        } else {
            $.ajax({
                url: "/post/setIsUp?isUp=true",
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).addClass("ico-up-ed");
                        $(thisObj).addClass("on");
                        $(thisObj).children("span:nth-child(3)").html(parseInt(num) + 1);
                    }
                    if (data == "null") {
                        window.location.href = '/jsp/user/nologin.jsp';
                    }
                }
                ,
                error: function () {
                }
            });
        }
    }
    function store(thisObj) {
        var num = $(thisObj).children("span:nth-child(3)").html();
        if ($(thisObj).hasClass("ico-store-ed")) {
            $.ajax({
                url: "/post/setIsStore?isStore=false",
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).removeClass("ico-store-ed");
                        $(thisObj).removeClass("on");
                        $(thisObj).children("span:nth-child(3)").html(parseInt(num) - 1);
                    }
                    if (data == "null") {
                        window.location.href = '/jsp/user/nologin.jsp';
                    }
                }
                ,
                error: function () {
                }
            });

        } else {
            $.ajax({
                url: "/post/setIsStore?isStore=true",
                type: "post",
                data: "",
                dataType: "text",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data == "success") {
                        $(thisObj).addClass("ico-store-ed");
                        $(thisObj).addClass("on");
                        $(thisObj).children("span:nth-child(3)").html(parseInt(num) + 1);
                    }
                    if (data == "null") {
                        window.location.href = '/jsp/user/nologin.jsp';
                    }
                }
                ,
                error: function () {

                }
            });

        }
    }
    function share(thisObj) {
        var num = $(thisObj).children("span:nth-child(3)").html();
        if ($(thisObj).hasClass("ico-share-ed")) {
            $(thisObj).removeClass("ico-share-ed");
            $(thisObj).removeClass("on");
            $(thisObj).children("span:nth-child(3)").html(parseInt(num) - 1);
        } else {
            $(thisObj).addClass("ico-share-ed");
            $(thisObj).addClass("on");
            $(thisObj).children("span:nth-child(3)").html(parseInt(num) + 1);
        }
    }
    // ------------------点赞，收藏，分享 end-------------------
    // ------------------只看某人 begin------------------------
    function onlySeeAuthor() {
        var name = $("#onlySeeAuthor").html();
        if (name == "只看楼主") {
            $("#onlySeeAuthor").html("看全部");
            $.ajax({
                url: "/review/showReviews?userId=${requestScope.post.userId}",
                type: "post",
                data: "",
                dataType: "json",// 预期服务器返回的数据类型。
                async: false, // 设置为同步，避免pages的获取一直为undefined
                success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                    if (data) {
                        var postList = data.rl;
                        var times = data.time;
                        if (postList.length > 0) {
                            // 移除li
                            $("#reviewList li").remove();
                            for (var i = 0; i < postList.length; i++) {
                                var review = postList[i];
                                var time = times[i];
                                var li = "<li><a href='#' target='_blank'><img src='/jsp/" + review.img + " '> </a> <div class='panel'> <div class='detail'> <a href='#' target='_blank'>" + review.username + "</a> <span class='txt'>" + time + "</span><span class='line'>|</span> <a href='javascript:;' class='only'>只看TA</a> <a href='javascript:;' class='good'>赞</a> <span class='lr floor'>" + (i + 1) + "楼</span>  </div> <div class='content'> " + review.content + " </div> <div class='info'></div> </div></li>";
                                $("#reviewList").append(li);
                            }
                        } else {
                            $("#reviewList li").remove();
                        }
                    } else {
                        alert("data is null");
                    }
                },
                error: function () {
                    alert('jax错误')
                }
            });
        }else{
            $("#onlySeeAuthor").html("只看楼主");
            getPostList(1, num);
        }
    }
    // ------------------只看某人 end------------------------
</script>
<script>
    /**
     * 导航栏
     */
    layui.use('element', function () {
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });

</script>

</html>
