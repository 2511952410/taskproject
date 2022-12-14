<%--
  Created by IntelliJ IDEA.
  User: 刘通
  Date: 2022/10/7
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery1.42.min.js"></script>
    <script src="layui/layui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.1.1/dist/echarts.min.js"></script>
</head>
<body>
<!-- 柱状图 折线图  饼状图 -->
<div class="layui-card">
    <div class="layui-card-header">图表统计</div>
    <div class="layui-card-body">
        <div id="EchartZhu" style="width: 500px;height: 500px;"> </div>
    </div>
</div>

</body>
<script type="text/javascript">

    layui.use(['jquery', 'form', 'layer', 'laydate', 'table','layedit','upload', 'element', 'carousel'],function(){

        var $ = layui.jquery;
        var element = layui.element;
        carousel = layui.carousel;
        // echarts = layui.echarts;
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var table = layui.table;
        var layedit = layui.layedit;
        var upload = layui.upload;
        // var dtree = layui.dtree;


        var chartZhu = echarts.init(document.getElementById('EchartZhu'));
        //指定图表配置项和数据
        var optionchart = {
            title: {
                text: '数据分析'
            },
            tooltip: {},
            legend: {
                data: ['数据量']
            },
            xAxis: {
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周天']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name: '销量',
                type: 'bar', //柱状
                data: [100,200,300,400,500,600,700],
                itemStyle: {
                    normal: { //柱子颜色
                        color: 'red'
                    }
                },
            },{
                name:'产量',
                type:'bar',
                data:[120,210,340,430,550,680,720],
                itemStyle:{
                    normal:{
                        color:'blue'
                    }
                }
            }]
        };

        var optionchartZhe = {
            title: {
                text: '数据分析'
            },
            tooltip: {},
            legend: { //顶部显示 与series中的数据类型的name一致
                data: ['销量', '产量', '营业额', '单价']
            },
            xAxis: {
                // type: 'category',
                // boundaryGap: false, //从起点开始
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name: '销量',
                type: 'line', //线性
                data: [145, 230, 701, 734, 1090, 1130, 1120],
            }, {
                name: '产量',
                type: 'line', //线性
                data: [720, 832, 801, 834, 1190, 1230, 1220],
            }, {
                smooth: true, //曲线 默认折线
                name: '营业额',
                type: 'line', //线性
                data: [820, 932, 901, 934, 1290, 1330, 1320],
            }, {
                smooth: true, //曲线
                name: '单价',
                type: 'line', //线性
                data: [220, 332, 401, 534, 690, 730, 820],
            }]
        };

        var optionchartBing = {
            title: {
                text: '数据分析',
                subtext: '纯属虚构', //副标题
                x: 'center' //标题居中
            },
            tooltip: {
                // trigger: 'item' //悬浮显示对比
            },
            legend: {
                orient: 'vertical', //类型垂直,默认水平
                left: 'left', //类型区分在左 默认居中
                data: ['单价', '总价', '销量', '产量']
            },
            series: [{
                type: 'pie', //饼状
                radius: '60%', //圆的大小
                center: ['50%', '50%'], //居中
                data: [{
                    value: 335,
                    name: '单价'
                },
                    {
                        value: 310,
                        name: '总价'
                    },
                    {
                        value: 234,
                        name: '销量'
                    },
                    {
                        value: 135,
                        name: '产量'
                    }
                ]
            }]
        };
        //chartZhu.setOption(optionchart, true);       // 柱状图
        chartZhu.setOption(optionchartZhe, true);    // 折线图
        // chartZhu.setOption(optionchartBing, true);      // 饼状图

    });

</script>

</html>
