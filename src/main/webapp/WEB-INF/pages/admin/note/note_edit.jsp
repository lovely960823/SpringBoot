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

    <title>帖子发布</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	 <!-- 富文本编辑器 -->
	<script charset="utf-8" src="${pageContext.request.contextPath }/static/editor/kindeditor.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/static/editor/lang/zh_CN.js"></script>
    <!-- 日期插件 -->
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
	 <script type="text/javascript">
        var editor;
            KindEditor.ready(function(K) {
                editor = K.create('textarea[name="contents"]', {
                    //uploadJson : '${pageContext.request.contextPath }/manager/news/uploadImage.do',
                    uploadJson : '${pageContext.request.contextPath }/js/editor/jsp/upload_json.jsp',
                    fileManagerJson : '${pageContext.request.contextPath }/js/editor/jsp/file_manager_json.jsp',   //可以不写
                    allowFileManager : false,width:"90%",height:"300px",resizeType:1, filePostName : 'file',
                    items : [
                            'source','preview', '|', 'undo', 'redo', '|',  'copy', 'paste',
                            'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                            'justifyfull', '|','media', 'insertfile', 'table',  '|',  '/',
                            'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                            'italic', 'underline', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                              '|','emoticons',  '|', 'about'
                        ],
                    afterBlur: function () { this.sync(); }
                });
            });//resizeType : 0,是否可改变编辑器大小0不可以，1可改高度，2都可以。默认为2
        </script>
</head>

<body >
	<h2 align="center">发布</h2>
<br>
		<form class="form-horizontal" role="form" autocomplete="off" id="form1">
			<input name="id" value="${note.id}" type="hidden">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="firstname" name="title"
						value="${note.title}" placeholder="请输入标题">
				</div>
			</div>
			
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">时间</label>
				<div class="col-sm-9">
					<input type="text" id="hello"  value="<fmt:formatDate value="${note.createTime}" pattern="yyyy-MM-dd" /> " name="createTime" class="laydate-icon form-control layer-date" placeholder="请选择时间">
				</div>
			</div>
			
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">内容</label>
				<div class="col-sm-10">
					 <textarea  name="contents" class="col-sm-2 control-label" id="editor" placeholder="内容">
					 	${note.contents}
					 </textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-9" align="center">
					<input type="button" class="btn btn-primary" value="返回"  onclick="callback()">&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-primary" value="修改" onclick="ensuresubmit()" >
				</div>
			</div>
		</form>

</body>
<!-- 全局js -->
 <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
 <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
 <!-- 自定义js -->
 <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath }/static/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
   //时间插件   外部js调用
   laydate({
       elem: '#hello', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
       event: 'focus' //响应事件。如果没有传入event，则按照默认的click
   });
	
   //提交
   function ensuresubmit(){
	   $.ajax({
       	url:"${pageContext.request.contextPath }/back/note/update",
       	data:$("#form1").serialize(),
       	type:"POST",
       	success:function(data){
       		if(data>0){
       			layer.alert("修改成功", {
                    icon : 1
                    }, function() {
                        // 可以对父窗口进行刷新 
                    	window.location.href="/back/note/noteList";
                    });
       		}
       	},
       	error:function(){
       		layer.alert("服务器忙");
       	},
       	dataType:"json"
       });        	
   }
   
   function callback(){
	   //返回之前页面(页面不重新加载)
	   window.history.go(-1);
   }
</script>
	
</html>
