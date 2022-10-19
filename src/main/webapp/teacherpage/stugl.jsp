<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/7
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery1.42.min.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/index.js"></script>

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
        <button class="layui-btn layui-btn-sm" style="background-color: #393D49" lay-event="update">
            <i class="layui-icon"></i>
        </button>
    </div>
</script>
<fieldset class="table-search-fieldset">
    <legend>学生搜索信息</legend>
    <div style="margin: 10px 10px 10px 10px" id="btn">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">学号:</label>
                    <div class="layui-input-inline">
                        <!--注意此处input标签里的id-->
                        <input class="layui-input" name="keyword" id="susername"
                               autocomplete="off" placeholder="学号">
                    </div>
                </div>

                <div class="layui-inline">
                <label class="layui-form-label ">班级:</label>
                <div class="layui-input-inline">
                <select  id="selectId" class="layui-select"
                name="roleSelect" >
                </select>
                </div>
                </div>



                <div class="layui-inline">
                    <label class="layui-form-label ">年级:</label>
                    <div class="layui-input-inline">
                        <select  id="selectgade" class="layui-select"
                                 name="roleSelect" >
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <!--注意此处button标签里的type属性-->
                    <button id="query" type="button" id="query" class="layui-btn" lay-submit
                            data-type="reload" lay-filter="data-search-btn">
                        <i class="layui-icon"></i> 搜 索
                    </button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<script type="text/html" id="barDemo">

    <button type="button" class="layui-btn layui-btn-sm" style="background-color:#31BDEC " lay-event="enit"><i
            class="layui-icon">&#xe770;</i></button>
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
                url: 'http://localhost:8080/user/getCount',
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
            , url: 'http://localhost:8080/user/getStu' //改地址是访问地址
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
                , {field: 'susername', title: '学号', width: 150, sort: true}
                , {field: 'sname', title: '姓名', width: 100}
                , {field: 'phone', title: '电话号码', width: 200, sort: true}
                , {field: 'classname', title: '班级', width: 150, sort: true}
                , {
                    field: 'grade', title: '年级', width: 150, sort: true
                }
                , {field: 'password', title: '密码', width: 150, sort: true}

                , {field: 'right', title: '操作', width: 150, toolbar: '#barDemo'}

            ]]
            , page: true
            , limit: 10
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

        $('#query').click(function () {
            var susername = $('#susername').val();
            var classname = $("#selectId option:selected").text();
            var grade = $("#selectgade option:selected").text();

            table.reload('test', {
                url: 'http://localhost:8080/user/query.do'
                , methods: "get"
                , request: {
                    pageName: 'page' //页码的参数名称，默认：page
                }
                , where: {
                    susername: susername,
                    classname: classname,
                    grade:grade,
                }
                , page: {
                    curr:0
                }
            });
        })
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
                case 'update':
                    var data = checkStatus.data;
                    if (data.length == 1) {
                        layer.open({
                            type: 1,
                            skin: 'layui-layer-rim',
                            area: ['45%', '75%'],
                            btn: ['修改', '取消'],
                            shadeClose: true,
                            end: function (index, layero) {
                                return false;
                            },
                            content: '<br><div class="layui-inline"><label class="layui-form-label">学号:</label><div class="layui-input-inline"><input style="background-color: #cccccc" disabled="disabled" value = ' + data[0].susername + ' class="layui-input" name="keyword" id="pusername"autocomplete="off"></div></div>' +
                                '<br><div class="layui-inline"><label class="layui-form-label">姓名:</label><div class="layui-input-inline"><input  value = ' + data[0].sname + ' class="layui-input" name="keyword" id="pname"autocomplete="off"></div></div>' +
                                '<br><div class="layui-inline"><label class="layui-form-label">电话号码:</label><div class="layui-input-inline"><input value = ' + data[0].phone + ' class="layui-input" name="keyword" id="pphone"autocomplete="off"></div></div>' +
                                '<br><div class="layui-inline"><label class="layui-form-label">班级:</label><div class="layui-input-inline"><input style="background-color: #cccccc" disabled="disabled"  value = ' + data[0].classname + ' class="layui-input" name="keyword" id="classname"autocomplete="off"></div></div>' +
                                '<br><div class="layui-inline"><label class="layui-form-label">年级:</label><div class="layui-input-inline"><input style="background-color: #cccccc" disabled="disabled"  value = ' + data[0].grade + ' class="layui-input" name="keyword" id="Grade"autocomplete="off"></div></div>' +
                                '<br><div class="layui-inline"><label class="layui-form-label">密码:</label><div class="layui-input-inline"><input value = ' + data[0].password + ' class="layui-input" name="keyword" id="ppassword"autocomplete="off"></div></div>'
                            , btn1: function (index, layero) {
                                var username = $('#pusername').val();
                                var name = $('#pname').val();
                                var phone = $('#pphone').val();
                                var address = $('#classname').val();
                                var sex = $('#Grade').val();
                                var password = $('#ppassword').val();
                                // if(username == '' || name == '' || phone == '' || address == '' || password == ''){
                                // 	layer.alert("提交信息未完成，不予提交");
                                // 	return false;
                                // }
                                if (username == data[0].susername && name == data[0].sname && phone == data[0].phone && address == data[0].classname && sex == data[0].grade && password == data[0].password) {
                                    layer.alert("保存成功");
                                    return;
                                }
                                $.ajax({
                                    type: 'post',
                                    url: 'http://localhost:8080/user/update.do',
                                    dataType: "json",
                                    data: {
                                        'susername': username,
                                        'sname': name,
                                        'phone': phone,
                                        'classname': address,
                                        'grade': sex,
                                        'password': password
                                    },
                                    traditional: true,
                                    success: function (data) {
                                        if (data[0] == 200) {
                                            alert("修改成功");
                                            location.reload();
                                        } else {
                                            layer.alert("修改失败");
                                            return;
                                        }
                                    },
                                    error: function () {
                                        layer.alert("请求超时");
                                    }
                                });
                            },
                            btn2: function (index, layero) {
                                //取消回调
                                $('.registerPage').hide();
                            }
                        });
                    } else {
                        layer.alert("一次只允许修改一个学生信息");
                        return;
                    }

                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                case 'add':
                    layer.open({
                        type:'1',
                        content:$('.registerPage'),
                        title:'添加学生',
                        area:['430px','400px'],
                        btn:['添加学生','重置','取消'],
                        closeBtn:0,
                        btn1:function (index,layero) {
                            //注册回调
                            layer.close(index);
                            var registerUsername = $('#registerUsername').val();
                            var registerName = $('#registerNname').val();
                            var registerPhone = $('#registerPhone').val();
                            var selectType = $('#roleSelectType option:selected').val();
                            var selectClass= $('#roleSelectclass option:selected').text();
                            var selectGrden = $('#roleSelectsgade option:selected').text();
                            var registerPassword = $('#registerPassword').val();
                            if(registerUsername == "" || registerName == "" || registerPassword == "" ){
                                alert("必填信息不能为空,注册失败！");
                                $('.registerPage').hide();
                                return;
                            }
                            if(registerPhone.length != 11){
                                alert("手机号格式错误,注册失败！");
                                $('.registerPage').hide();
                                return;
                            }
                            if(registerPassword.length < 8){
                                alert("密码长度需大于8位,注册失败！");
                                $('.registerPage').hide();
                                return;
                            }
                            var registerLoadIndex = layer.load(2);
                            $.ajax({
                                type:'post',
                                url:'http://localhost:8080/user/adduser.do',
                                dataType:'html',
                                data:{
                                    'registerUsername': registerUsername,
                                    'registerNname': registerName,
                                    'registerPhone': registerPhone,
                                    'selectType':selectType,
                                    'selectClass': selectClass,
                                    'selectGrden': selectGrden,
                                    'registerPassword': registerPassword
                                },
                                success:function (data) {
                                    layer.close(registerLoadIndex);
                                    var jsonData = JSON.parse(data);
                                    //layer.msg(data);
                                    if(jsonData[0] == 200){
                                        if(jsonData[1] == 1){
                                            alert("学生添加成功");
                                            $('.registerPage').hide();
                                        }
                                    }else{
                                        alert("学生已存在，请重新注册!");
                                        $('.registerPage').hide();
                                        return false;
                                    }
                                },
                                error:function () {
                                    layer.close(registerLoadIndex);
                                    layer.alert("请求超时，学生已注册");
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




            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;

            var event = obj.event;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "http://localhost:8080/user/delete",
                        type: "POST",
                        dataType: "json",
                        data: {
                            susername: data.susername

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
            if (event === 'enit') {
                form.val('update-user-form', {
                    "susername": data.susername,
                    "sname": data.sname,
                    "phone": data.phone,
                    "classname": data.classname,
                    "grade": data.grade,
                    "password": data.password
                });
                layer.open({
                    type: 1,
                    title: '查看用户信息',
                    skin: 'layui-layer-molv',
                    area: ['45%','85%'],
                    content: $('#update-user-layer')
                });
            }
        });
        $.ajax({
            type: 'post',
            url: 'http://localhost:8080/list',
            dataType: 'html',
            data: {},
            success: function (data) {
                var jsonData = JSON.parse(data);
                var parknames = [];
                for (var i = 0; i < jsonData.length; i++) {
                    parknames.push('<option value="' + i + '">' + jsonData[i] + '</option>');
                }
                $("#selectId").html(parknames.join(' '));

                form.render(); //更新全部表单内容
                form.render('select'); //刷新表单select选择框渲染
            }
        });


        $.ajax({
            type: 'post',
            url: 'http://localhost:8080/listgrade',
            dataType: 'html',
            data: {},
            success: function (data) {
                var jsonData = JSON.parse(data);
                var parknames = [];
                for (var i = 0; i < jsonData.length; i++) {
                    parknames.push('<option value="' + i + '">' + jsonData[i] + '</option>');
                }
                $("#selectgade").html(parknames.join(' '));


                form.render(); //更新全部表单内容
                form.render('select'); //刷新表单select选择框渲染
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
        #registerNname{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }

        #registerPhone{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }
        #roleSelectType{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }
        #roleSelectclass{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }
        #roleSelectsgade{
            width: 200px;
            height: 42px;
            border: 4px solid #76b6e4;
            position: relative;
            left: 30px;
        }
        #registerPassword{
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
    <label>学号:</label>
</div>

                <div class="usernameDiv layui-input-inline">

                    <input id="registerUsername" class="layui-input adminInput" type="text" name="username" placeholder="输入学号" >
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>姓名:</label>
                </div>
                <div class="usernameDiv layui-input-inline">

                    <input id="registerNname" class="layui-input adminInput" type="text" name="name" placeholder="输入姓名" >
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>手机号:</label>
                </div>
                <div class="usernameDiv layui-input-inline">

                    <input id="registerPhone" class="layui-input adminInput" type="text" name="registerPhone" placeholder="输入手机" >
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>角色:</label>
                </div>
                <div class="passwordDiv layui-input-inline">
                    <select id="roleSelectType" class="layui-select">
                        <option value="1">学生</option>
                    </select>
                </div>
            </div>
            <div class="usernameWrapDiv ">
                <div class="ss" style="display: inline-block;">
                    <label>班级选取:</label>
                </div>
                <div class="passwordDiv layui-input-inline">
                    <select id="roleSelectclass" class="layui-select">

                    </select>
                </div>
            </div>


            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>年级选取:</label>
                </div>
                <div class="passwordDiv layui-input-inline">
                    <select id="roleSelectsgade" class="layui-select">

                    </select>
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="ss" style="display: inline-block;">
                    <label>密码:</label>
                </div>
                <div class="passwordDiv layui-input-inline">
                    <input id="registerPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>

        </form>
    </div>
</div>

</body>
<body>
<!-- 用户信息弹出层 -->
<div id="update-user-layer" style="display: none; padding: 20px">
    <form id="update-user-form" class="layui-form layui-form-pane" lay-filter="update-user-form">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="susername"
                       class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="sname"
                       class="layui-input"
                       lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="phone"
                       class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="classname"
                       class="layui-input" lay-verify="required" autocomplete="off">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="grade"
                       class="layui-input"
                       lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" style="background-color: #cccccc" name="password"
                       class="layui-input" lay-verify="required">
            </div>
        </div>

    </form>
</div>

</body>

</body>
</html>
