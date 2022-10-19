<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html><!--Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型-->
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>代交课题</title>
    <link rel="stylesheet" href="../layui/css/layui.css"
          media="all">
    <script src="../js/jquery1.42.min.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/submit.js"></script>
    <style>
        body {
            padding: 20px; /*overflow-y: scroll;*/
        }
    </style>
</head>
<body>
<jsp:include page="stupub.jsp"></jsp:include>
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-card layui-panel">
                <div class="layui-card-header">课题代交区</div>
                <div class="layui-card-body">

                    <table class="test" id="test" lay-filter="tabletest"></table>
                    </br>
                    </br>
                    <script type="text/html" id="toolbarDemo">
                        <div class="layui-btn-container">
                            <button  class="layui-btn layui-btn-sm" lay-event="worksub">提交作业</button>
                        </div>
                    </script>

                </div>
            </div>
        </div>

    </div>


    <br> <br>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        本网站系统由苏州XXX科技有限公司制作Copyright (C) Suzhou XXX Electronic Co.,LTD。
    </div>
</div>
</body>
<div class="registerPage">
    <div class="registerDiv">
        <input id = "file" type = "file" accept=".txt" value = "选取上交作业">
    </div>
</div>
</html>