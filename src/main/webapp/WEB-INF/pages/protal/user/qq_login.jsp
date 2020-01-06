<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帖子列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
	 <!-- 自己的css -->
    <script src="/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
</head>

<body class="gray-bg">
	<a href="/getQQCode">获取qq登录连接</a>
	<div >${url }</div>
	<a href="${url}">开始登录</a>
	<br>
	<a href="/wxLogin">跳到微信登录页</a>
</body>

</html>
