<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帖子列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/style.css?v=4.1.0" rel="stylesheet">
	 <!-- 自己的css -->
    <script src="/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
	<script type="text/javascript" src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
</head>

<body class="gray-bg">
    <button onclick="login()">微信登录</button>
    <div id="login_container" style="width: 500px;height: 500px;"></div>
</body>
<script type="text/javascript">



</script>
</html>
