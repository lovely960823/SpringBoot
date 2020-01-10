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
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
	 <!-- 自己的css -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
    
	<script type="text/javascript">
		var sessionUser = '${loginUser.name }';
	</script>
</head>

<body class="gray-bg">
	<!-- 顶部开始 -->	
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="javascript:void(0)" onclick="window.location.href='${pageContext.request.contextPath }/protal/note/notePublish'" style="color:green">我要发表</a>
						</li>
						<li class="dropdown pull-right" id="xialaMenu">
							<c:if test="${empty loginUser.name}">
								<a href="javascript:void(0)" onclick="window.location.href='${pageContext.request.contextPath }/protal/user/toLogin'" target="_blank" data-toggle="dropdown" class="dropdown-toggle" >登录</a>
							</c:if>
							
							<c:if test="${not empty loginUser.name}">
								<a href="javascript:void(0)" onclick="showMenu()" data-toggle="dropdown" class="dropdown-toggle" ><img style="width: 50px;height: 50px;" alt="" src="${loginUser.img}"><strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li>
										<a href="${pageContext.request.contextPath }/protal/user/myself">个人中心</a>
									</li>
									<li>
										<a href="#">修改密码</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/protal/user/logout">退出登录</a>
									</li>
								</ul>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
		</div>
	<!-- 顶部结束 -->	
    <div class="row">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="wrapper wrapper-content animated fadeInRight">
						<!-- 搜索栏 -->
                        <div class="ibox-content m-b-sm border-bottom">
                            <div class="p-xs">
                                <div class="pull-left m-r-md">
                                </div>
                                <h2>欢迎来到H+博客</h2>
                                <div class="search-form">
		                            <form action="${pageContext.request.contextPath }/protal/note/noteList" method="post" autocomplete="off">
		                                <div class="input-group">
		                                    <input type="text" placeholder="按名称搜索" name="title" id="myname"  list="userNameList" value="${param.title}" class="form-control input-lg">
		                                    <datalist id="userNameList"></datalist>
		                                    <div class="input-group-btn">
		                                        <input class="btn btn-lg btn-primary" type="submit" value="搜索">
		                                    </div>
		                                </div>
		                            </form>
		                        </div>
                            </div>
                        </div>
						<!-- 列表数据 -->
                        <div class="ibox-content forum-container">
                            <div class="forum-title">
                                <div class="pull-right forum-desc" style="margin-right: 180px;">
                                    <samll>总帖子数：${result.count}</samll>
                                </div>
                                <h3>数据列表</h3>
                            </div>
							 <c:forEach items="${result.data}" var="note"> 
									<div class="forum-item active">
	                                <div class="row">
	                                    <div class="col-sm-9">
	                                        <div class="forum-icon">
	                                          	作者 <span style="color:green">${note.user.name}</span>
	                                        </div>
	                                        <a href="${pageContext.request.contextPath }/protal/note/noteDetail?id=${note.id}" class="forum-item-title" title="点击查看详情">${note.title }</a>
	                                        <div class="forum-sub-title">${note.contents1}</div>
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
	                                            ${note.pcount}
	                                        </span>
	                                        <div>
	                                            <small>评论</small>
	                                        </div>
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
					href="${pageContext.request.contextPath }/protal/note/noteList?page=${result.page-1 <= 0 ? 1 : result.page-1}&title=${param.title}"
					aria-label="Previous"> <span aria-hidden="true">首页</span>
				</a></li>
				<li><a
					href="${pageContext.request.contextPath }/protal/note/noteList?page=${result.page-1 <= 0 ? 1 : result.page-1 }&title=${param.title}">上一页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/protal/note/noteList?page=${result.page+1 >= result.totalPage ? result.totalPage : result.page+1}&title=${param.title}">下一页</a></li>
				<li><a
					href="${pageContext.request.contextPath }/protal/note/noteList?page=${result.totalPage }&title=${param.title}"
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
	//关注操作
	function guanz(id){
		if(sessionUser==null||sessionUser==''){
			layer.alert('您还未登录，无法进行该操作');
			return false;
		}
		//关注前判断
		$.ajax({
        	url:"${pageContext.request.contextPath }/protal/user/gzpd",
        	data:{"userId":id},
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			makegz(data)
        		}else if(data==0){
        			layer.alert('已经关注过');
        		}else{
        			layer.alert('服务器忙')
        		}
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });     
	}
	function makegz(id){
		$.ajax({
        	url:"${pageContext.request.contextPath }/protal/user/ensuregz",
        	data:{"userId":id},
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			layer.alert('关注成功');
        		}
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });
	}
	//收藏操作
	function shoucang(id){
		if(sessionUser==null||sessionUser==''){
			layer.alert('您还未登录，无法进行该操作');
			return false;
		}
		//收藏前判断
		$.ajax({
        	url:"${pageContext.request.contextPath }/protal/note/scpd",
        	data:{"noteId":id},
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			makesc(data)
        		}else if(data==0){
        			layer.alert('已经收藏过');
        		}else{
        			layer.alert('服务器忙')
        		}
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });     
	}
	
	//确定收藏
	function makesc(id){
		$.ajax({
        	url:"${pageContext.request.contextPath }/protal/note/ensuresc",
        	data:{"noteId":id},
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			layer.alert('收藏成功');
        		}
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });
	}
	//下拉菜单展开
	function showMenu(){
		$('#xialaMenu').addClass("open");
	}
	
	
	
	/* 鼠标特效 */
	var a_idx = 0;
	jQuery(document).ready(function($) {
	    $("body").click(function(e) {
	        var a = new Array("❤富强❤","❤民主❤","❤文明❤","❤和谐❤","❤自由❤","❤平等❤","❤公正❤","❤法治❤","❤爱国❤","❤敬业❤","❤诚信❤","❤友善❤");
	        var $i = $("<span></span>").text(a[a_idx]);
	        a_idx = (a_idx + 1) % a.length;
	        var x = e.pageX,
	        y = e.pageY;
	        $i.css({
	            "z-index": 999999999999999999999999999999999999999999999999999999999999999999999,
	            "top": y - 20,
	            "left": x,
	            "position": "absolute",
	            "font-weight": "bold",
	            "color": "rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"
	        });
	        $("body").append($i);
	        $i.animate({
	            "top": y - 180,
	            "opacity": 0
	        },
	        1500,
	        function() {
	            $i.remove();
	        });
	    });
	});
	
	
	//下拉模糊查找
	$(document).ready(function() {
		$('#myname').keyup(function() {
			$("#userNameList option").remove();
			$.ajax({
	        	url:"${pageContext.request.contextPath }/protal/note/getNoteName",
	        	data:{"title":$('#myname').val()},
	        	type:"POST",
	        	success:function(data){
	        		if(data.length>0){
	        			var ophtml="";
	        			for(var i=0;i<data.length;i++){
	        				ophtml += "<option value='"+data[i]+"'>"+data[i]+"</option>";
	        			}
		                $("#userNameList").append(ophtml); 
	        		}
	        	},
	        	error:function(){
	        		layer.alert("服务器忙");
	        	},
	        	dataType:"json"
	        });
		})
	})
</script>
    
</body>

</html>
