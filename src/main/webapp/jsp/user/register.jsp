<%--
  Created by IntelliJ IDEA.
  User: 越
  Date: 2017/4/8
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <script type="text/javascript">
        var getCode = function () {
            var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
            alert(phoneNumber);
            /*
            * 创建XMLHttpRequest对象
            * 所有现代浏览器（IE7+、Firefox、Chrome、Safari 以及 Opera）均内建 XMLHttpRequest 对象
            * 老版本的 Internet Explorer （IE5 和 IE6）使用 ActiveX 对象
            */
            var xmlHttp;
            if (window.XMLHttpRequest){
                xmlHttp = new XMLHttpRequest();
            }else {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            // 设置异步
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
                    // input=document.getElementsByName("code");
                    // input[0].value="haha";
                    // document.getElementById("code").value = "xixi";
                }
            }
            // 向服务器发送请求：
            xmlHttp.open("GET","/user/sendMessageCode?phoneNumber="+phoneNumber,true);
            xmlHttp.send();
            /*
             * GET方式传参：
             * xmlHttp.open("GET","/jsp/ajaxTest.jsp?author=ayue&gender=man",true);
             * xmlHttp.send();
             *
             * POST方式传参：
             * xmlhttp.open("POST","ajaxTest.jsp.jsp",true);
             * xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
             * xmlhttp.send("author=ayue&gender=man");
             */


        }
    </script>
</head>
<body>
<form method="post" action="/user/register">
    <p>已有账号？<a href="login.jsp">立即登录</a></p>
    <p>手机号：<input type="text" name="phoneNumber"/></p>
    <p>密码：<input type="password" name="password"/></p>
    <p>
        <input type="text" name="code" id="code"/>
        <button type="button" onclick="getCode()">获取短信验证码</button>
    </p>
    <input type="submit" value="立即注册"/>
</form>
</body>
</html>


