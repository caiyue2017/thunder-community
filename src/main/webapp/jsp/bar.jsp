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
    <title>导航栏</title>
    <script type="text/javascript" src="/jsp/js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" type="text/css" href="bar.css" />
</head>
<body>
<%--导航栏--%>
<div class="main">
    <div class="bar">
        <div class="tr">
            <div class="td td-title filters">
                <div class="select filter">
                    <div class="text" id="allTime">
                        全部时间
                    </div>
                    <ul id="ul">
                        <li><a href="javascript:;" onclick="">一天</a></li>
                        <li><a href="javascript:;" onclick="">三天</a></li>
                        <li><a href="javascript:;" onclick="">一周</a></li>
                        <li><a href="javascript:;" onclick="">一个月</a></li>
                        <li><a href="javascript:;" onclick="">三个月</a></li>
                    </ul>
                </div>
                <div class="select filter">
                    <div class="text" id="defaultSort">
                        默认排序
                    </div>
                    <ul id="ul1">
                        <li><a href="javascript:;" onclick="">回帖时间</a></li>
                        <li><a href="javascript:;" onclick="">发帖时间</a></li>
                        <li><a href="javascript:;" onclick="">帖子热度</a></li>
                    </ul>
                </div>
                <div class="check filter" id="essence">
                    <a href="javascript:;" onclick="" target="_self">精华</a>
                </div>
                <div class="check filter" id="activity">
                    <a href="javascript:;" onclick="" target="_self">活动</a>
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
</div>
</body>
<script type="text/javascript">
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
