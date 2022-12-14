<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/7
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师后台管理系统</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery1.42.min.js"></script>
    <script src="../layui/layui.js"></script>
</head>
<body class="layui-layout-body">

<!-- 顶部区域 -->
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">教师后台管理系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="https://player.lzti.com/open/img/acg" class="layui-nav-img">
                    欢迎&nbsp; <span style="color: #00FFFF"><%=session.getAttribute("username")%>&nbsp;<%=session.getAttribute("name")%></span>
                </a>
                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->

                        <a href="#" data-url="gerengl"  data-title="个人资料" data-id="22" class="site-demo-active"
                           data-type="tabAdd">
                            个人资料
                        </a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item">
                <!--TODO -->
                <!--可能需要修改路径-->
                <a id="hhh" href="inderx.html">退出</a>
            </li>
        </ul>
    </div>


    <!-- 左侧导航栏 -->
    <div class="layui-tab  layui-side layui-tab-card site-demo-button">
        <ul class="layui-nav layui-side layui-nav-tree layui-nav-side"  lay-shrink="all">

            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">系统管理</a>

                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="http://localhost:8080/teacherpage/stugl" data-title="学生管理" data-id="11" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            学生管理
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="gerengl" data-title="个人管理" data-id="22" class="site-demo-active"
                           data-type="tabAdd">
                            个人资料
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="http://localhost:8080/teacherpage/classgl" data-title="班级管理" data-id="23" class="site-demo-active"
                           data-type="tabAdd">
                            班级管理
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="http://localhost:8080/teacherpage/gradegl" data-title="年级管理" data-id="2853" class="site-demo-active"
                           data-type="tabAdd">
                            年级管理
                        </a>
                    </dd>
                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">作业管理</a>

                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="http://localhost:8080/uploadFile" data-title="上传作业" data-id="101" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            作业列表
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="usergl" data-title="批改作业" data-id="202" class="site-demo-active"
                           data-type="tabAdd">
                            批改作业
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="aadgl" data-title="学生交作业情况" data-id="203" class="site-demo-active"
                           data-type="tabAdd">
                            学生交作业情况
                        </a>
                    </dd>

                </dl>
            </li>




            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">成绩管理</a>

                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="http://localhost:8080/test" data-title="饼状图成绩分布情况" data-id="1001" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            饼状图成绩分布情况
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="usergl" data-title="柱状图成绩情况" data-id="2002" class="site-demo-active"
                           data-type="tabAdd">
                            柱状图成绩情况
                        </a>
                    </dd>
                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">仿真实验系统</a>

                <dl class="layui-nav-child">


                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="dsvlab/index" data-title="仿真实验" data-id="20002" class="site-demo-active"
                           data-type="tabAdd">
                            仿真实验
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="help" data-title="仿真实验用户手册" data-id="100001" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            仿真实验用户手册
                        </a>
                    </dd>



                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="dsvlab/experimentguidance" data-title="实验指导书" data-id="10004101" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            实验指导书
                        </a>
                    </dd>




                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="dsvlab/chipdatasheet" data-title="实验器材资料" data-id="10044001" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            实验器材资料
                        </a>
                    </dd>
                </dl>
            </li>




            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">计组教学视频管理</a>

                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="book" data-title="上传视频" data-id="1091" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            上传视频
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="usergl" data-title="视频管理" data-id="20502" class="site-demo-active"
                           data-type="tabAdd">
                            视频管理
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="aadgl" data-title="查看学生视频学习情况" data-id="2089523" class="site-demo-active"
                           data-type="tabAdd">
                            查看学生视频学习情况
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="aadgl" data-title="查看学生视频时常统计图" data-id="20443" class="site-demo-active"
                           data-type="tabAdd">
                          学生视频时常统计图
                        </a>
                    </dd>
                </dl>
            </li>




            <li class="layui-nav-item layui-nav-itemed">

                <a href="javascript:;">留言管理</a>

                <dl class="layui-nav-child">

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <!--4、id，也必须唯一，这里id设置为default-tab，设置该选项卡为默认显示的-->
                        <a href="#" data-url="book" data-title="作业评论" data-id="108891" id="default-tab"
                           class="site-demo-active"
                           data-type="tabAdd">
                            作业评论
                        </a>
                    </dd>

                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="usergl" data-title="私聊信息" data-id="2054442" class="site-demo-active"
                           data-type="tabAdd">
                            私聊信息
                        </a>
                    </dd>
                    <dd>
                        <!--TODO -->
                        <!--需要修改为自己项目的部分：-->
                        <!--1、属性data-url（需要在右边选项卡中打开的页面的路径）  -->
                        <!--2、属性data-title（选项卡标题）-->
                        <!--3、属性data-id必须唯一，tab选项卡根据这个值进行切换-->
                        <a href="#" data-url="aadgl" data-title="回复信息" data-id="2055253" class="site-demo-active"
                           data-type="tabAdd">
                            回复信息
                        </a>
                    </dd>

                </dl>
            </li>

        </ul>


    </div>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="demo" lay-allowClose="true">
            <!--tab页标题-->
            <ul class="layui-tab-title">
            </ul>

            <!--tab页标题上右键，出现下面的 关闭当前和关闭所有的选项-->
            <ul class="rightMenu" style="display: none;position: absolute;">
                <li data-type="closeThis" class="layui-bg-cyan">关闭当前</li>

                <li data-type="closeAll" class="layui-bg-cyan">关闭所有</li>
            </ul>

            <!--tab页主体内容区域-->
            <div class="layui-tab-content">

            </div>

        </div>
    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        计算机组成原理辅助教学管理系统：&copy 制作人刘通
    </div>

</div>


<script>


    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery;
        var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            // 在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                // 新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                // 关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    // TODO
                    // 这里的选项卡页面路径：  src="' + url + '.html"  ，可能需要根据自己项目实际的后缀名修改
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '.jsp" style="width:100%;height:99%;"></iframe>',
                    id: id // 规定好的id
                })
                CustomRightClick(id); // 自定义函数，给tab绑定右击事件
                FrameWH();  // 自定义函数，计算iframe层的大小
            },
            tabChange: function (id) {
                // 切换到指定Tab项
                element.tabChange('demo', id); // 根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);// 删除
            }
            , tabDeleteAll: function (ids) {// 删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }

        };


        // 当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);

            // 这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                // 如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                // 否则判断该tab项是否已经存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            // 最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });


        function CustomRightClick(id) {

            //取消右键  rightMenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
            $('.layui-tab-title li').on('contextmenu', function () {
                return false;
            })

            $('.layui-tab-title,.layui-tab-title li').click(function () {
                $('.rightMenu').hide();
            });

            //桌面点击右击
            $('.layui-tab-title li').on('contextmenu', function (e) {
                var popupmenu = $(".rightMenu");
                popupmenu.find("li").attr("data-id", id); //在右键菜单中的标签绑定id属性

                //判断右侧菜单的位置
                l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
                t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
                popupmenu.css({left: l, top: t}).show(); //进行绝对定位
                //alert("右键菜单")
                return false;
            });
        }

        $(".rightMenu li").click(function () {

            //右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
            if ($(this).attr("data-type") == "closeThis") {
                //如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
                active.tabDelete($(this).attr("data-id"))
            } else if ($(this).attr("data-type") == "closeAll") {
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                $.each(tabtitle, function (i) {
                    ids[i] = $(this).attr("lay-id");
                })
                //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
                active.tabDeleteAll(ids);
            }

            $('.rightMenu').hide(); //最后再隐藏右键菜单
        })

        // 计算frame高度
        function FrameWH() {
            var h = $(window).height() - 41 - 10 - 60 - 10 - 44 - 10;
            $("iframe").css("height", h + "px");
        }


        $(window).resize(function () {
            FrameWH();
        })


        var layer = layui.layer;
        layer.ready(function () {
            // layer.msg('您已进入页面了！');
            // 触发点击事件，这样就可以设置默认显示的选项卡页面
            // TODO
            // 可能需要修改的地方，标签id值
            $("#default-tab").trigger("click");
        });

    });
    $("#hhh").click(function(){
        alert("欢迎下次使用！")


    });
</script>


</body>
</html>

