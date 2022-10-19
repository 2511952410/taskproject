<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/17
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery1.42.min.js"></script>
    <script src="layui/layui.js"></script>
    <script src="js/index.js"></script>

    <title>Title</title>
    <style>

        .registerPage {
            width: 100%;
            height: 100%;

            display: none;
            opacity: 0.75;
        }



    </style>
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test" style="font-size: 12px">

</table>

<script type="text/html" id="toolbarDemo">

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>作业上传列表</legend>
    </fieldset>
    <!--<div class="demoTable">-->
    <div class="layui-btn-container">
        <button type="button" class="layui-btn layui-btn-sm" style="background-color: #FFB800" lay-event="add">
            <i class="layui-icon">&#xe654;</i>
        </button>
        <button class="layui-btn layui-btn-sm" style="background-color: #5FB878" lay-event="getCheckData">获取选中行数据
        </button>
        <button class="layui-btn layui-btn-sm" style="background-color: #1E9FFF" lay-event="getCheckLength">获取选中数目
        </button>
        <button class="layui-btn layui-btn-sm" style="background-color: #FF5722 " lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" style="background-color: #2F4056" lay-event="sx">
            <i class="layui-icon">&#xe669;</i>
        </button>

    </div>
</script>

<script type="text/html" id="barDemo">


    <button type="button" class="layui-btn layui-btn-sm" style="background-color: #01AAED" lay-event="dowen"><i
            class="layui-icon">&#xe67d</i></button>
    <button type="button" class="layui-btn layui-btn-sm" style="background-color: #FF5722" lay-event="del"><i
            class="layui-icon"></i></button>
</script>


<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>


    layui.use(['jquery', 'table', 'layer', 'form', 'tree'], function () {



        var table = layui.table;
        var form = layui.form;
        var count = 100;
        var layer = layui.layer;
        tree = layui.tree;
        var $ = layui.$;

        var $ = layui.jquery;

        page();

        function page() {
            $.ajax({
                url: 'http://localhost:8080/file/getCount',
                dataType: 'json',
                type: 'get',
                async: false,
                success: function (data) {
                    console.log(data.count)
                    count = data.count;
                }
            });
        }

        var tableIns = table.render({
            elem: '#test'
            ,data: [{
                "tusername":"<%=session.getAttribute("username")%>"
                ,"tname": "<%=session.getAttribute("name")%>"
            }]
          , url: 'http://localhost:8080/file/getFile' //改地址是访问地址

            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , type: 'POST'
            , id: 'test'
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'

            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: '作业编号', width: 150, sort: true}
                , {field: 'pathName', title: '作业文件', width: 150, height:200, sort: true
                   , templet:function (d) {
                        return "<img src='upload/" + d.realName + "' width='100px' height='120px' >"}}
                , {field: 'realName', title: '作业名称', width: 150, sort: true}

                , {field: 'fileSize', title: '文件大小', width: 150, sort: true}
                , {field: 'uploadTime', title: '上传日期', width: 180, sort: true}
                // , {field:  'tusername', title: '教职工号', width: 150, sort: true}
                // , {field:  'tname', title: '上传老师姓名', width: 150, sort: true}
                , {field: 'right', title: '操作', width: 150, toolbar: '#barDemo'}

            ]]

            , page: true
            , limit: 5
            , limits: [1,5, 110, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]  //数据分页条
            , response: {
                statusName: 'status' //规定数据状态的字段名称，默认：code
                , dataName: 'rows' //规定数据列表的字段名称，默认：data
            }
            , parseData: function (item) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "status": 0,   //解析接口状态
                    "message": "成功",  //解析提示文本
                    "count": count,       //解析数据长度
                    "rows": item.data  //解析数据列表
                };
            }

        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;

                case'sx':
                    location.reload();
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                case 'add':
                    layer.open({
                        type:2,
                        title:'上传作业',
                        area:['500px','400px'],
                     btn: ['主界面', '取消']   ,
                       content: 'add.jsp' ,
                        closeBtn:0,
                      moveType: 1 ,//拖拽模式，0或者1

                        success: function (layero) {
                            var btn = layero.find('.layui-layer-btn');
                            btn.find('.layui-layer-btn0').attr({
                                href: 'http://localhost:8080/add.jsp'
                                , target: '_blank'
                            });
                        }
                    })
            };
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;

            var event = obj.event;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "http://localhost:8080/file/delete",
                        type: "POST",
                        dataType: "json",
                        data: {
                            id: data.id

                        },
                        success: function () {
                            alert("删除成功!");
                            location.reload(true);
                        },
                        error: function () {
                            alert("删除成功!");
                            location.reload(true);
                        }


                    })
                    layer.close(index);
                });
            }
            if (obj.event === 'dowen') {
                url = "http://localhost:8080/file/downLoad?filename=" + data.realName + "" ;
                window.location.href = url;
                setTimeout(function () {
                }, 10000)

            }
        });
    });

</script>
</body>
</html>

