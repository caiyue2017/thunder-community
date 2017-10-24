<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页面</title>

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css?v=v3.3.7" media="all">
    <link rel="stylesheet" type="text/css" href="css/font/iconfont.css?v=1.0.0" media="all">
    <link rel="stylesheet" type="text/css" href="css/main.css?v1.3.4" media="all">
    <link href="/jsp/css/mycss/admin2.css" rel="stylesheet">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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

        .layui-table tr th {
            position: relative;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: white">
<div>
    <div class="header">
        <div class="layout">
            <div class="left">
                <div class="links">
                    <a href="/">
                        <div class="logo">
                            <img src="../jsp/img/lt2.jpg">
                        </div>
                        Thunder社区
                    </a>
                </div>
            </div>
            <div class="right">
                <div class="login">
                    <c:if test="${sessionScope.user != null}">
                        <shiro:user>
                            <a href="/jsp/user/userIndex.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                                <img src="../jsp/<c:out value="${sessionScope.user['img']}"/>">
                            </a>
                        </shiro:user>
                    </c:if>
                    <div class="text">
                        <c:if test="${sessionScope.user != null}">
                            <a href="/jsp/user/userIndex.jsp" target="_blank">
                                <c:out value="${sessionScope.user['username']}"/>
                            </a>
                            <shiro:hasRole name="user">
                                <a href="/jsp/user/userIndex.jsp#test=22" target="_blank">
                                    <img src="/jsp/img/icon/shezhi.png" class="iconImg">
                                    设置
                                </a>
                            </shiro:hasRole>
                            <shiro:hasRole name="admin">
                                <a href="/jsp/admin2.jsp" target="_blank">
                                    <img src="/jsp/img/icon/shezhi.png" class="iconImg">
                                    管理员
                                </a>
                            </shiro:hasRole>
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
    <div class="body-container">
        <div class="user-header">
            <div class="user-main">
                <div class="avater">
                    <img src="<c:out value="${sessionScope.user['img']}"/>">
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

                        <%--帖子管理--%>
                        <div class="layui-tab-item layui-show">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="user-container">
                                        <div id="postIndex" class="container-fluid larry-wrapper" style="width: 1290px">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12"
                                                     style="margin-top: -20px;margin-left: -10px;">
                                                    <!--头部搜索-->
                                                    <section class="panel panel-padding" style="margin-bottom: -25px">
                                                        <form class="layui-form">
                                                            <div class="layui-form">
                                                                <div class="layui-inline">
                                                                    <div class="layui-input-inline">
                                                                        <input class="layui-input" name="keyword"
                                                                               placeholder="关键字">
                                                                    </div>
                                                                </div>
                                                                <div class="layui-inline">
                                                                    <button lay-submit class="layui-btn"
                                                                            lay-filter="search">查找
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </section>

                                                    <!--列表-->
                                                    <section class="panel panel-padding"
                                                             style="-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.05);">
                                                        <div class="layui-form">

                                                            <table id="postList" class="layui-table lay-even">
                                                                <tr style=" background-color: #f2f2f2;">
                                                                    <th width="30"><input type="checkbox"
                                                                                          name="checkbox"
                                                                                          lay-skin="primary"
                                                                                          lay-filter="allChoose"></th>
                                                                    <th width="80">序号
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="id" data-asc="true"><i
                                                                                    class="iconfont">&#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="id"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>标题
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>作者
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>发表时间
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th width="80">置顶</th>
                                                                    <th width="80">加精</th>
                                                                    <th width="152">操作</th>
                                                                </tr>
                                                            </table>

                                                        </div>
                                                        <div class="group-button" style="float: left;margin-top: 10px">
                                                            <button class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                                                                <i class="iconfont">&#xe626;</i> 删除
                                                            </button>
                                                            <button class="layui-btn layui-btn-small layui-btn-normal ajax-all"
                                                                    data-name="checkbox"
                                                                    data-params='{"url": "/php/test.php","data":"id=1&name=hao","confirm":"true"}'>
                                                                <i class="iconfont">&#xe60c;</i> 加精
                                                            </button>
                                                            <button class="layui-btn layui-btn-small layui-btn-normal ajax-all"
                                                                    data-name="checkbox"
                                                                    data-params='{"url": "/php/test.php","data":"id=1&name=hao&va=23"}'>
                                                                <i class="iconfont">&#xe603;</i> 置顶
                                                            </button>
                                                            <button class="layui-btn layui-btn-small modal-iframe"
                                                                    data-params='{"content": "article-add.html", "title": "添加文章","full":"true"}'>
                                                                <i class="iconfont">&#xe649;</i> 添加
                                                            </button>
                                                        </div>
                                                        <div class="text-right" id="page"
                                                             style="float: right;margin-right: -13px"></div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="postEdit" class="add-subcat">
                                            <form id="form1" class="layui-form layui-form-pane" action="add-brand">
                                                <div class="layui-form-item" style="margin-top: -30px;">
                                                <span class="layui-breadcrumb">
                                                  <a onclick="returnPost()">帖子管理</a>
                                                  <a><cite>编辑</cite></a>
                                                </span>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">帖子标题</label>
                                                    <div class="layui-input-block">
                                                        <input type="text" name="title" required jq-verify=""
                                                               jq-error="请输入标题|请输入数字" placeholder="请输入标题"
                                                               autocomplete="off" class="layui-input ">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">所属版块</label>
                                                    <div class="layui-input-inline">
                                                        <select name="city" jq-verify="required" jq-error="请输入分类"
                                                                lay-filter="verify">
                                                            <option value=""></option>
                                                            <option value="0">雷霆</option>
                                                            <option value="1">火箭</option>
                                                            <option value="2">勇士</option>
                                                            <option value="3">马刺</option>
                                                            <option value="4">骑士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item ">
                                                    <label class="layui-form-label">作者</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" placeholder="请输入作者" autocomplete="off"
                                                               class="layui-input">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item" pane>
                                                    <label class="layui-form-label">加精</label>
                                                    <div class="layui-input-inline">
                                                        <input type="radio" name="command" title="是" value="1" checked/>
                                                        <input type="radio" name="command" title="否" value="0"/>
                                                    </div>
                                                </div>

                                                <div class="layui-form-item" pane>
                                                    <label class="layui-form-label">置顶</label>
                                                    <div class="layui-input-inline">
                                                        <input type="radio" name="top" title="是" value="1" checked/>
                                                        <input type="radio" name="top" title="否" value="0"/>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item" style="margin-left: -110px">
                                                    <div class="layui-input-block">
                                                        <button class="layui-btn" jq-submit jq-filter="submit">
                                                            立即提交
                                                        </button>
                                                        <button type="reset" class="layui-btn layui-btn-primary"
                                                                style="margin-left: 0px">
                                                            重置
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div id="reviewManager" class="container-fluid larry-wrapper add-subcat"
                                             style="width: 1290px">
                                            <div class="layui-form-item" style="margin-top: -30px;">
                                                <span class="layui-breadcrumb">
                                                  <a onclick="returnPost2()">帖子管理</a>
                                                  <a><cite>评论管理</cite></a>
                                                </span>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12"
                                                     style="margin-top: -20px;margin-left: -10px;">
                                                    <!--头部搜索-->
                                                    <section class="panel panel-padding" style="margin-bottom: -25px">
                                                        <form class="layui-form">
                                                            <div class="layui-form">
                                                                <div class="layui-inline">
                                                                    <div class="layui-input-inline">
                                                                        <input class="layui-input" name="keyword"
                                                                               placeholder="关键字">
                                                                    </div>
                                                                </div>
                                                                <div class="layui-inline">
                                                                    <button lay-submit class="layui-btn"
                                                                            lay-filter="search">查找
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </section>

                                                    <!--列表-->
                                                    <section class="panel panel-padding"
                                                             style="-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.05);">
                                                        <div class="layui-form">

                                                            <table id="reviewList" class="layui-table lay-even">
                                                                <tr style=" background-color: #f2f2f2;">
                                                                    <th width="30"><input type="checkbox"
                                                                                          name="checkbox"
                                                                                          lay-skin="primary"
                                                                                          lay-filter="allChoose"></th>
                                                                    <th width="80">序号
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="id" data-asc="true"><i
                                                                                    class="iconfont">&#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="id"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>内容
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>作者
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>发表时间
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="title" data-asc="true"><i
                                                                                    class="iconfont">
                                                                                &#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="title"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th width="152">操作</th>
                                                                </tr>
                                                            </table>

                                                        </div>
                                                        <div class="group-button" style="float: left;margin-top: 10px">
                                                            <button class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                                                                <i class="iconfont">&#xe626;</i> 删除
                                                            </button>
                                                            <button class="layui-btn layui-btn-small modal-iframe"
                                                                    data-params='{"content": "article-add.html", "title": "添加文章","full":"true"}'>
                                                                <i class="iconfont">&#xe649;</i> 添加
                                                            </button>
                                                        </div>
                                                        <div class="text-right" id="page3"
                                                             style="float: right;margin-right: -13px"></div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--用户管理--%>
                        <div class="layui-tab-item">
                            <div class="subview">
                                <div class="user-home">
                                    <div class="user-container">
                                        <div id="userIndex" class="container-fluid larry-wrapper"
                                             style="width: 1290px">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12"
                                                     style="margin-top: -20px;margin-left: -10px;">
                                                    <!--头部搜索-->
                                                    <section class="panel panel-padding" style="margin-bottom: -25px">
                                                        <form class="layui-form">
                                                            <div class="layui-form">
                                                                <div class="layui-inline">
                                                                    <div class="layui-input-inline">
                                                                        <input class="layui-input" name="keyword"
                                                                               placeholder="关键字">
                                                                    </div>
                                                                </div>
                                                                <div class="layui-inline">
                                                                    <button lay-submit class="layui-btn"
                                                                            lay-filter="search">查找
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </section>

                                                    <!--列表-->
                                                    <section class="panel panel-padding"
                                                             style="-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.05);">
                                                        <div class="layui-form">

                                                            <table id="userList" class="layui-table lay-even">
                                                                <tr style=" background-color: #f2f2f2;">
                                                                    <th width="30"><input type="checkbox"
                                                                                          name="checkbox"
                                                                                          lay-skin="primary"
                                                                                          lay-filter="allChoose"></th>
                                                                    <th width="80">序号
                                                                        <div class="order-box">
                                                                            <a href="javascript:;" class="sort"
                                                                               data-filed="id" data-asc="true"><i
                                                                                    class="iconfont">&#xe615;</i></a>
                                                                            <a href="javascript:;" class="sort down"
                                                                               data-filed="id"><i class="iconfont">
                                                                                &#xe647;</i></a>
                                                                        </div>
                                                                    </th>
                                                                    <th>用户名
                                                                    </th>
                                                                    <th>手机号

                                                                    </th>
                                                                    <th>邮箱

                                                                    </th>
                                                                    <th>注册时间

                                                                    </th>
                                                                    <th width="60">性别</th>
                                                                    <th width="80">状态</th>
                                                                    <th width="152">操作</th>
                                                                </tr>
                                                                <tr>

                                                                </tr>
                                                            </table>

                                                        </div>
                                                        <div class="group-button" style="float: left;margin-top: 10px">
                                                            <button class="layui-btn layui-btn-small layui-btn-danger ajax-all">
                                                                <i class="iconfont">&#xe626;</i> 删除
                                                            </button>
                                                            <button class="layui-btn layui-btn-small layui-btn-normal ajax-all"
                                                                    data-name="checkbox"
                                                                    data-params='{"url": "/php/test.php","data":"id=1&name=hao&checkbox=6,9,0&va=23"}'>
                                                                <i class="layui-icon">&#x1005;</i> 状态
                                                            </button>
                                                            <button class="layui-btn layui-btn-small modal-iframe">
                                                                <i class="iconfont">&#xe649;</i> 添加
                                                            </button>
                                                        </div>
                                                        <div class="text-right" id="page2"
                                                             style="float: right;margin-right: -13px"></div>
                                                    </section>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="userEdit" class="add-subcat">
                                            <form id="form2" class="layui-form layui-form-pane" action="add-brand">
                                                <div class="layui-form-item" style="margin-top: -40px;">
                                                    <span class="layui-breadcrumb">
                                                      <a onclick="returnUser()">用户管理</a>
                                                      <a><cite>编辑</cite></a>
                                                    </span>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">用户名</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="tel" name="name" required
                                                               jq-verify="required"
                                                               jq-error="请输入用户名" placeholder="请输入用户名"
                                                               autocomplete="off" class="layui-input ">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">上传头像</label>
                                                    <div class="layui-input-block">
                                                        <input type="file" name="file" class="layui-upload-file">
                                                        <input type="hidden" name="img" jq-verify="required"
                                                               jq-error="请上传头像" error-id="img-error">
                                                        <p id="img-error2" class="error"></p>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">手机号</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="tel" jq-verify="phone"
                                                               jq-error="手机号码格式不对" placeholder="请输入手机号码"
                                                               autocomplete="off" class="layui-input ">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">邮箱</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="sorts" required jq-verify="email"
                                                               jq-error="邮箱格式不对" placeholder="请输入邮箱"
                                                               autocomplete="off" class="layui-input ">
                                                    </div>
                                                </div>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">性别</label>
                                                    <div class="layui-input-block">
                                                        <input type="radio" name="sex" title="男" value="1" {{#if
                                                               (item.sex=="男" ){ }}checked="checked" {{# }
                                                               alert(item.sex) }}/>
                                                        <input type="radio" name="sex" title="女" value="0" {{#if
                                                               (item.sex=="女" ){ }}checked="checked" {{# } }}/>
                                                        <input type="radio" name="sex" title="保密" value="2" {{#if
                                                               (item.sex=="保密" ){ }}checked="checked" {{# } }}/>
                                                    </div>
                                                </div>

                                                <div class="layui-form-item">
                                                    <label class="layui-form-label">状态</label>
                                                    <div class="layui-input-inline">
                                                        <input type="radio" name="switch" title="启用" value="1" {{#if
                                                               (item.switch==1){ }}checked="checked" {{# } }}/>
                                                        <input type="radio" name="switch" title="禁用" value="0" {{#if
                                                               (item.switch==0){ }}checked="checked" {{# } }}/>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item layui-form-text">
                                                    <label class="layui-form-label">备注</label>
                                                    <div class="layui-input-block">
                                                            <textarea name="desc" placeholder="请输入内容"
                                                                      class="layui-textarea"></textarea>
                                                    </div>
                                                </div>
                                                <div class="layui-form-item" style="margin-left: -110px">
                                                    <div class="layui-input-block">
                                                        <button class="layui-btn" jq-submit jq-filter="submit">
                                                            立即提交
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
                        <%--社区管理--%>
                        <div class="layui-tab-item">关注</div>
                        <%--网站设置--%>
                        <div class="layui-tab-item">收藏</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script>
    var layer = layui.layer;
    /**
     * ajax更新帖子列表
     */
    var pages; // 分页数
    var num = 12; // 每页显示的帖子数
    $(function () {
        getPostList(1, num);
        getUserList(1, num);
    });
    // 异步加载帖子列表
    var getPostList = function (curr, num) {
        // 发送ajax请求
        $.ajax({
            url: "/post/showPosts2",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.pl;
                    pages = postList.length / num;
                    var initValue = (curr - 1) * num;
                    var length = curr * num - 1;
                    var tr;
                    // 移除div
                    $("#postList tr:gt(0)").remove();
                    for (var i = initValue; i <= length; i++) {
                        var post = postList[i];
                        var tr1 = "<tr><td><input type='checkbox' name='checkbox' lay-skin='primary'lay-filter='allChoose'></td><td>" + (i + 1) + "</td><td style='text-align: left;'><a onclick='reviewManager(" + post.id + ")'>" + post.title + "</a></td> <td>" + post.author + "</td> <td>" + post.stringTime + "</td>";
                        var topChecked1 = "<td><input type='checkbox' name='switch' lay-skin='switch'lay-text='已顶|未顶' lay-filter='top' value='" + post.id + "'></td>";
                        var topChecked2 = "<td><input checked='checked' type='checkbox' name='switch' lay-skin='switch'lay-text='已顶|未顶' lay-filter='top' value='" + post.id + "'></td>";
                        var goodChecked1 = "<td><input type='checkbox' name='switch' lay-skin='switch'lay-text='已加|未加' lay-filter='good' value='" + post.id + "'></td>";
                        var goodChecked2 = "<td><input checked='checked' type='checkbox' name='switch' lay-skin='switch'lay-text='已加|未加' lay-filter='good' value='" + post.id + "'></td>";
                        var tr2 = "<td> <button class='layui-btn layui-btn-mini modal-iframe' onclick='editPost()'> <i class='iconfont'>&#xe653;</i>编辑 </button> <button value='" + post.id + "' class='layui-btn layui-btn-mini layui-btn-danger ajax' onclick='deletePost(this)'> <i class='iconfont'>&#xe626;</i>删除 </button></td> </td> </tr>";
                        tr = tr1;
                        if (post.isTop == "true")
                            tr += topChecked2;
                        else
                            tr += topChecked1;
                        if (post.isGood == "true")
                            tr += goodChecked2;
                        else
                            tr += goodChecked1;
                        tr += tr2;
                        $("#postList").append(tr);
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


    // 评论管理
    var pId;
    function reviewManager(postId) {
        //加载层-默认风格
        layer.load();
        //此处演示关闭
        setTimeout(function () {
            layer.closeAll('loading');
            $("#postIndex").css("display", "none");
            $("#reviewManager").addClass("layui-show");
            pId = postId;
            getReviewList(1, num, postId);
        }, 500);
    }
    var returnPost2 = function () {
        $("#reviewManager").removeClass("layui-show");
        $("#postIndex").css("display", "block");
    }
    var deleteReview = function (thisObj) {
        layer.confirm('确认&ensp;<font color="#FF0000">删除</font>&ensp;操作吗', {
            icon: 3
            , btn: ['确定', '取消']
            , time: 0//不自动关闭
            , yes: function (index) {
                layer.close(index);
                //加载层-默认风格
                layer.load();
                //此处演示关闭
                setTimeout(function () {
                    layer.closeAll('loading');
                    var id = $(thisObj).val();
                    var b = subDeleteReview(id);
                    if (b) {
                        layer.msg('更新成功');
                        $(thisObj).parent().parent().remove();
                    } else
                        layer.msg('更新失败');
                }, 500);
            }
        });
    }
    var subDeleteReview = function (id) {
        var b;
        $.ajax({
            url: "/review/deleteReview?id=" + id,
            type: "post",
            data: "",
            dataType: "TEXT",
            async: false,
            success: function (data) {
                if (data == "success") {
                    b = true;
                }
            },
            error: function () {
                b = false;
            }
        });
        return b;
    }


    // 异步加载评论列表
    var getReviewList = function (curr, num, postId) {
        // 发送ajax请求
        $.ajax({
            url: "/review/showReviewsInAdmin?postId=" + postId,
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var reviewList = data.rl;
                    var times = data.times;
                    pages = reviewList.length / num;
                    var initValue = (curr - 1) * num;
                    var length = curr * num - 1;
                    var tr;
                    // 移除div
                    $("#reviewList tr:gt(0)").remove();
                    for (var i = initValue; i <= length; i++) {
                        var review = reviewList[i];
                        var time = times[i];
                        var tr1 = "<tr><td><input type='checkbox' name='checkbox' lay-skin='primary'lay-filter='allChoose'></td><td>" + (i + 1) + "</td><td style='text-align: left;'>" + review.content + "</td> <td>" + review.username + "</td> <td>" + time + "</td>";
                        var tr2 = "<td> <button value='" + review.id + "' class='layui-btn layui-btn-mini layui-btn-danger ajax' onclick='deleteReview(this)'> <i class='iconfont'>&#xe626;</i>删除 </button></td> </td> </tr>";
                        tr = tr1 + tr2;
                        $("#reviewList").append(tr);
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
        laypage({
            cont: 'page3' // 容器。值可以传入元素id或原生DOM或jquery对象
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
                    getReviewList(obj.curr, num, pid);
                }
            }
        });
    });


    var editPost = function () {
        //加载层-默认风格
        layer.load();
        //此处演示关闭
        setTimeout(function () {
            layer.closeAll('loading');
            $("#postIndex").css("display", "none");
            $("#postEdit").addClass("layui-show");
        }, 500);
    }
    var returnPost = function () {
        $("#postEdit").removeClass("layui-show");
        $("#postIndex").css("display", "block");
    }
    var deletePost = function (thisObj) {
        layer.confirm('确认&ensp;<font color="#FF0000">删除</font>&ensp;操作吗', {
            icon: 3
            , btn: ['确定', '取消']
            , time: 0//不自动关闭
            , yes: function (index) {
                layer.close(index);
                //加载层-默认风格
                layer.load();
                //此处演示关闭
                setTimeout(function () {
                    layer.closeAll('loading');
                    var id = $(thisObj).val();
                    var b = subDeletePost(id);
                    if (b) {
                        layer.msg('更新成功');
                        $(thisObj).parent().parent().remove();
                    } else
                        layer.msg('更新失败');
                }, 500);
            }
        });
    }
    var subDeletePost = function (id) {
        var b;
        $.ajax({
            url: "/post/deletePost?id=" + id,
            type: "post",
            data: "",
            dataType: "TEXT",
            async: false,
            success: function (data) {
                if (data == "success") {
                    b = true;
                }
            },
            error: function () {
                b = false;
            }
        });
        return b;
    }

    // 异步加载用户列表
    var getUserList = function (curr, num) {
        // 发送ajax请求
        $.ajax({
            url: "/user/showUser",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var userList = data.ul;
                    var times = data.times;
                    pages = userList.length / num;
                    var initValue = (curr - 1) * num;
                    var length = curr * num - 1;
                    var tr;
                    // 移除div
                    $("#userList tr:gt(0)").remove();
                    for (var i = initValue; i <= length; i++) {
                        var user = userList[i];
                        var tr1 = "<tr><td><input type='checkbox' name='checkbox' lay-skin='primary'lay-filter='allChoose'></td><td>" + (i + 1) + "</td><td>" + user.username + "</td> <td>" + user.phone + "</td> <td>" + user.email + "</td><td>" + times[i] + "</td><td>" + user.sex + "</td>";
                        var state1 = "<td><input type='checkbox' name='switch' lay-skin='switch'lay-text='启用|禁用' lay-filter='state' value='" + user.id + "'></td>";
                        var state2 = "<td><input checked='checked' type='checkbox' name='switch' lay-skin='switch'lay-text='启用|禁用 ' lay-filter='state' value='" + user.id + "'></td>";
                        var tr2 = "<td> <button class='layui-btn layui-btn-mini modal-iframe' onclick='editUser()'> <i class='iconfont'>&#xe653;</i>编辑 </button> <button value='" + user.id + "' class='layui-btn layui-btn-mini layui-btn-danger ajax' onclick='deleteUser(this)'> <i class='iconfont'>&#xe626;</i>删除 </button></td> </td> </tr>";
                        tr = tr1;
                        if (user.state == "true")
                            tr += state2;
                        else
                            tr += state1;
                        tr += tr2;
                        $("#userList").append(tr);
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
        laypage({
            cont: 'page2' // 容器。值可以传入元素id或原生DOM或jquery对象
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
                    getUserList(obj.curr, num);
                }
            }
        });
    });

    var editUser = function () {
        //加载层-默认风格
        layer.load();
        //此处演示关闭
        setTimeout(function () {
            layer.closeAll('loading');
            $("#userIndex").css("display", "none");
            $("#userEdit").addClass("layui-show");
        }, 500);
    }
    var returnUser = function () {
        $("#userEdit").removeClass("layui-show");
        $("#userIndex").css("display", "block");
    }

    var deleteUser = function (thisObj) {
        layer.confirm('确认&ensp;<font color="#FF0000">删除</font>&ensp;操作吗', {
            icon: 3
            , btn: ['确定', '取消']
            , time: 0//不自动关闭
            , yes: function (index) {
                layer.close(index);
                //加载层-默认风格
                layer.load();
                //此处演示关闭
                setTimeout(function () {
                    layer.closeAll('loading');
                    var id = $(thisObj).val();
                    var b = subDeletePost(id);
                    if (b) {
                        layer.msg('更新成功');
                        $(thisObj).parent().parent().remove();
                    } else
                        layer.msg('更新失败');
                }, 500);
            }
        });
    }
    var subDeleteUser = function (id) {
        var b;
        $.ajax({
            url: "/user/deleteUser?id=" + id,
            type: "post",
            data: "",
            dataType: "TEXT",
            async: false,
            success: function (data) {
                if (data == "success") {
                    b = true;
                }
            },
            error: function () {
                b = false;
            }
        });
        return b;
    }

    /**
     * 全选,监听指定开关,
     */
    layui.use('form', function () {
        var $ = layui.jquery, form = layui.form();
        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[name="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });
        //监听置顶开关
        form.on('switch(top)', function (data) {
//            alert(this.checked);
//            alert(data.value);
            $.ajax({
                url: "/post/setTop?check=" + this.checked + "&id=" + data.value,
                type: "post",
                data: "",
                dataType: "TEXT",
                async: false,
                success: function (data) {
                    if (data == "success") {
                        //加载层-默认风格
                        layer.load();
                        //此处演示关闭
                        setTimeout(function () {
                            layer.closeAll('loading');
                            layer.msg('更新成功');
                        }, 500);
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                }
            });
        });
        //监听加精开关
        form.on('switch(good)', function (data) {
            $.ajax({
                url: "/post/setGood?check=" + this.checked + "&id=" + data.value,
                type: "post",
                data: "",
                dataType: "TEXT",
                async: false,
                success: function (data) {
                    if (data == "success") {
                        //加载层-默认风格
                        layer.load();
                        //此处演示关闭
                        setTimeout(function () {
                            layer.closeAll('loading');
                            layer.msg('更新成功');
                        }, 500);
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                }
            });
        });
        //监听加精开关
        form.on('switch(state)', function (data) {
            $.ajax({
                url: "/user/setState?state=" + this.checked + "&id=" + data.value,
                type: "post",
                data: "",
                dataType: "TEXT",
                async: false,
                success: function (data) {
                    if (data == "success") {
                        //加载层-默认风格
                        layer.load();
                        //此处演示关闭
                        setTimeout(function () {
                            layer.closeAll('loading');
                            layer.msg('更新成功');
                        }, 500);
                    }
                },
                error: function () {
                    layer.msg('更新失败');
                }
            });
        });
    });

    /**
     * TAB分页
     */
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

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

    });
</script>
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
