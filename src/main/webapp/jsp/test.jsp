<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/jsp/layui/css/layui.css" media="all">
</head>
<body>

<div class="site-demo-upload">
    <img id="LAY_demo_upload" src="/jsp/img/user/user8.jpg">
    <div class="site-demo-upbar">
        <input type="file" name="file" class="layui-upload-file" id="test">
    </div>
</div>
<script src="/jsp/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('upload', function(){
        layui.upload({
            url: '/post/imageUploadInBase'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,success: function(res){
                alert(res.url);
                LAY_demo_upload.src = res.url;
            }
        });
    });
</script>

</body>
</html>