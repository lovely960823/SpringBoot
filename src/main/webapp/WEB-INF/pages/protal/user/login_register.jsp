<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>翻转式用户登录注册界面设计</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/loginRegister/css/styles.css">
	 <!-- 自己的css -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	<!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath }/static/wechat/qrcode.js" type="text/javascript" ></script>
	<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
	<!--[if IE]>
		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
	<style type="text/css">
body {
	background: #fff;
	background-image: url("${pageContext.request.contextPath }/static/loginRegister/img/bg1.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

</style>
</head>
<body>
	<div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
				<div class="login-form">
					<div class="sign-in-htm">
						<form method="post"  id="form1" autocomplete="off">
							<div class="group">
								<label for="user" class="label">用户名</label>
								<input name="name" id="log_name" type="text" class="input">
							</div>
							<div class="group">
								<label for="pass" class="label">密码</label>
								<input name="password" id="log_password" class="input" data-type="password">
							</div>
							<div class="group">
								<input type="button" id="theButton" class="button" value="登录" onclick="ensuresubmit()">
							</div>
						</form>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="${pageContext.request.contextPath }/protal/user/qqLogin">QQ登录</a>
							<a href="${pageContext.request.contextPath }/protal/user/wxLogin">微信登录</a>
							<input type="hidden" id="sessionId"/>
							<div id="code"></div> 
							<div id="userinfo"></div> 
							<a href="#forgot">忘记密码?</a>
						</div>
					</div>
					<div class="sign-up-htm">
						<form method="post"  id="form2" autocomplete="off">
							<div class="group">
								<label for="user" class="label">用户名</label>
								<input name="name" id="reg_name" type="text" class="input" onblur="checkName()">
							</div>
							<div class="group">
								<label for="pass" class="label">密码</label>
								<input name="password" id="reg_password" type="password" class="input" data-type="password">
							</div>
							<div class="group">
								<label for="pass" class="label">确认密码</label>
								<input name="password1" id="reg_password1" type="password" class="input" data-type="password">
							</div>
							<div class="group">
								<label for="pass" class="label">邮箱</label>
								<input name="email" id="email" type="text" class="input" >
							</div>
							<div class="group">
								<label for="pass" class="label">验证码</label>
								<input name="code" id="code" type="text" class="myclass">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input id="btnSendCode1" type="button" class="myclass"  value="获取验证码" onClick="sendMessage1()">
							</div>
							<div class="group">
								<input type="button" onclick="ensuresubmit1()" class="button" value="注册">
							</div>
						</form>
						<div class="hr"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
//用户登录的
function ensuresubmit(){
	var name=$('#log_name').val();
	var password=$('#log_password').val();
	if(name==null||name==''){
    	layer.alert('请输入用户名！');
		return false;
	}
	if(password==null||password==''){
		layer.alert('请输入密码！');
		return false;
	}
	 $.ajax({
        	url:"${pageContext.request.contextPath }/protal/user/login",
        	data:$("#form1").serialize(),
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			//获取上一页的url:document.referrer
        			 var last=document.referrer;
        			if(last.indexOf("protal/user/toLogin")){
        				window.location.href="${pageContext.request.contextPath }/protal/note/noteList";
        			}else{
        				window.location.href=document.referrer;  //返回上一页的URL并刷新
        			} 
        		}else{
        			layer.alert('用户名或者密码不正确');
        		}
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });        	
}

//给确认按钮绑定submit事件
$("body").keydown(function() {
    if (event.keyCode == "13") {//keyCode=13是回车键
        $('#theButton').click();//换成按钮的id即可
    }
});


//用户注册的
var emailreg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达
        //用户名查重
        function checkName(){
        	var name=$('#reg_name').val();
        	$.ajax({
            	url:"${pageContext.request.contextPath }/protal/user/checkName",
            	data:{"name":name},
            	type:"POST",
            	success:function(data){
            		if(data>0){
            			layer.alert('该用户名已经存在');
            			$('#reg_name').val('');
            			$("#reg_name").focus();
            		}
            	},
            	error:function(){
            		layer.alert("服务器忙");
            	},
            	dataType:"json"
            });        	
        }
        
        //邮箱验证码
        var count = 60; //设置每次验证码的有效时间，间隔函数，1秒执行
		var InterValObj1; //timer变量，控制时间
		var curCount1;//当前剩余秒数
		var random= Math.floor(Math.random()*(1000-9999))+9999;//产生四位随机数
		/*第一*/
		function sendMessage1() {
			curCount1 = count;		 		 
			var em = $.trim($('#email').val());
			 if (!emailreg.test(em)) {
				 layer.alert(" 请输入有效的邮箱地址"); 
				return false;
			} 
			random= Math.floor(Math.random()*(1000-9999))+9999;//第二次及以后每点击一次发送，都重新赋值 否则random为null
			var myEmail=$('#email').val();
			sendEmail(random,myEmail);//发送邮件
			//设置button效果，开始计时
			$("#btnSendCode1").attr("disabled", "true");
			$("#btnSendCode1").val( + curCount1 + "秒再获取");
			InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次
			//向后台发送处理数据
		}
        
		//剩余时间显示
		function SetRemainTime1() {
			if (curCount1 == 0) {                
				window.clearInterval(InterValObj1);//停止计时器
				$("#btnSendCode1").removeAttr("disabled");//启用按钮
				$("#btnSendCode1").val("重新发送");
				random='';//时间到了，清空验证码的值
			}
			else {
				curCount1--;
				$("#btnSendCode1").val( + curCount1 + "秒再获取");
			}
		} 
        
		function sendEmail(emailcode,myEmail){
			$.ajax({
		       	url:"${pageContext.request.contextPath }/protal/user/sendEmail",
		       	data:{"emailcode":emailcode,"myEmail":myEmail},
		       	type:"POST",
		       	success:function(data){
		       		if(data>0){
		       			layer.alert('邮件已经发送到您的邮箱，请注意查收');
		       		}else{
		       			layer.alert("邮件未发送成功，请联系管理员");
		       		}
		       	},
		       	error:function(){
		       		layer.alert("服务器忙");
		       	},
		       	dataType:"json"
		       });  
		}
        
        
        //注册提交
        function ensuresubmit1(){
        	var name=$('#reg_name').val();
        	var password=$('#reg_password').val();
        	var password1=$('#reg_password1').val();
        	var code=$('#code').val();
        	var em = $.trim($('#email').val());
        	if(name==null||name==''){
        		layer.alert('请输入用户名！');
        		return false;
        	}
        	if(password==null||password==''){
        		layer.alert('请输入密码！');
        		return false;
        	}
        	if(password!=password1){
        		layer.alert('请确保两次输入的密码一致！');
        		return false;
        	}
			 if (!emailreg.test(em)) {
				 layer.alert(" 请输入有效的邮箱地址"); 
				return false;
			} 
			 if(code==null||code==''){
				 layer.alert('请获取验证码');
	        		return false;
	        	}
        	if(code!=random){
        		layer.alert('无效验证码');
        		return false;
        	}
        	 $.ajax({
                	url:"${pageContext.request.contextPath }/protal/user/doRegister",
                	data:$("#form2").serialize(),
                	type:"POST",
                	success:function(data){
                		if(data>0){
                			layer.alert("注册成功", {
                                icon : 1
                                }, function() {
                                    // 可以对父窗口进行刷新 
                                	window.location.href="${pageContext.request.contextPath }/protal/user/toLogin";
                                });
                		}
                	},
                	error:function(){
                		alert("服务器忙");
                	},
                	dataType:"json"
                });        	
        }
</script>
</html>