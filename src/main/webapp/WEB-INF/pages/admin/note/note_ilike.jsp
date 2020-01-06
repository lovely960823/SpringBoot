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
    <title> 帖子列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
	 <!-- 自己的css -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
</head>

<body class="gray-bg">
    <div class="row">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="wrapper wrapper-content animated fadeInRight">

                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="p-xs">
                                <div class="pull-left m-r-md">
                                    <i class="fa fa-globe text-navy mid-icon"></i>
                                </div>
                                <h2>欢迎来到H+论坛</h2>
                                <div class="search-form">
		                            <form action="${pageContext.request.contextPath }/back/note/noteIlike" method="post" autocomplete="off">
		                                <div class="input-group">
		                                    <input type="text" placeholder="按名称搜索" name="title" id="myname" value="${param.title}" class="form-control input-lg">
		                                    <div class="input-group-btn">
		                                        <input class="btn btn-lg btn-primary" type="submit"  value="搜索">
		                                    </div>
		                                </div>
		                            </form>
		                        </div>
                            </div>
                        </div>

                        <div class="ibox-content forum-container">
                            <div class="forum-title">
                                <div class="pull-right forum-desc">
                                    <samll>总帖子数：${result.count}</samll>
                                </div>
                                <h3>数据列表</h3>
                            </div>
							 <c:forEach items="${result.data}" var="note"> 
									<div class="forum-item active">
	                                <div class="row">
	                                    <div class="col-sm-9">
	                                        <div class="forum-icon">
	                                            <i class="fa fa-shield"></i>
	                                        </div>
	                                        <a href="forum_post.html" class="forum-item-title" title="点击查看详情">${note.title }</a>
	                                        <div class="forum-sub-title">${note.contents}</div>
	                                    </div>
	                                    <div class="col-sm-1 forum-info">
	                                        <span class="views-number">
	                                            ${note.views}
	                                        </span>
	                                        <div>
	                                            <small>浏览</small>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-1 forum-info">
	                                        <span class="views-number">
	                                            368
	                                        </span>
	                                        <div>
	                                            <small>评论</small>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-1 forum-info">
	                                        <a href="javascript:void(0)" onclick="toupdate('${note.id}')"><span class="glyphicon glyphicon-pencil" aria-hidden="true" title="修改"></span></a>
	                                        	&nbsp;&nbsp;
	                                        <a href="javascript:void(0)" onclick="del('${note.id}')"><span class="glyphicon glyphicon-trash" aria-hidden="true" title="删除"></span></a>    
	                                    </div>
	                                </div>
	                            </div>
							</c:forEach>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

<!-- 底部分页按钮 -->
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<nav aria-label="Page navigation" style="border:0px red solid;">
			<ul class="pagination"  style="border:0px red solid;">
				<li><a
					href="${pageContext.request.contextPath }/back/note/noteList?page=${result.page-1 <= 0 ? 1 : result.page-1}&title=${param.title}"
					aria-label="Previous"> <span aria-hidden="true">首页</span>
				</a></li>
				<li><a
					href="${pageContext.request.contextPath }/back/note/noteList?page=${result.page-1 <= 0 ? 1 : result.page-1 }&title=${param.title}">上一页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/back/note/noteList?page=${result.page+1 >= result.totalPage ? result.totalPage : result.page+1}&title=${param.title}">下一页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/back/note/noteList?page=${result.totalPage }&title=${param.title}"
					aria-label="Next"> <span aria-hidden="true">尾页</span>
				</a></li>
			</ul>
			
			<div class="container" style="border:0px red solid;width:200px;float:right;height:30px;margin:20px 10px 0px 0px;">
			   每页 <select class="pagination">
			    	<option>10</option>
			    	<option>20</option>
			    	<option>30</option>
			    	<option>40</option>
			    </select>条 
			</div>
			</nav>
		</div>
	</nav>

	<!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- Peity -->
    <script src="${pageContext.request.contextPath }/static/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>
<script type="text/javascript">
	function del(id){
		if(confirm("确定要删除数据吗？")){
			$.ajax({
		       	url:"${pageContext.request.contextPath }/back/note/delete?id="+id,
		       	data:{},
		       	type:"POST",
		       	success:function(data){
		       		if(data>0){
		       			alert('删除成功');
		       			window.location.reload();
		       		}
		       	},
		       	error:function(){
		       		alert("服务器忙");
		       	},
		       	dataType:"json"
		       });        	
		}
	}
	
	 function toupdate(id){
		window.location.href="${pageContext.request.contextPath }/back/note/toUpdate?id="+id;
	} 
</script>
    
    

</body>

</html>
