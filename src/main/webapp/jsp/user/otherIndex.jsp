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
    <title>他人主页</title>
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
            border-radius: 30px;
            border: 1px solid #d9d9d9;
            vertical-align: middle;
        }
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
                    <c:if test="${requestScope.other != null}">
                        <a href="/jsp/user/center.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                            <img src="/jsp/<c:out value="${requestScope.other['img']}"/>">
                        </a>
                    </c:if>
                    <div class="text">
                        <c:if test="${requestScope.other != null}">
                            <a href="/jsp/user/center.jsp" target="_blank">
                                <c:out value="${requestScope.other['username']}"/>
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
                        <c:if test="${requestScope.other == null}">
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
                <a href="#" class="visit">今日访客：0</a>
                <div class="avater">
                    <img src="/jsp/<c:out value="${requestScope.other['img']}"/>">
                </div>
                <div class="name"><c:out
                        value="${requestScope.other['username']}"/></div>
                <div class="desc"><c:out
                        value="${requestScope.other['text']}"/></div>
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
                                                    <a href="#" class="active">全部</a>
                                                </li>
                                                <li>
                                                    <a href="#" style="padding-right: 0">发表的帖子</a>
                                                    <span id="sendPostNum">(0)</span>
                                                </li>
                                                <li>
                                                    <a href="#" style="padding-right: 0">回复的帖子</a>
                                                    <span id="reviewPostNum">(1)</span>
                                                </li>
                                            </ul>
                                            <div class="timeline">
                                                <ul>
                                                    <li>
                                                        <div class="avatar">
                                                            <img src="/jsp/<c:out value="${requestScope.other['img']}"/>">
                                                        </div>
                                                        <div class="post">
                                                            <div class="title">
                                                                <span class="light">在帖子</span>
                                                                <a href="#" target="_blank">威少表态愿留雷霆</a>
                                                                <span class="light">中回复</span>
                                                            </div>
                                                            <div class="summary">额，感觉留下的话，在鹅城一生夺冠无望。。。</div>
                                                            <div class="extra">
                                                                <ul></ul>
                                                            </div>
                                                            <div class="info">
                                                                <span class="light">2017-05-01 14:42:52&ensp;|&ensp;赞</span>
                                                                <span class="light">(0)</span>
                                                            </div>
                                                            <a href="/" class="sq-link">雷霆</a>
                                                        </div>
                                                    </li>
                                                </ul>
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
                                            <%--<form class="layui-form layui-form-pane" action="">
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">长输入框</label>
                                                    <div class="layui-input-block">
                                                        <input type="text" name="title" autocomplete="off"
                                                               placeholder="请输入标题" class="layui-input">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">短输入框</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="username" lay-verify="required"
                                                               placeholder="请输入" autocomplete="off" class="layui-input">
                                                    </div>
                                                </div>

                                                <div class="layui-form-item">
                                                    <div class="layui-inline">
                                                        <label class="layui-form-label">日期选择</label>
                                                        <div class="layui-input-block">
                                                            <input type="text" name="date" id="date" autocomplete="off"
                                                                   class="layui-input"
                                                                   onclick="layui.laydate({elem: this})">
                                                        </div>
                                                    </div>
                                                    <div class="layui-inline">
                                                        <label class="layui-form-label">行内表单</label>
                                                        <div class="layui-input-inline">
                                                            <input type="number" name="number" autocomplete="off"
                                                                   class="layui-input">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">密码</label>
                                                    <div class="layui-input-inline">
                                                        <input type="password" name="password" placeholder="请输入密码"
                                                               autocomplete="off" class="layui-input">
                                                    </div>
                                                    <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
                                                </div>

                                                <div class="layui-form-item">
                                                    <div class="layui-inline">
                                                        <label class="layui-form-label">范围</label>
                                                        <div class="layui-input-inline" style="width: 100px;">
                                                            <input type="text" name="price_min" placeholder="￥"
                                                                   autocomplete="off" class="layui-input">
                                                        </div>
                                                        <div class="layui-form-mid">-</div>
                                                        <div class="layui-input-inline" style="width: 100px;">
                                                            <input type="text" name="price_max" placeholder="￥"
                                                                   autocomplete="off" class="layui-input">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">单行选择框</label>
                                                    <div class="layui-input-block">
                                                        <select name="interest" lay-filter="aihao">
                                                            <option value=""></option>
                                                            <option value="0">写作</option>
                                                            <option value="1" selected="">阅读</option>
                                                            <option value="2">游戏</option>
                                                            <option value="3">音乐</option>
                                                            <option value="4">旅行</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">行内选择框</label>
                                                    <div class="layui-input-inline">
                                                        <select name="quiz1">
                                                            <option value="">请选择省</option>
                                                            <option value="浙江" selected="">浙江省</option>
                                                            <option value="你的工号">江西省</option>
                                                            <option value="你最喜欢的老师">福建省</option>
                                                        </select>
                                                    </div>
                                                    <div class="layui-input-inline">
                                                        <select name="quiz2">
                                                            <option value="">请选择市</option>
                                                            <option value="杭州">杭州</option>
                                                            <option value="宁波" disabled="">宁波</option>
                                                            <option value="温州">温州</option>
                                                            <option value="温州">台州</option>
                                                            <option value="温州">绍兴</option>
                                                        </select>
                                                    </div>
                                                    <div class="layui-input-inline">
                                                        <select name="quiz3">
                                                            <option value="">请选择县/区</option>
                                                            <option value="西湖区">西湖区</option>
                                                            <option value="余杭区">余杭区</option>
                                                            <option value="拱墅区">临安市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item" pane="">
                                                    <label class="layui-form-label">开关-开</label>
                                                    <div class="layui-input-block">
                                                        <input type="checkbox" checked="" name="open" lay-skin="switch"
                                                               lay-filter="switchTest" title="开关">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item" pane="">
                                                    <label class="layui-form-label">单选框</label>
                                                    <div class="layui-input-block">
                                                        <input type="radio" name="sex" value="男" title="男" checked="">
                                                        <input type="radio" name="sex" value="女" title="女">
                                                        <input type="radio" name="sex" value="禁" title="禁用" disabled="">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item layui-form-text">
                                                    <label class="layui-form-label">文本域</label>
                                                    <div class="layui-input-block">
                                                        <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交
                                                    </button>
                                                </div>
                                            </form>--%>
                                            <div class="base">
                                                <div class="top">
                                                    <h3 class="title">基本资料</h3>
                                                    <a href="#" class="edit-btn">编辑</a>
                                                </div>
                                                <div>
                                                    头像：<img src="/jsp/<c:out value="${requestScope.other['img']}"/>"
                                                            class="avatar">
                                                    <br>
                                                    用户名：<c:out value="${requestScope.other['username']}"/>
                                                    <br>
                                                    性别：-
                                                    <br>
                                                    生日：-
                                                    <br>
                                                    所在地：-
                                                    <br>
                                                    情感状态：-
                                                    <br>
                                                    QQ：-
                                                    <br>
                                                    Email：-
                                                    <br>
                                                    自我介绍：-
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
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
