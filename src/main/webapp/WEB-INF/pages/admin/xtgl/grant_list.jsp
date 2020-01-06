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
	<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.core.js"></script>
	<script src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.excheck.js"></script><!--可设置复选框-->
	<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
		<script type="text/javascript">
		var arrNode='${arrNode}';//树回显需要用到的数据
		var userId='${userId}';//被操作人当前id
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
					url : "${pageContext.request.contextPath }/back/xtgl/noteData",
					data : {},
					type : "POST",
					success : function(data) {
						zTree = $.fn.zTree.init($(treeId), setting, data); //创建树
						//树回显判断  
						if(arrNode.length>0){
							for(var x=0;x<arrNode.length;x++){
								var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
								var _node = treeObj.getNodes();    //获取根节点
								var _nodes = treeObj.transformToArray(_node);   //获取所有节点
								//_nodes==data  数据格式一致，但是内容前后不一致，需要重新判断
								for(var n=0;n<_nodes.length;n++){
									if(arrNode[x]==_nodes[n].id){//找到存在的设置选择状态
							        	_nodes[n].checked=true;
							        	treeObj.updateNode(_nodes[n]);  
									}
						        }
							}
						}
					},
					error : function() {
						alert("服务器忙");
					},
					dataType : "json"
				});
			}
			
			//每次选中一个，调取选中的值
			function zTreeOnCheck(){
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
			}
			//js调用代码获取选中的值
			$(document).ready(function() {
			    createTree("jsonData.json", "#treeDemo"); //创建
			    $("#myButton").click(function() {
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
			        $('#myDataNames').val(nodeNames);
			        var nodeIds=nodeIds.substring(0,nodeIds.length-1);
			        $('#myDataIds').val(nodeIds);
			        //后台授权操作第一步，给role_user表添加数据
			        $.ajax({
						url : "${pageContext.request.contextPath }/back/xtgl/grantFirst",
						data : {"userId":userId},
						type : "POST",
						success : function(data) {
							if(data>0){
								grantSecond(data);//后台授权操作第2步，给role表添加数据
							}else{
								layer.alert("服务器忙");
							}
						},
						error : function() {
							layer.alert("服务器忙");
						},
						dataType : "json"
					});
			    });
			});
			
			
			function grantSecond(ruid){
				var nodeIds=$('#myDataIds').val();
				$.ajax({
					url : "${pageContext.request.contextPath }/back/xtgl/grantSecond",
					data : {"userId":userId,"nodeIds":nodeIds,"ruid":ruid},
					type : "POST",
					success : function(data) {
						if(data>0){
							layer.alert("授权成功", {
		                           icon : 1
		                           }, function() {
		                               // 可以对父窗口进行刷新 
		                               window.location.reload();
		                           });
						}
					},
					error : function() {
						layer.alert("服务器忙");
					},
					dataType : "json"
				});
			}
			
		</script>

	</head>
	<body>
	<div style="margin-left: 50px; margin-top: 10px;">
		我的选择:<input id="myDataNames" type="text" placeholder="选中的内容"  class="form-control" />
		<input id="myDataIds" type="text" placeholder="选中的内容"  class="form-control" />
		<button id="myButton" style="margin-top: 10px;">确定授权</button>
		<ul id="treeDemo" class="ztree"
			style="margin-top: 10px; width: 200px; height: 150px;">
		</ul>
	</div>

</body>
</html>
