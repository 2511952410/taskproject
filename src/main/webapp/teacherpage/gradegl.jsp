<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/9
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班级管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery1.42.min.js"></script>
    <script src="../layui/layui.js"></script>

    <style>
        .layui-form-label {
            width: 100px;
        }

        .layui-input-block {
            margin-left: 130px;
            min-height: 36px
        }

        .demoTable {

            position: relative;
            padding-left: 50px;
            left: 650px;
            top: 0px;

        }

        .registerPage {
            width: 100%;
            height: 100%;

            display: none;
            opacity: 0.75;
        }

        .registerDiv {
            width: 100%;
            height: 100%;
            z-index: 9999;
            opacity: 0.75;
        }
        #update-user-layer{
            margin: 0 auto;
            position: relative;
            top: 0px;
        }
    </style>
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test" style="font-size: 12px"></table>

<script type="text/html" id="toolbarDemo">

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


    <button type="button" class="layui-btn layui-btn-sm" style="background-color: #FF5722" lay-event="del"><i
            class="layui-icon"></i></button>
</script>


<script src="../layui/layui.js" charset="utf-8"></script>
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
                url: 'http://localhost:8080/getGradeCount',
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
            , url: 'http://localhost:8080/getGrade' //改地址是访问地址
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , id: 'test'
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'

            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'grade', title: '年级', width: 150, sort: true}


                , {field: 'right', title: '操作', width: 90, toolbar: '#barDemo'}

            ]]
            , page: true
            , limit: 5
            , limits: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]  //数据分页条
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
                        type:'1',
                        content:$('.registerPage'),
                        title:'添加年级',
                        area:['400px','200px'],
                        btn:['添加年级','重置','取消'],
                        closeBtn:0,
                        btn1:function (index,layero) {
                            //注册回调
                            layer.close(index);
                            var registerUsername = $('#registerUsername').val();

                            if(registerUsername == ""){
                                alert("必填信息不能为空,添加失败！");
                                $('.registerPage').hide();
                                return;
                            }
                            var registerLoadIndex = layer.load(2);
                            $.ajax({
                                type:'post',
                                url:'http://localhost:8080/addgrade.do',
                                dataType:'html',
                                data:{
                                    'registerUsername': registerUsername,
                                },
                                success:function (data) {
                                    layer.close(registerLoadIndex);
                                    var jsonData = JSON.parse(data);
                                    //layer.msg(data);
                                    if(jsonData[0] == 200){
                                        console.log("hhh")
                                        alert("年级添加成功");
                                        location.reload(true);
                                        console.log("年级添加成功")
                                        $('.registerPage').hide();
                                    }else{
                                        alert("年级已存在，请重新添加!");
                                        $('.registerPage').hide();
                                        return false;
                                    }
                                },
                                error:function () {
                                    layer.close(registerLoadIndex);
                                    layer.alert("请求超时");
                                    $('.registerPage').hide();
                                }
                            });
                        },
                        btn2:function (index,layero) {
                            //重置回调
                            var registerUsername = $('#registerUsername').val("");
                            var registerPassword = $('#registerPassword').val("");
                            var registerWellPassword = $('#registerWellPassword').val("");
                            // 防止注册页面关闭

                            return false;
                        },
                        btn3:function (index,layero) {
                            //取消回调
                            $('.registerPage').hide();
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
                        url: "http://localhost:8080/deletegrade",
                        type: "POST",
                        dataType: "json",
                        data: {
                            grade: data.grade
                        },
                        success: function () {
                            alert("删除成功!");
                            location.reload(true);
                        },
                        error: function () {
                            alert("删除失败!");
                            location.reload(true);
                        }

                    })
                    layer.close(index);
                });
            }
        });
    });

</script>
</body>
</body>
<head>
    <style>
        #registerUsername{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }
        .ss{
            width: 80px;
            height: 35px;
            line-height: 35px;
            position: relative;
            left: 35px;
            text-align: center;
            background-color: #009f95;
            margin: 10px;
            border: 4px solid #76b6e4;
        }

    </style>
</head>
<body>

<div class="registerPage" >
    <div class="registerDiv">
        <form>
            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>年级:</label>
                </div>

                <div class="usernameDiv layui-input-inline">

                    <input id="registerUsername" class="layui-input adminInput" type="text" name="username" placeholder="输入年级" >
                </div>
            </div>

        </form>
    </div>
</div>

</body>


</body>
</html>

