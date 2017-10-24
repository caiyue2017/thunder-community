<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>编辑器</title>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<form id="form1" name="form1" method="post" action="/post/sendPost">
    <table width="650" height="400" border="0" align="center">
        <tr>
            <td valign="top">标题:</td>
            <td>
                <input type="text" name="title" />
            </td>
        </tr>
        <tr>
            <td valign="top">内容:</td>
            <td>
		        <textarea cols="80" id="body" name="content">
		        </textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="button" name="btn" value="测试"/>
                <input type="submit" name="submit" value="提交"/>
                <input type="reset" name="reset" value="重置" /></td>
        </tr>
    </table>
</form>
<script type="text/javascript">
//    CKEDITOR.replace( 'content' );
    CKEDITOR.replace( 'body', {
        filebrowserImageUploadUrl: '/post/imageUpload',
        image_previewText: ' ',
        height:"500"
    });
</script>
</body>
</html>