<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title> - 数据表格</title>
    <!-- 自己的js/css -->
    <script src="/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
	<link href="/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- 富文本编辑器 -->
	<script charset="utf-8" src="/static/editor/kindeditor.js"></script>
    <script charset="utf-8" src="/static/editor/lang/zh_CN.js"></script>
</head>

<body >
	<%--富文本编辑器 --%>	
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
        
        <textarea  name="contents" required lay-verify="required" class="layui-textarea"  required="" id="editor" placeholder="内容"></textarea>
</body>
<script type="text/javascript">
	
</script>
</html>
