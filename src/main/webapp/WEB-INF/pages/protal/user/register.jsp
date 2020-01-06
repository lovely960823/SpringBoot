<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/style.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
    #btnSendCode1{
				width: 90px;
				height: 30px;  
				padding: 0 5px;
				margin: 0;
				font-size: 14px;
				text-align: center;
				background: transparent;
				border-radius: 30px;
				color: #a07941;
				border-color: #a07941;
				 
			}
    </style>
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">H+</h1>

            </div>
            <h3>欢迎注册 </h3>
            <p>创建一个新账户</p>
            <form class="m-t" role="form" action="login.html" id="form1" autocomplete="off">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" id="name" placeholder="请输入用户名" onblur="checkName()">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码" required="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password1" id="password1" placeholder="请再次输入密码" required="">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱地址" required="">
                </div>
                <div class="form-group" >
                    <input type="text" class="form-control" name="code" id="code" placeholder="请输四位验证码" required="" >
                </div>
                <div class="form-group text-left">
                    <div class="checkbox i-checks">
                        <label class="no-padding">
                            <input id="btnSendCode1" type="button" class="btn btn-default" value="获取验证码" onClick="sendMessage1()"> </label>
                    </div>
                </div>
                <button type="button" onclick="ensuresubmit()" class="btn btn-primary block full-width m-b">注 册</button>

                <p class="text-muted text-center"><small>已经有账户了？</small><a href="/protal/user/toLogin" >点此登录</a>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- iCheck -->
    <script src="/static/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
        var emailreg = /^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/; //正则表达
        //用户名查重
        function checkName(){
        	var name=$('#name').val();
        	$.ajax({
            	url:"/protal/user/checkName",
            	data:{"name":name},
            	type:"POST",
            	success:function(data){
            		if(data>0){
            			alert('该用户名已经存在');
            			$('#name').val('');
            			$("#name").focus();
            		}
            	},
            	error:function(){
            		alert("服务器忙");
            	},
            	dataType:"json"
            });        	
        }
        
        //邮箱验证码
        var count = 30; //设置每次验证码的有效时间，间隔函数，1秒执行
		var InterValObj1; //timer变量，控制时间
		var curCount1;//当前剩余秒数
		var random= Math.floor(Math.random()*(1000-9999))+9999;//产生四位随机数
		/*第一*/
		function sendMessage1() {
			curCount1 = count;		 		 
			var em = $.trim($('#email').val());
			 if (!emailreg.test(em)) {
				alert(" 请输入有效的邮箱地址"); 
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
		       	url:"/protal/user/sendEmail",
		       	data:{"emailcode":emailcode,"myEmail":myEmail},
		       	type:"POST",
		       	success:function(data){
		       		if(data>0){
		       			alert('邮件已经发送到您的邮箱，请注意查收');
		       		}else{
		       			alert("邮件未发送成功，请联系管理员");
		       		}
		       	},
		       	error:function(){
		       		alert("服务器忙");
		       	},
		       	dataType:"json"
		       });  
		}
        
        
        //注册提交
        function ensuresubmit(){
        	var name=$('#name').val();
        	var password=$('#password').val();
        	var password1=$('#password1').val();
        	var code=$('#code').val();
        	var em = $.trim($('#email').val());
        	if(name==null||name==''){
            	alert('请输入用户名！');
        		return false;
        	}
        	if(password==null||password==''){
        		alert('请输入密码！');
        		return false;
        	}
        	if(password!=password1){
        		alert('请确保两次输入的密码一致！');
        		return false;
        	}
			 if (!emailreg.test(em)) {
				alert(" 请输入有效的邮箱地址"); 
				return false;
			} 
			 if(code==null||code==''){
	        		alert('请获取验证码');
	        		return false;
	        	}
        	if(code!=random){
        		alert('无效验证码');
        		return false;
        	}
        	 $.ajax({
                	url:"/protal/user/doRegister",
                	data:$("#form1").serialize(),
                	type:"POST",
                	success:function(data){
                		if(data>0){
                			alert('注册成功');
                			window.location.reload();
                		}
                	},
                	error:function(){
                		alert("服务器忙");
                	},
                	dataType:"json"
                });        	
        }
        
    </script>

    
    

</body>

</html>
