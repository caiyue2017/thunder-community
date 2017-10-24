<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
    <link href="/jsp/css/pgwslider.min.css" rel="stylesheet">
    <link href="/jsp/css/mycss/index.css" rel="stylesheet">
    <script src="/jsp/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
    <script src="/jsp/js/pgwslider.min.js"></script>
    <style type="text/css">
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
            width: 1060px;
            /* margin: 30px auto 0; */
            padding-left: 100px;
            margin-top: 30px;
        }

        .edge {
            position: absolute;
            top: 110px;
            right: 80px;
            width: 260px;
        }

        .leifeng-rank {
            padding-bottom: 30px;
        }
    </style>
</head>
<body>
<div id="forum">
    <div class="header">
        <div class="layout">
            <div class="left">
                <div class="links">
                    <a href="/">
                        <div class="logo">
                            <img src="img/lt2.jpg">
                        </div>
                        Thunder社区
                    </a>
                </div>
            </div>
            <div class="right">
                <div class="login">
                    <c:if test="${sessionScope.user != null}">
                        <shiro:hasRole name="user">
                            <a href="/jsp/user/userIndex.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                                <img src="../jsp/<c:out value="${sessionScope.user['img']}"/>">
                            </a>
                        </shiro:hasRole>
                        <shiro:hasRole name="admin">
                            <a href="/jsp/admin2.jsp" class="userImage" id="userImage" style="margin-top:-4px;">
                                <img src="../jsp/<c:out value="${sessionScope.user['img']}"/>">
                            </a>
                        </shiro:hasRole>
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
        <div class="title">
            <%--<div class="img">
                <img src="jsp/img/leiting.jpg">
            </div>--%>
            <div class="m">

                <ul class="pgwSlider" style="height: 400px;">

                    <li style="margin-bottom: 0px;">
                        <a href="/post/showPost?id=21" target="_blank">
                            <img src="img/post6.jpg" alt="雷迷心声•关于雷霆下赛季补强的一些个人看法">
                        </a>
                    </li>

                    <li style="margin-bottom: 0px;">
                        <a href="/post/showPost?id=14" target="_blank">
                            <img src="img/post2.jpg" alt="罗伯森合同即将到期 该不该倾力留人？">
                        </a>
                    </li>

                    <li style="margin-bottom: 0px;">
                        <a href="/post/showPost?id=22" target="_blank">
                            <img src="img/post4.jpg" alt="哪也不去！韦少表忠：俄城是我家 永远为家人战斗">
                        </a>
                    </li>

                </ul>

            </div>
            <div class="description">

            </div>

            <div class="topic">
                <div class="topicsTop" style="margin-bottom: -30px;">
                    <input type="text" name="search" id="search" placeholder="请输入搜索内容"/>
                    <a href="#" target="_blank" id="searchBtn" style="float: none">
                        <button class="layui-btn layui-btn-danger">搜索</button>
                    </a>
                    <script>
                        $("#searchBtn").click(function () {
                            var value = $("#search").val();
                            $("#searchBtn").attr("href", "/post/searchPosts?word=" + value);
                        });
                    </script>
                    <a href="/jsp/post/sendPost2.jsp" target="_blank">
                        <button class="layui-btn layui-btn-warm myBtn">发新帖</button>
                    </a>
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
                                        <img src="img/xiajian.png">
                                    </div>
                                    <ul id="ul">
                                        <li><a href="javascript:;" onclick="">一天</a></li>
                                        <li><a href="javascript:;" onclick="">三天</a></li>
                                        <li><a onclick="week()" style="cursor: pointer;">一周</a></li>
                                        <li><a href="javascript:;" onclick="">一个月</a></li>
                                        <li><a href="javascript:;" onclick="">三个月</a></li>
                                    </ul>
                                </div>
                                <div class="select filter">
                                    <div class="text" id="defaultSort">
                                        默认排序
                                        <img src="img/xiajian.png">
                                    </div>
                                    <ul id="ul1">
                                        <li><a href="javascript:;" onclick="">回帖时间</a></li>
                                        <li><a href="javascript:;" onclick="">发帖时间</a></li>
                                        <li><a href="javascript:;" onclick="">帖子热度</a></li>
                                    </ul>
                                </div>
                                <div class="check filter" id="essence">
                                    <a onclick="good()" target="_self" style="cursor: pointer">精华</a>
                                </div>
                                <%--<div class="check filter" id="activity">--%>
                                <%--<a href="javascript:;" onclick="" target="_self">活动</a>--%>
                                <%--</div>--%>
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
                    <div class="right" id="page"/>
                </div>
            </div>
        </div>
    </div>
    <div class="edge">
        <div class="fly-panel leifeng-rank" style="height: 200px">
            <h3 class="fly-panel-title"><span>社区介绍</span></h3>
            <div class="logo">
                <img src="img/lt2.jpg">
            </div>
            <div class="cText">
                <div class="cTop">
                    <h2>雷霆</h2>
                </div>
                <div class="cData">
                    <p>成员：1866695&ensp;</p>
                    <p>帖子：32325&ensp;</p>
                    <p>今日：85</p>
                </div>
                <div class="csText">
                    社区介绍：<br>
                    威少这么屌的，下水道里还有三个！
                </div>
            </div>
        </div>

        <div class="fly-panel leifeng-rank">
            <h3 class="fly-panel-title"><span>近一月发帖榜 - TOP 9</span></h3>
            <dl>
                <dd>
                    <a href="/u/3630144">
                        <img src="/jsp/img/user/user4.jpg">
                        <cite>地精</cite>
                        <i>35次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/3630144">
                        <img src="//cdn.layui.com/avatar/3630144.jpg?t=1492306173290">
                        <cite>wawa</cite>
                        <i>33次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/4414872">
                        <img src="/jsp/img/user/user5.jpg">
                        <cite>零散</cite>
                        <i>33次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/4414872">
                        <img src="/jsp/img/user/user3.jpg">
                        <cite>落叶</cite>
                        <i>33次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/4425624">
                        <img src="//tva1.sinaimg.cn/crop.0.0.180.180.180/67c6ad44jw1e8qgp5bmzyj2050050aa8.jpg">
                        <cite>厮called肆</cite>
                        <i>25次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/4425624">
                        <img src="/jsp/img/user/user7.jpg">
                        <cite>厮called肆</cite>
                        <i>22次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/3630144">
                        <img src="/jsp/img/user/user8.jpg">
                        <cite>我很纯</cite>
                        <i>17次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/3630144">
                        <img src="/jsp/img/user/user9.jpg">
                        <cite>威哥</cite>
                        <i>15次发帖</i>
                    </a>
                </dd>
                <dd>
                    <a href="/u/3630144">
                        <img src="/jsp/img/user/user13.jpg">
                        <cite>水怪</cite>
                        <i>8次发帖</i>
                    </a>
                </dd>
            </dl>
        </div>
        <dl class="fly-panel fly-list-one">
            <dt class="fly-panel-title">评论亮了</dt>
            <dd><i class="red" style="background-color: #ed4f4f">1</i><a href="/jie/9969.html">说句实话，韦少的打法，谁来都是渣</a>
                <span><i class="iconfont"></i> 410</span></dd>
            <dd><i class="red" style="background-color: #ed4f4f">2</i><a href="/jie/9878.html">牙套哥快拜拜了</a> <span><i
                    class="iconfont"></i> 318</span></dd>
            <dd><i class="red" style="background-color: #ed4f4f">3</i><a href="/jie/9879.html">说句实话，韦少的打法，谁来都是渣</a>
                <span><i class="iconfont"></i> 255</span></dd>
            <dd><i class="red">4</i><a href="/jie/9871.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 232</span>
            </dd>
            <dd><i class="red">5</i><a href="/jie/9947.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 222</span>
            </dd>
            <dd><i class="red">6</i><a href="/jie/10005.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 213</span>
            </dd>
            <dd><i class="red">7</i><a href="/jie/9963.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 207</span>
            </dd>
            <dd><i class="red">8</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            <dd><i class="red">9</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            <dd><i class="red">10</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            </dd>
        </dl>
        <dl class="fly-panel fly-list-one">
            <dt class="fly-panel-title">最新回复</dt>
            <dd><i class="red">1</i><a href="/jie/9969.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 410</span>
            </dd>
            <dd><i class="red">2</i><a href="/jie/9878.html">牙套哥快拜拜了</a> <span><i class="iconfont"></i> 318</span>
            </dd>
            <dd><i class="red">3</i><a href="/jie/9879.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 255</span>
            </dd>
            <dd><i class="red">4</i><a href="/jie/9871.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 232</span>
            </dd>
            <dd><i class="red">5</i><a href="/jie/9947.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 222</span>
            </dd>
            <dd><i class="red">6</i><a href="/jie/10005.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 213</span>
            </dd>
            <dd><i class="red">7</i><a href="/jie/9963.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 207</span>
            </dd>
            <dd><i class="red">8</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            <dd><i class="red">9</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            <dd><i class="red">10</i><a href="/jie/9936.html">说句实话，韦少的打法，谁来都是渣</a> <span><i
                    class="iconfont"></i> 186</span>
            </dd>
        </dl>
    </div>
</div>
</body>
<script type="text/javascript">
    var pages; // 分页数
    var num = 20; // 每页显示的帖子数
    $(function () {
        getPostList(1, num);
    });

    // 异步加载帖子列表
    var getPostList = function (curr, num) {
        // 发送ajax请求
        $.ajax({
            url: "/post/ajaxSearchPosts",
            type: "post",
            data: "",
            dataType: "json",// 预期服务器返回的数据类型。
            async: false, // 设置为同步，避免pages的获取一直为undefined
            success: function (data) { //请求成功后的回调函数，data：由服务器返回的数据
                if (data) {
                    var postList = data.ps;
                    var times = data.ts; // (index,list)
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
                        var good = "<img src='http://bbs.iqianjin.com/static/image/common/digest_1.gif'>";
                        var good2 = "<img src='http://bbs.iqianjin.com/static/image/common/digest_1.gif' style='margin-left: 10px'>";
                        var top = "<img src='http://bbs.iqianjin.com/static/image/common/pin_1.gif''>";
                        var div2 = "<a target='_blank' href='/post/showPost?id=" + post.id + "'><%--图标--%><%--标题--%><span>" + post.title + "</span></a> </div> <div class='td td-author'><%--作者--%><a target='_blank' href='#'class='main'>" + post.author + "</a><%--时间--%> <span class='sub'>" + t + "前</span></div> <div class='td td-count'> <span class='main'>7</span> <span class='sub'>79</span> </div> <div class='td td-last'> <a class='main' target='_blank' href='#'>混蛋</a> <span class='sub'>56分钟前</span> </div> </div>";
                        div = div1;
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
<script type="text/javascript">

    $(document).ready(function () {

        $(document).ready(function () {

            $('.pgwSlider').pgwSlider();

        });

    });

</script>
</html>
