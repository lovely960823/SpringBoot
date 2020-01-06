<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">

<title>jQuery计算器带操作记录</title>
<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/calculator/css/style.css" media="screen" type="text/css" />
<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
</head>
<body>

<div id="container">
<div id="the-calculator">
<div id="the-display">
  <form name="calculator">
	<span id="total">0</span>
  </form>
</div>
<div id="the-buttons">
  <div class="button-row clearfix">
	<button id="calc_clear" value="C/E" >C/E</button>
	<button id="calc_back" value="&larr;" >&larr;</button>
	<button id="calc_neg" value="-/+" >-/+</button>
	<button class="calc_op" value="/" >&divide;</button>
  </div>
  <div class="button-row clearfix">
	<button class="calc_int" value="7" >7</button>
	<button class="calc_int" value="8" >8</button>
	<button class="calc_int" value="9" >9</button>
	<button class="calc_op" value="*" >&times;</button>
  </div>
  <div class="button-row clearfix">
	<button class="calc_int" value="4" >4</button>
	<button class="calc_int" value="5" >5</button>
	<button class="calc_int" value="6" >6</button>
	<button class="calc_op" value="-" >-</button>
  </div>
  <div class="button-row clearfix">
	<button class="calc_int" value="1" >1</button>
	<button class="calc_int" value="2" >2</button>
	<button class="calc_int" value="3" >3</button>
	<button class="calc_op" value="+" >+</button>
  </div>
  <div class="button-row clearfix">
	<button id="calc_zero" class="calc_int" value="0" >0</button>
	<button id="calc_decimal" value="." >.</button>
	<button id="calc_eval" value="=" >=</button>
  </div>
  <div id="extra-buttons" class="button-row">
	<button id="calc_denom" value="1/x" ><span class="denominator"><span class="denom-top">1</span><span class="denom-slash">/</span><span class="denom-btm">x</span></span></button>
	<button id="calc_sqrt" value="&radic;" >&radic;</button>
	<button id="calc_square" value="x2" >x<span class="exponent">2</span></button>
	<button id="calc_powerof" class="calc_op" value="^" >y<span class="exponent">x</span></button>
  </div>
</div>
</div>
<div id="the-results">
<ul id="results_list"><li id="result_default">暂无计算记录</li></ul>
<a id="result_clear" href="#" style="color:green">清空</a>
</div>
<div >
<a href="javascript:void(0)" onclick="getCount()" style="color:red">保存数据</a>
</div>
</div>
	<!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/static/calculator/js/index.js"></script>
</body>
<script type="text/javascript">
	function getCount(){
		var count = $('#total').html();
		layer.confirm('敏感操作，确定要继续执行吗？', function(index){
			$.ajax({
		       	url:"${pageContext.request.contextPath }/back/views/getTodayCounts",
		       	data:{"count":count},
		       	type:"POST",
		       	success:function(data){
		       		if(data==1){
		       			layer.alert('今日份修改成功');
		       		}else if(data==2){
		       			layer.alert('今日份记录成功');
		       		}else{
		       			layer.alert("服务器忙");
		       		}
		       	},
		       	error:function(){
		       		layer.alert("服务器忙");
		       	},
		       	dataType:"json"
		       });        	
		});
	}
</script>
</html>