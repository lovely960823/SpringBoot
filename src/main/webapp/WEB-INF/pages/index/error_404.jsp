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
		<title>404</title>
		<meta name="viewpoint" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/error_css/css/404.css" />
		<script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    	<script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
	</head>
	<body>
		<div class="code">
			<p>ERROR 404</p>
		</div>
		<div class="road">
			<div class="shadow">
				<div class="shelt">
					<div class="head">
						<div class="eyes">
							<div class="lefteye">
								<div class="eyeball"></div>
								<div class="eyebrow"></div>
							</div>
							<div class="righteye">
								<div class="eyeball"></div>
								<div class="eyebrow"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="hat"></div>
				<div class="bubble">
					<a href="${pageContext.request.contextPath }/protal/note/noteList">Go back Home?</a>
				</div>
			</div>
			<p>未找到对应页面</p>
		</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/error_css/js/404.js" ></script>
</html>
