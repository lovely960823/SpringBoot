<%@ page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Calendar calendar = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String end = sdf.format(new Date());
calendar.setTime(new Date());
calendar.add(Calendar.MONTH, -1);
String start = sdf.format(calendar.getTime());
System.out.println(start+end);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据量分析</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/echarts-4.2.1/dist/echarts.js"></script>
</head>

<body class="gray-bg">
	<div class="layui-fluid">
		<div class="search-form">
			<form action="" method="post" autocomplete="off">
				<div class="input-group">
					<input type="text" style="width: 30%" value="<%=start %>" name="startTime" id="startTime" class="laydate-icon form-control layer-date">
						&nbsp;&nbsp;
					<input type="text" style="width: 30%" value="<%=end %>" name="endTime" id="endTime" class="laydate-icon form-control layer-date">
					<button type="button"  id="searchB"  class="glyphicon glyphicon-zoom-out" onclick='dataAjax()'>查询</button>
				</div>
			</form>
		</div>

		<div class="row">
			<div >
				<div >
					<div id="main" style="width: 100%; height: 500px;"></div>
				</div>
			</div>
		</div>

		
		<br>
		<div class="search-form">
			<span style="color:red">消费总额：</span><span style="color:red" id="totalMoney"></span>
		</div>
	</div>    

	<!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- Peity -->
    <script src="${pageContext.request.contextPath }/static/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>
	<script src="${pageContext.request.contextPath }/static/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
	 //时间插件   外部js调用
	   laydate({
	       elem: '#startTime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	       event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	   });
	
	   laydate({
	       elem: '#endTime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	       event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	   });
		function dataAjax() {
			$.ajax({
				type : "post",
				async : false,
				url : "${pageContext.request.contextPath }/back/views/moneyajaxdata",
				data : {
					"start" : $("#startTime").val(),
					"end" : $("#endTime").val()
				},
				cache : false,
				dataType : "json",
				success : function(data) {
					var totalCount=data.allList[0];
					$('#totalMoney').html(totalCount);//统计一下消费总额度
					makeData(data);
				},
				error : function() {
					alert("操作失败,请联系系统管理员");
				}
			});
		}
		//绘制图形
		function makeData(data) {
			var myChart = echarts.init(document.getElementById('main')); //初始化
			var option = {
				title : {
					text : '日常消费量折线分析图',
					x : 'center'
				},
				dataZoom : [ {
					type : 'slider',
					show : true,
					xAxisIndex : [ 0 ],
					left : '9%',
					bottom : -5,
					start : 0,
					end : 100
				//初始化滚动条
				} ],
				xAxis : {
					type : 'category',
					data : data.xList
				//data: ['2019-09-20', '2019-09-21', '2019-09-22', '2019-09-23', '2019-09-24', '2019-09-25', '2019-09-26']
				},
				yAxis : {
					type : 'value'
				},
				series : [ {
					//data: [820, 932, 901, 934, 1290, 1330, 1320],
					data : data.yList,
					type : 'line',
					itemStyle : {
						normal : {
							label : {
								show : true
							}
						}
					}
				} ],
				noDataLoadingOption : {
					text : '暂无数据',
					effect : 'bubble',
					effectOption : {
						effect : {
							n : 0
						}
					}
				}
			};

			myChart.setOption(option);
		}
		//点击查询
		dataAjax();
	</script>



</body>

</html>
