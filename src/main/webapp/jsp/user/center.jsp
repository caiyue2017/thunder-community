<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <%--<link href="/jsp/css/mycss/index.css" rel="stylesheet">--%>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
    <%--<style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background-color: #e2e2e2;
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

        .main {
            width: 1075px;
            min-height: 600px;
            margin: 0 auto 15px;
        }

        body .fly-user-main {
            position: relative;
            width: 1085px;
            min-height: 600px;
            margin-top: 30px;
        }

        .fly-user-main > .layui-nav {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 1000;
            height: 100%;
            padding: 10px 0;
        }

        .fly-panel-user[pad20] {
            padding-top: 5px;
        }

        .fly-user-main > .fly-panel {
            width: 860px;
            min-height: 575px;
            margin: 0 0 10px 215px;
        }

        .fly-panel[pad20] {
            padding: 20px;
        }

        .fly-panel {
            margin-bottom: 10px;
            background-color: #fff;
            border-radius: 2px;
        }



        .fly-msg {
            background-color: #F8F8F8;
            color: #666;
        }

        .fly-msg, .fly-error {
            padding: 10px 15px;
            line-height: 24px;
        }

        .fly-user-main > .layui-nav .layui-icon {
            position: relative;
            top: 2px;
            font-size: 20px;
            margin-right: 10px;
        }
    </style>--%>
</head>
<body>

<div id="forum">
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
    <div class="main fly-user-main layui-clear">
        <%--浮动侧边栏--%>
        <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
            <li class="layui-nav-item"><a href="/jsp/user/userIndex.jsp" target="_blank"> <i class="layui-icon"></i>
                我的主页 </a></li>
            <li class="layui-nav-item layui-this"><a href="/user/set/"> <i class="layui-icon"></i> 基本设置 </a></li>
            <span class="layui-nav-bar" style="top: 32.5px; height: 0px; opacity: 0;"></span>
        </ul>

        <div class="site-tree-mobile layui-hide"><i class="layui-icon"></i></div>
        <div class="site-mobile-shade"></div>

        <%--点击侧边栏后在右边显示的内容--%>
        <div class="fly-panel fly-panel-user" pad20="">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">网站设置</li>
                    <li>用户管理</li>
                    <li>权限分配</li>
                    <li>商品管理</li>
                    <li>订单管理</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">内容不一样是要有，因为你可以监听tab事件（阅读下文档就是了）</div>
                    <div class="layui-tab-item">内容2</div>
                    <div class="layui-tab-item">内容3</div>
                    <div class="layui-tab-item">内容4</div>
                    <div class="layui-tab-item">内容5</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">网站设置</li>
        <li>用户管理</li>
        <li>权限分配</li>
        <li>商品管理</li>
        <li>订单管理</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">内容不一样是要有，因为你可以监听tab事件（阅读下文档就是了）</div>
        <div class="layui-tab-item">内容2</div>
        <div class="layui-tab-item">内容3</div>
        <div class="layui-tab-item">内容4</div>
        <div class="layui-tab-item">内容5</div>
    </div>
</div>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
                ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>
</body>
</html>
