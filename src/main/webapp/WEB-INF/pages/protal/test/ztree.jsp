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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 基础表格</title>
	<script src="/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	<link rel="stylesheet" href="/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="/static/ztree/js/jquery.ztree.core.js"></script>
	<script src="/static/ztree/js/jquery.ztree.excheck.js"></script><!--可设置复选框-->
	<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
		<script type="text/javascript">
			function createTree(url, treeId) {
				var zTree; //用于保存创建的树节点
				var setting = { //设置
					check : {//设置为复选框所需要的
						enable : true,
					},
					view : {
						showLine : true, //显示辅助线
						dblClickExpand : true,
					},
					data : {
						simpleData : {
							enable : true,
							idKey : "id",
							pIdKey : "parentId",
							rootPId : 0
						}
					},
					callback: {
						onCheck: zTreeOnCheck
					}
				};
				//拿到封装好的额数据
				$.ajax({
					url : "/myNodeData",
					data : {},
					type : "POST",
					success : function(data) {
						zTree = $.fn.zTree.init($(treeId), setting, data); //创建树
					},
					error : function() {
						alert("服务器忙");
					},
					dataType : "json"
				});
			}
			
			//js调用代码获取选中的值
			$(document).ready(function() {
			    createTree("jsonData.json", "#treeDemo"); //创建
			    /* $("#myButton").click(function() {
			        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			        var nodes = treeObj.getCheckedNodes(true);
			        if(0 === nodes.length) {
			        	layer.alert("请选择!");
			            return;
			        }
			        var nodeNames = "";
			        var nodeIds="";
			        for(var i = 0; i < nodes.length; i++) {
			        	nodeNames += nodes[i].name + ",";
			        	nodeIds+= nodes[i].id + ",";
			        }
			        var nodeNames=nodeNames.substring(0,nodeIds.length-1);
			        var nodeIds=nodeIds.substring(0,nodeIds.length-1);
			        $('#myDataNames').val(nodeNames);
			        $('#myDataIds').val(nodeIds);
			    }); */
			});
			//进来的时候默认不显示
			function showTree(){
				$('#treeDemo').show();
			}
			//回调函数
			function zTreeOnCheck(){
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		        var nodes = treeObj.getCheckedNodes(true);
		        var nodeNames = "";
		        var nodeIds="";
		        for(var i = 0; i < nodes.length; i++) {
		        	nodeNames += nodes[i].name + ",";
		        	nodeIds+= nodes[i].id + ",";
		        }
		        var nodeNames=nodeNames.substring(0,nodeIds.length-1);
		        var nodeIds=nodeIds.substring(0,nodeIds.length-1);
		        $('#myDataNames').val(nodeNames);
		        $('#myDataIds').val(nodeIds);
			}
			
			function getValue(){
				alert($('#myDataNames').val());
				alert($('#myDataIds').val());
			}
		</script>

	</head>
	<body>
	<div style="margin-left: 50px; margin-top: 10px;">
		我的选择:<input id="myDataNames" type="text" placeholder="选中的内容"  class="form-inline" onclick="showTree()"/>
		<input id="myDataIds" type="text" placeholder="选中的内容ids"  class="form-inline" />
		<button id="myButton" style="margin-top: 10px;" onclick="getValue()">确定</button>
		<ul id="treeDemo" class="ztree"  
			style="margin-top: 10px; width: 200px; height: 150px;display: none">
		</ul>
	</div>

</body>
</html>
