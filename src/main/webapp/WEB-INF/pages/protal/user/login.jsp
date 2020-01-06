<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/login.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-12">
                <form method="post"  id="form1" autocomplete="off">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录可享更多特权</p>
                    <input type="text" name="name" id="name" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="password" id="password" class="form-control pword m-b" placeholder="密码" />
                    <a href="">忘记密码了？</a><a href="/protal/user/toRegister" target="_blank">注册</a>
                    <input type="button" id="theButton" class="btn btn-success btn-block" onclick="ensuresubmit()" value="登录"> 
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; hAdmin
            </div>
        </div>
    </div>
</body>
 <!-- 全局js -->
    <script src="/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript">
function ensuresubmit(){
	var name=$('#name').val();
	var password=$('#password').val();
	if(name==null||name==''){
    	alert('请输入用户名！');
		return false;
	}
	if(password==null||password==''){
		alert('请输入密码！');
		return false;
	}
	 $.ajax({
        	url:"/protal/user/login",
        	data:$("#form1").serialize(),
        	type:"POST",
        	success:function(data){
        		if(data>0){
        			//获取上一页的url:document.referrer
        			var last=document.referrer;
        			if(last.indexOf("protal/user/toRegister")){
        				window.location.href="/protal/note/noteList";
        			}else{
        				window.location.href=document.referrer;  //返回上一页的URL并刷新
        			}
        		}else{
        			alert('用户名或者密码不正确');
        		}
        	},
        	error:function(){
        		alert("服务器忙");
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
</script>
</html>
