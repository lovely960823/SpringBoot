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
    <title> - 基础表格</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>基本</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>序列</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list}" var="user" varStatus="l">
                            		<tr>
	                                    <td>${l.count}</td>
	                                    <td>${user.name}</td>
	                                    <td></td>
	                                    <td>23</td>
	                                    <td>
	                                    	<a href="javascript:void(0)" onclick="toupdate()"><span class="glyphicon glyphicon-pencil" aria-hidden="true" title="修改"></span></a>
	                                        	&nbsp;&nbsp;
	                                        <a href="javascript:void(0)" onclick="del()"><span class="glyphicon glyphicon-trash" aria-hidden="true" title="删除"></span></a> 
	                                       		&nbsp;&nbsp;
	                                        <a href="${pageContext.request.contextPath }/back/xtgl/grantList?id=${user.id}" ><span class="glyphicon glyphicon-check" aria-hidden="true" title="授权"></span></a>       
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
</body>

</html>
