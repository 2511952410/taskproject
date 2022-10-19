<%--
  Created by IntelliJ IDEA.
  User: 16772
  Date: 2022/5/9
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>UpLoad Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery1.42.min.js"></script>
    <script src="layui/layui.js"></script>
<style>
    #file{
        width: 200px;
        height: 42px;
        border: 4px solid #76b6e4;
        position: relative;
        left: 30px;
    }
    #fileSize{
        width: 200px;
        height: 42px;
        border: 4px solid #76b6e4;
        position: relative;
        left: 30px;
    }
    #fid{
        width: 200px;
        height: 42px;
        border: 4px solid #76b6e4;
        position: relative;
        left: 30px;
    }
</style>
</head>
<body>
<div class="container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>作业上传</legend>
    </fieldset>
    <p style="color: red" th:text="${uploadFileError}"></p>
    <form action="/file/upLoad" enctype="multipart/form-data" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label"> 作业名称：</label>
            <div class="layui-input-inline">
<input type="file" id="file" name="file" class="layui-input " >

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">  文件大小：</label>
            <div class="layui-input-inline">
      <input type="text" id="fileSize" name="filesize" readonly class=" layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">  文件类型：</label>
            <div class="layui-input-inline">
               <select name="fid"  id="fid" class="form-control layui-input" ></select>
            </div>
        </div>
        <button  type="submit"  style="width: 100px" class=" layui-btn layui-btn-normal layui-anim-scale" value="上传">上传</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    $(function () {
        var html = "";
        //发送ajax请求查询文件类型下拉列表
        $.ajax({
            url: '/file/getFileType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            success: function (result) {

                //循环遍历
                for (var i = 0; i < result.length; i++) {
                    html +="<option value='"+result[i].id+"'>"+result[i].name+"</option>"
                }

                //将html追加到下拉列表中
                $("[name='fid']").append(html);

            },
            error: function () {
                console.log('Send Request Fail..'); // 请求失败时的回调函数
            }
        });
        //获取文件大小
        $('#file').on('change', function() {
            var size = $('#file')[0].files[0].size;
            size = size / 1024;
            size = size / 1024;
            //parseFloat(size).toFixed(2)保留小数点后两位
            $('#fileSize').val(parseFloat(size).toFixed(2) + "M");
        });
    });
</script>
</body>
</html>
