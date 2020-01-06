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
    <title> - 数据表格</title>
    
	
	<link rel="shortcut icon" href="favicon.ico"> 
	<link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
<!-- 自己的css -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
</head>

<body >
	<div class="ibox-content m-b-sm border-bottom">
		<div class="p-xs">
			<div class="pull-left m-r-md">
				<i class="fa fa-globe text-navy mid-icon"></i>
			</div>
			<h2>欢迎来到H+论坛</h2>
			<div class="search-form">
				<form action="${pageContext.request.contextPath }/back/user/toUserList" method="post" autocomplete="off">
					<div class="input-group">
						<input type="text" placeholder="按名称搜索" name="name" id="myname"
							value="${param.name}" class="form-control input-lg">
						<div class="input-group-btn">
							<input class="btn btn-lg btn-primary" type="submit" value="搜索">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
        	<c:forEach items="${result.data}" var="user">
        		<div class="col-sm-4">
	                <div class="contact-box">
	                    <a href="profile.html">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="${pageContext.request.contextPath }/static/img/a2.jpg">
	                                <div class="m-t-xs font-bold">CTO</div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>${user.name}</strong></h3>
	                            <p><i class="fa fa-map-marker"></i> 甘肃·兰州</p>
	                            <address>
		                            <strong>Baidu, Inc.</strong><br>
		                            E-mail:${user.email}<br>
		                            Weibo:<a href="">http://weibo.com/xxx</a><br>
		                            <abbr title="Phone">Tel:</abbr> ${user.tel}
	                        	</address>
	                        </div>
	                       <div class="clearfix"></div>
	                    </a>
	                </div>
	            </div>
        	</c:forEach>
        </div>
    </div>




	<!-- 底部分页按钮 -->
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li>
			      <a href="${pageContext.request.contextPath }/back/user/toUserList?page=${result.page-1 <= 0 ? 1 : result.page-1}&name=${param.name}" aria-label="Previous">
			        <span aria-hidden="true">首页</span>
			      </a>
			    </li>
			    <li><a href="${pageContext.request.contextPath }/back/user/toUserList?page=${result.page-1 <= 0 ? 1 : result.page-1 }&name=${param.name}">上一页</a></li>
			    <li><a href="${pageContext.request.contextPath }/back/user/toUserList?page=${result.page+1 >= result.totalPage ? result.totalPage : result.page+1}&name=${param.name}">下一页</a></li>
			    <li>
			      <a href="${pageContext.request.contextPath }/back/user/toUserList?page=${result.totalPage }&name=${param.name}" aria-label="Next">
			        <span aria-hidden="true">尾页</span>
			      </a>
			    </li>
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
</body>
 <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>
    <script>
        $(document).ready(function () {
            $('.contact-box').each(function () {
                animationHover(this, 'pulse');
            });
        });
    </script>
<script type="text/javascript">
	
	function delUser(id){
		alert(id);
	}
</script>
</html>
