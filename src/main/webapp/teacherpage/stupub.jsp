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
  <meta name="viewport" content="width=device-width, initial-scale=1">>
  <title>公共UI</title>
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">学生毕设管理系统</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      
      <!--<li class="layui-nav-item layui-hide-xs"><a href="<%=basePath%>user/redis">设置</a></li>
      <li class="layui-nav-item layui-hide-xs"><a>nav 2</a></li>
      <li class="layui-nav-item layui-hide-xs"><a>nav 3</a></li>
      <li class="layui-nav-item">
        <a>nav groups</a>
        <dl class="layui-nav-child">
          <dd><a>menu 11</a></dd>
          <dd><a>menu 22</a></dd>
          <dd><a>menu 33</a></dd>
        </dl>
      </li> -->
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <!--<img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">-->
         ${name }
        </a>
        <dl class="layui-nav-child">
          <dd><a href="http://localhost:8080/ment/stu/myhome.do?username=${username}">个人主页</a></dd>
          <dd><a href="http://localhost:8080/ment/user/mainstu.do">返回主页</a></dd>
          <dd><a href="http://localhost:8080/ment/stu/toExit.do">安全退出</a></dd>
        </dl>
      </li>

      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a>
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="">课题专区</a>
          <dl class="layui-nav-child">
            <dd><a href="http://localhost:8080/ment/subject/chosesub.do">课题选择</a></dd>
            <dd><a href="http://localhost:8080/ment/subject/submit.do">课题上交</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item ">
          <a></a>
          <dl class="layui-nav-child">
            <dd><a></a></dd>
            <dd><a></a></dd>
          </dl>
        </li>
        <li class="layui-nav-item ">
          <a></a>
          <dl class="layui-nav-child">
            <dd><a></a></dd>
            <dd><a></a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a>更多...</a></li>
      </ul>
    </div>
  </div>
</div>
<script>
//JS 
var infoList = '<%=session.getAttribute("info")%>';
var jsonInfo = JSON.parse(infoList);
//alert(infoList);
var parknames =[];
  for(var i = 0; i < jsonInfo.length; i++){
	parknames.push('<div style="padding: 15px;">'+'时间:'+jsonInfo[i].datetime+'<br>'+'信息:'+jsonInfo[i].info+'</div><br><br>'); 
}
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: parknames.join(' ')
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>
</body>
</html>