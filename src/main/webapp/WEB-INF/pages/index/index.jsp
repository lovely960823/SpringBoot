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
    <meta name="renderer" content="webkit">

    <title> Website- 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript">
    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">LJW-Website</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">ljw
                        </div>
                    </li>
                    
                    <li>
                        <a class="J_menuItem" href="">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    
                    <!-- <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="admin/main">百度ECharts</a>
                            </li>
                        </ul>
                    </li> -->
                    
                   
                        <c:forEach items="${nodeList}" var="node" varStatus="vs">
                        	<c:if test="${node.name eq node.part }">
                        		 <li>
	                        		<a href="#">
			                            <i class="fa fa fa-bar-chart-o"></i><!-- 这里设置一级菜单 -->
			                            <span class="nav-label">${node.name}</span>
			                            <span class="fa arrow"></span>
			                        </a>
			                       	<c:forEach items="${nodeList}" var="node1" varStatus="vs">
			                       		<c:if test="${node1.name ne node1.part && node1.part eq node.part}">
			                       			<ul class="nav nav-second-level">
					                            <li>
					                                <a class="J_menuItem" href="${pageContext.request.contextPath }/${node1.url }">${node1.name }</a>
					                            </li>
	                      					  </ul>
			                       		</c:if>
			                       	</c:forEach>
		                       	</li>
                        	</c:if>
                        </c:forEach>
                    
                   
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
                        
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath }/static/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 是不是只有我死了,你们才不骂爵迹
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath }/static/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>二愣子</strong> 呵呵
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                 <span class="glyphicon glyphicon-user"></span>
                            </a>
                            <ul class="dropdown-menu" >
                                <li >
                                    <a href="${pageContext.request.contextPath }/protal/note/noteList" >
                                       	 返回前台
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="${pageContext.request.contextPath }/protal/user/logout">
                                      	 退出登录
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="${pageContext.request.contextPath }/index_v1" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath }/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="${pageContext.request.contextPath }/static/js/plugins/pace/pace.min.js"></script>

</body>

</html>
