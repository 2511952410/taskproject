<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/6
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>计算机组成原理辅助教学系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery1.42.min.js"></script>
    <script src="layui/layui.js"></script>
    <script src="js/index.js"></script>
    <script src="js/sliderVerify.js"></script>
</head>
<body>
<body>
<img src="https://player.lzti.com/open/img/scen">
<div class="wrap">
    <div class="loginForm">
        <form>
            <div class="logoHead">
                <h2 style="margin-top: 15px; margin-left:20px">计算机组成原理辅助教学系统</h2>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>用户名:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="loginUsername"  class="layui-input adminInput" type="text" name="loginUsername" placeholder="输入用户名" >
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="loginPassword" class="layui-input adminInput" type="password" name="loginPassword" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>验证码:</label>
                </div>
                <div class="cardDiv">
                    <input id="loginCard" class="layui-input cardInput" type="text" name="card" placeholder="输入验证码">
                </div>
                <div class="codeDiv">
                    <input id="loginCode" class="layui-input codeInput"  type="button">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>角色:</label>
                </div>
                <div class="passwordDiv">
                    <select id="roleSelect" class="layui-select" name ="roleSelect">
                        <option value="0">教师</option>
                        <option value="1">学生</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label" id="sdk">滑动验证:</label>
                <div class="layui-input-block" id="sdd" style="width: 210px">
                    <div id="slider" ></div>
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="submitLabel">
                    <label>没有账号？ <a href="#" id="loginRegister" style="color: #00FFFF">点击注册</a></label>
                </div>
                <div class="submitDiv ">
                    <input id="loginBtn" type="button" class="submit layui-btn layui-btn-primary" value="登录"></input>
                    <button class="submit layui-btn" type="button" id="reset">重置滑块</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<div class="registerPage">
    <div class="registerDiv">
        <form>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>用户名:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="registerUsername" class="layui-input adminInput" type="text" name="username" placeholder="输入用户名" >
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>姓名:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="registerNname" class="layui-input adminInput" type="text" name="name" placeholder="输入用户姓名" >
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>手机号:</label>
                </div>
                <div class="usernameDiv">
                    <i class="layui-icon layui-icon-username adminIcon"></i>
                    <input id="registerPhone" class="layui-input adminInput" type="text" name="registerPhone" placeholder="输入用户手机" >
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>角色:</label>
                </div>
                <div class="passwordDiv">
                    <select id="roleSelectType" class="layui-select">
                        <option value="0">教师</option>
                        <option value="1">学生</option>
                    </select>
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>班级选取:</label>
                </div>
                <div class="passwordDiv">
                    <select id="roleSelectclass" class="layui-select">

                    </select>
                </div>
            </div>

            <%--<div class="usernameWrapDiv">--%>
                <%--<div class="usernameLabel">--%>
                    <%--<label>年级选取:</label>--%>
                <%--</div>--%>
                <%--<div class="passwordDiv">--%>
                    <%--<select id="roleSelectsgade" class="layui-select">--%>

                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>年级选取:</label>
                </div>
                <div class="passwordDiv">
                    <select id="roleSelectsgade" class="layui-select">

                    </select>
                </div>
            </div>

            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="registerPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>
            <div class="usernameWrapDiv">
                <div class="usernameLabel">
                    <label>确认密码:</label>
                </div>
                <div class="passwordDiv">
                    <i class="layui-icon layui-icon-password adminIcon"></i>
                    <input id="registerWellPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    layui.config({
        base: 'dist/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function() {
        var sliderVerify = layui.sliderVerify,
            $ = layui.jquery,
            form = layui.form;
        var slider = sliderVerify.render({
            elem: '#slider',
            onOk: function(){//当验证通过回调
                layer.msg("滑块验证通过");
            }
        })
        $('#reset').on('click',function(){
            slider.reset();
        })
        //监听提交
        form.on('submit(formDemo)', function(data) {
            if(slider.isOk()){
                layer.msg(JSON.stringify(data.field));
            }else{
                layer.msg("请先通过滑块验证");
            }
            return false;
        });
    })
</script>
</html>
